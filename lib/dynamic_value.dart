library dynamic_value;

enum DynamicValueType {
  isMap,
  isList,
  isString,
  isNum,
  isBool,
  isNull,
  unknown
}

typedef DynamicValueKeyBuilder<T> = T? Function(dynamic value);
typedef DynamicValueItemBuilder<T> = T? Function(DynamicValue data);
typedef DynamicValueRawItemBuilder<T> = T? Function(dynamic values);

/// Data access with type conversion, it is convenient to use when parsing JSON.
///
/// Examples:
/// ```
/// final jsonResponse = jsonDecode(response);
/// final data = DynamicValue(jsonResponse);
/// data['message']['id'].toInt
/// data['message']['text'].toStr
/// data['message']['timestamp'].toDateTime
/// data['message']['tags'][0]['text'].toStr
/// ```
class DynamicValue {
  /// Type converters from raw data type
  static Map<Type, dynamic Function(dynamic value)> rawBuilders = {
    num: _parseNum,
    int: _parseInt,
    double: _parseDouble,
    bool: _parseBool,
    String: (dynamic value) => '$value',
    DateTime: _parseDateTime,
  };

  /// Type converters from DynamicValue type
  static Map<Type, dynamic Function(DynamicValue data)> builders = {};

  /// Raw type
  final dynamic value;

  DynamicValueType? _type;
  DynamicValueType get type {
    if (_type == null) {
      _type = DynamicValueType.unknown;
      if (value is Map) {
        _type = DynamicValueType.isMap;
      } else if (value is List) {
        _type = DynamicValueType.isList;
      } else if (value is String) {
        _type = DynamicValueType.isString;
      } else if (value is num) {
        _type = DynamicValueType.isNum;
      } else if (value is bool) {
        _type = DynamicValueType.isBool;
      } else if (value == null) {
        _type = DynamicValueType.isNull;
      }
    }
    return _type ?? DynamicValueType.unknown;
  }

  /// Creates an instance of the DynamicValue by wrapping the value.
  DynamicValue(this.value);

  static DynamicValue _nullValue = DynamicValue(null);

  /// Returns true if value is null.
  bool get isNull => value == null;

  /// Returns true if value is not null.
  bool get isNotNull => value != null;

  @override
  String toString() {
    return '$value';
  }

  T? _to<T>(DynamicValue value, dynamic rawValue,
      {T? defaultValue,
      DynamicValueItemBuilder<T>? builder,
      DynamicValueRawItemBuilder<T>? rawBuilder}) {
    assert(builder == null || rawBuilder == null);

    if (rawValue == null) return defaultValue;

    final Type type = T;
    T? result;

    if (rawValue.runtimeType != type) {
      if (builder != null) {
        result = builder.call(value);
      } else if (rawBuilder != null) {
        result = rawBuilder.call(rawValue);
      } else {
        if (builders.containsKey(type)) {
          result = builders[type]!.call(value) as T?;
        } else if (rawBuilders.containsKey(type)) {
          result = rawBuilders[type]!.call(rawValue) as T?;
        }
      }
    } else {
      result = rawValue as T;
    }
    return result ?? defaultValue;
  }

  /// Convert value to T type
  T? to<T>(
      {T? defaultValue,
      DynamicValueItemBuilder<T>? builder,
      DynamicValueRawItemBuilder<T>? rawBuilder}) {
    return _to<T>(
      this,
      value,
      defaultValue: defaultValue,
      builder: builder,
      rawBuilder: rawBuilder,
    );
  }

  /// Convert value to List of T types
  ///
  /// If the value is not [Iterable] or [Map], the [defaultValue] will be returned.
  /// If the value is a [Map], a list of map values, casted to the required type, will be returned.
  ///
  List<T>? toList<T>(
      {List<T>? defaultValue,
      DynamicValueItemBuilder<T>? itemBuilder,
      DynamicValueRawItemBuilder<T>? itemRawBuilder}) {
    assert(itemBuilder == null || itemRawBuilder == null);

    dynamic list = value;
    if (list is Map) list = value.values;
    if (!(list is Iterable)) return defaultValue;

    List<T> result = list
        .map((entry) => _to<T>(DynamicValue(entry), entry,
            builder: itemBuilder, rawBuilder: itemRawBuilder))
        .cast<T>()
        .toList();

    return result;
  }

  T? _defaultKeyBuilder<T>(dynamic value, [T? defaultValue]) {
    final Type type = T;
    T? result;

    if (value.runtimeType != type) {
      if (rawBuilders.containsKey(type)) {
        result = rawBuilders[type]!.call(value) as T?;
      }
    } else {
      result = value as T;
    }

    return result ?? defaultValue;
  }

  /// Convert value to typed Map
  Map<K, V?>? toMap<K, V>({
    Map<K, V>? defaultValue,
    DynamicValueKeyBuilder<K>? keyBuilder,
    DynamicValueItemBuilder<V>? valueBuilder,
    DynamicValueRawItemBuilder<V>? valueRawBuilder,
  }) {
    assert(valueBuilder == null || valueRawBuilder == null);

    if (!(value is Map)) return defaultValue;

    Map<K, V?> result = (value as Map).map<K, V?>((key, value) {
      final K? newKey = (keyBuilder != null)
          ? keyBuilder.call(key)
          : _defaultKeyBuilder<K>(key);
      if (newKey == null) {
        throw DynamicValueNullKeyException();
      }

      final V? newValue = _to<V>(DynamicValue(value), value,
          builder: valueBuilder, rawBuilder: valueRawBuilder);

      final newEntry = MapEntry<K, V?>(
        newKey,
        newValue,
      );
      return newEntry;
    });

    return result;
  }

  String? get toStr => to<String>();
  num? get toNum => to<num>();
  int? get toInt => to<int>();
  double? get toDouble => to<double>();
  bool get toBool => to<bool>(defaultValue: false)!;
  DateTime? get toDateTime => to<DateTime>();

  /// Returns the DynamicValue for the given key or DynamicValue(null) if key is not in the map.
  ///
  /// The key can be an index in a list or a string key in a map.
  DynamicValue operator [](dynamic key) {
    if (key is int) {
      // List index
      if (value is List) {
        final List list = value as List;
        return (key < list.length && key >= 0)
            ? DynamicValue(list[key])
            : _nullValue;
      } else {
        return _nullValue;
      }
    } else if (key is String) {
      // Map key
      if (value is Map) {
        final Map map = value as Map;
        return map.keys.contains(key) ? DynamicValue(map[key]) : _nullValue;
      } else {
        return _nullValue;
      }
    }
    return _nullValue;
  }

  /// Returns true if this map contains the given key or index.
  ///
  /// The key can be an index in a list or a string key in a map.
  bool has(dynamic key) {
    if (key is int) {
      // List index
      if (value is List) {
        final List list = value as List;
        return list.contains(key);
      } else {
        return false;
      }
    } else if (key is String) {
      // Map key
      if (value is Map) {
        final Map map = value as Map;
        return map.keys.contains(key);
      } else {
        return false;
      }
    }
    return false;
  }

  // --- Converters

  static num? _parseNum(dynamic value) {
    if (value is num) {
      return value;
    } else if (value is int) {
      return value;
    } else if (value is double) {
      return value;
    } else if (value is bool) {
      return value ? 1 : 0;
    } else if (value is String) {
      return num.tryParse(value);
    } else {
      return null;
    }
  }

  static int? _parseInt(dynamic value) {
    if (value is int) {
      return value;
    } else if (value is double) {
      return value.toInt();
    } else if (value is num) {
      return value.toInt();
    } else if (value is bool) {
      return value ? 1 : 0;
    } else if (value is String) {
      return int.tryParse(value);
    } else {
      return null;
    }
  }

  static double? _parseDouble(dynamic value) {
    if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    } else if (value is num) {
      return value.toDouble();
    } else if (value is bool) {
      return value ? 1 : 0;
    } else if (value is String) {
      return double.tryParse(value);
    } else {
      return null;
    }
  }

  static bool? _parseBool(dynamic value) {
    if (value is bool) {
      return value;
    } else if ((value is num) || (value is int) || (value is double)) {
      return (value == 0) ? false : true;
    } else if (value is String) {
      final num? parsed = num.tryParse(value);
      return (parsed != null)
          ? (parsed == 0 ? false : true)
          : (value.trim().toLowerCase() == 'true');
    } else {
      return null;
    }
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value is DateTime) {
      return value;
    } else if (value is String) {
      return DateTime.tryParse(value);
    } else {
      return null;
    }
  }
}

class DynamicValueNullKeyException implements Exception {
  @override
  String toString() => 'Exception: The key cannot be null.';
}
