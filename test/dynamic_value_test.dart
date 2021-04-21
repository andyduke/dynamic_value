import 'dart:convert';
import 'package:test/test.dart';
import 'package:dynamic_value/dynamic_value.dart';

void main() {
  group('Num', () {
    test('casting from num', () {
      final num value = 7;
      final dynValue = DynamicValue(value);

      expect(dynValue.toNum, value);
    });

    test('casting from int', () {
      final int value = 7;
      final dynValue = DynamicValue(value);

      final num expected = value;
      expect(dynValue.toNum, expected);
    });

    test('casting from double', () {
      final double value = 7.0;
      final dynValue = DynamicValue(value);

      final num expected = value;
      expect(dynValue.toNum, expected);
    });

    test('casting from bool', () {
      final bool value = false;
      final dynValue = DynamicValue(value);

      final num expected = 0;
      expect(dynValue.toNum, expected);
    });

    test('casting from wrong type', () {
      final Map value = {};
      final dynValue = DynamicValue(value);

      final num? expected = null;
      expect(dynValue.toNum, expected);
    });

    test('parsing from string', () {
      final num value = 7;
      final dynValue = DynamicValue('$value');

      expect(dynValue.toNum, value);
    });

    test('parsing from invalid string', () {
      final String value = 'invalid string';
      final dynValue = DynamicValue(value);

      final num? expected = null;
      expect(dynValue.toNum, expected);
    });

    test('toNum convert', () {
      final num value = 7;
      final dynValue = DynamicValue(value);

      expect(dynValue.toNum, value);
    });

    test('toInt convert', () {
      final num value = 7;
      final dynValue = DynamicValue(value);

      expect(dynValue.toInt, value.toInt());
    });

    test('toDouble convert', () {
      final num value = 7;
      final dynValue = DynamicValue(value);

      expect(dynValue.toDouble, value.toDouble());
    });

    test('toStr convert', () {
      final num value = 7;
      final dynValue = DynamicValue(value);

      expect(dynValue.toStr, '$value');
    });
  });

  group('Int', () {
    test('casting from int', () {
      final int value = 7;
      final dynValue = DynamicValue(value);

      expect(dynValue.toInt, value);
    });

    test('casting from num', () {
      final num value = 7;
      final dynValue = DynamicValue(value);

      expect(dynValue.toInt, value.toInt());
    });

    test('casting from double', () {
      final double value = 7.0;
      final dynValue = DynamicValue(value);

      expect(dynValue.toInt, value.toInt());
    });

    test('casting from bool', () {
      final bool value = false;
      final dynValue = DynamicValue(value);

      final num expected = 0;
      expect(dynValue.toInt, expected);
    });

    test('casting from wrong type', () {
      final Map value = {};
      final dynValue = DynamicValue(value);

      final num? expected = null;
      expect(dynValue.toInt, expected);
    });

    test('parsing from string', () {
      final int value = 7;
      final dynValue = DynamicValue('$value');

      expect(dynValue.toInt, value);
    });

    test('parsing from invalid string', () {
      final String value = 'invalid string';
      final dynValue = DynamicValue(value);

      final num? expected = null;
      expect(dynValue.toInt, expected);
    });

    test('toInt convert', () {
      final int value = 7;
      final dynValue = DynamicValue(value);

      expect(dynValue.toInt, value);
    });

    test('toNum convert', () {
      final int value = 7;
      final dynValue = DynamicValue(value);

      final num expected = value;
      expect(dynValue.toNum, expected);
    });

    test('toDouble convert', () {
      final int value = 7;
      final dynValue = DynamicValue(value);

      final double expected = value.toDouble();
      expect(dynValue.toDouble, expected);
    });

    test('toStr convert', () {
      final int value = 7;
      final dynValue = DynamicValue(value);

      expect(dynValue.toStr, '$value');
    });
  });

  group('Double', () {
    test('casting from int', () {
      final int value = 7;
      final dynValue = DynamicValue(value);

      final double expected = value.toDouble();
      expect(dynValue.toDouble, expected);
    });

    test('casting from num', () {
      final num value = 7;
      final dynValue = DynamicValue(value);

      final double expected = value.toDouble();
      expect(dynValue.toDouble, expected);
    });

    test('casting from double', () {
      final double value = 7.1;
      final dynValue = DynamicValue(value);

      expect(dynValue.toDouble, value);
    });

    test('casting from bool', () {
      final bool value = false;
      final dynValue = DynamicValue(value);

      final num expected = 0;
      expect(dynValue.toDouble, expected);
    });

    test('casting from wrong type', () {
      final Map value = {};
      final dynValue = DynamicValue(value);

      final num? expected = null;
      expect(dynValue.toDouble, expected);
    });

    test('parsing from string', () {
      final double value = 7.1;
      final dynValue = DynamicValue('$value');

      expect(dynValue.toDouble, value);
    });

    test('parsing from invalid string', () {
      final String value = 'invalid string';
      final dynValue = DynamicValue(value);

      final num? expected = null;
      expect(dynValue.toDouble, expected);
    });

    test('toInt convert', () {
      final double value = 7.1;
      final dynValue = DynamicValue(value);

      expect(dynValue.toInt, value.toInt());
    });

    test('toNum convert', () {
      final double value = 7.1;
      final dynValue = DynamicValue(value);

      final num expected = value;
      expect(dynValue.toNum, expected);
    });

    test('toDouble convert', () {
      final double value = 7.1;
      final dynValue = DynamicValue(value);

      expect(dynValue.toDouble, value);
    });

    test('toStr convert', () {
      final double value = 7.1;
      final dynValue = DynamicValue(value);

      expect(dynValue.toStr, '$value');
    });
  });

  group('Bool', () {
    test('casting from bool', () {
      final bool value = true;
      final dynValue = DynamicValue(value);

      expect(dynValue.toBool, value);
    });

    test('casting from num', () {
      final num value = 1;
      final dynValue = DynamicValue(value);

      final bool expected = value == 0 ? false : true;
      expect(dynValue.toBool, expected);
    });

    test('casting from int', () {
      final int value = 1;
      final dynValue = DynamicValue(value);

      final bool expected = value == 0 ? false : true;
      expect(dynValue.toBool, expected);
    });

    test('casting from double', () {
      final double value = 1.0;
      final dynValue = DynamicValue(value);

      final bool expected = value == 0 ? false : true;
      expect(dynValue.toBool, expected);
    });

    test('casting from wrong type', () {
      final Map value = {};
      final dynValue = DynamicValue(value);

      final bool expected = false;
      expect(dynValue.toBool, expected);
    });

    test('parsing from string (num)', () {
      final int value = 1;
      final dynValue = DynamicValue('$value');

      final bool expected = value == 0 ? false : true;
      expect(dynValue.toBool, expected);
    });

    test('parsing from string (text)', () {
      final bool value = true;
      final dynValue = DynamicValue('$value');

      expect(dynValue.toBool, value);
    });

    test('parsing from invalid string', () {
      final String value = 'invalid string';
      final dynValue = DynamicValue(value);

      final bool expected = false;
      expect(dynValue.toBool, expected);
    });

    test('toInt convert', () {
      final bool value = true;
      final dynValue = DynamicValue(value);

      final int expected = value ? 1 : 0; // ignore: dead_code
      expect(dynValue.toInt, expected);
    });

    test('toNum convert', () {
      final bool value = true;
      final dynValue = DynamicValue(value);

      final num expected = value ? 1 : 0; // ignore: dead_code
      expect(dynValue.toInt, expected);
    });

    test('toDouble convert', () {
      final bool value = true;
      final dynValue = DynamicValue(value);

      final num expected = value ? 1 : 0; // ignore: dead_code
      expect(dynValue.toDouble, expected);
    });

    test('toStr convert', () {
      final bool value = true;
      final dynValue = DynamicValue(value);

      expect(dynValue.toStr, '$value');
    });
  });

  group('DateTime', () {
    test('casting from DateTime', () {
      final DateTime value = DateTime.now();
      final dynValue = DynamicValue(value);

      expect(dynValue.toDateTime, value);
    });

    test('casting from wrong type', () {
      final Map value = {};
      final dynValue = DynamicValue(value);

      final DateTime? expected = null;
      expect(dynValue.toDateTime, expected);
    });

    test('parsing from string', () {
      final DateTime timestamp = DateTime.now();
      final DateTime value = DateTime(
        timestamp.year,
        timestamp.month,
        timestamp.day,
        timestamp.hour,
        timestamp.minute,
        timestamp.second,
      );
      String stringValue =
          '${value.year.toString()}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')} ${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}:${value.second.toString().padLeft(2, '0')}';
      final dynValue = DynamicValue(stringValue);

      expect(dynValue.toDateTime, value);
    });

    test('parsing from invalid string', () {
      final String value = 'invalid string';
      final dynValue = DynamicValue(value);

      final DateTime? expected = null;
      expect(dynValue.toDateTime, expected);
    });

    test('toInt convert', () {
      final DateTime value = DateTime.now();
      final dynValue = DynamicValue(value);

      final int? expected = null;
      expect(dynValue.toInt, expected);
    });

    test('toNum convert', () {
      final DateTime value = DateTime.now();
      final dynValue = DynamicValue(value);

      final num? expected = null;
      expect(dynValue.toNum, expected);
    });

    test('toDouble convert', () {
      final DateTime value = DateTime.now();
      final dynValue = DynamicValue(value);

      final double? expected = null;
      expect(dynValue.toDouble, expected);
    });

    test('toStr convert', () {
      final DateTime value = DateTime.now();
      final dynValue = DynamicValue(value);

      expect(dynValue.toStr, '$value');
    });
  });

  group('Custom type', () {
    test('using builder parameter', () {
      final Map<String, dynamic> value = {
        'id': 1,
        'name': 'Test',
      };
      final dynValue = DynamicValue(value);

      final User? actual =
          dynValue.to<User>(builder: (data) => User.fromData(data));
      final User expected = User.fromMap(value);
      expect(actual, expected);
    });

    test('using rawBuilder parameter', () {
      final Map<String, dynamic> value = {
        'id': 1,
        'name': 'Test',
      };
      final dynValue = DynamicValue(value);

      final User? actual =
          dynValue.to<User>(rawBuilder: (data) => User.fromMap(data));
      final User expected = User.fromMap(value);
      expect(actual, expected);
    });

    test('using default rawBuilder', () {
      DynamicValue.rawBuilders[User] = (data) => User.fromMap(data);

      final Map<String, dynamic> value = {
        'id': 1,
        'name': 'Test',
      };
      final dynValue = DynamicValue(value);

      final User? actual = dynValue.to<User>();
      final User expected = User.fromMap(value);

      DynamicValue.rawBuilders.remove(User);

      expect(actual, expected);
    });

    test('using default builder', () {
      DynamicValue.builders[User] = (data) => User.fromData(data);

      final Map<String, dynamic> value = {
        'id': 1,
        'name': 'Test',
      };
      final dynValue = DynamicValue(value);

      final User? actual = dynValue.to<User>();
      final User expected = User.fromMap(value);

      DynamicValue.builders.remove(User);

      expect(actual, expected);
    });
  });

  group('List', () {
    test('of int', () {
      final List<int> value = List<int>.generate(5, (index) => index);
      final dynValue = DynamicValue(value);

      final List<int>? actual = dynValue.toList<int>();
      expect(actual, value);
    });

    test('of Custom Type', () {
      final List<User> value = List<User>.generate(
          5, (index) => User(id: index, name: 'Test $index'));
      final dynValue = DynamicValue(value);

      final List<User>? actual =
          dynValue.toList<User>(itemBuilder: (data) => User.fromData(data));
      expect(actual, value);
    });

    test('(Iterable) of int', () {
      final Map<String, dynamic> json = {
        'items': List<int>.generate(5, (index) => index),
      };
      final Map<String, dynamic> map = jsonDecode(jsonEncode(json));
      final value = map['items'];
      final dynValue = DynamicValue(value);

      final List<int>? actual = dynValue.toList<int>();
      expect(actual, value);
    });

    test('of strings from Map', () {
      final Map<String, dynamic> json = {
        'items': {
          '1': 'One',
          '2': 'Two',
        },
      };
      final Map<String, dynamic> map = jsonDecode(jsonEncode(json));
      final value = map['items'];
      final dynValue = DynamicValue(value);

      final List<String>? actual = dynValue.toList<String>();

      final List<String>? expected = json['items'].values.toList();

      expect(actual, expected);
    });
  });

  group('Map', () {
    test('of int', () {
      final Map<String, int> value = {'1': 1, '2': 2, '3': 3};
      final dynValue = DynamicValue(value);

      final Map<String, int?>? actual = dynValue.toMap<String, int>();
      expect(actual, value);
    });

    test('of Custom Type', () {
      final Map<String, dynamic> value = {
        'user1': {'id': 1, 'name': 'Test 1'},
        'user2': {'id': 2, 'name': 'Test 2'},
      };
      final dynValue = DynamicValue(value);

      final Map<String, User?>? actual = dynValue.toMap<String, User>(
          valueBuilder: (data, key) => User.fromData(data));

      final Map<String, User?>? expected = value.map(
        (key, value) => MapEntry(
          key,
          User.fromMap(value),
        ),
      );

      expect(actual, expected);
    });

    test('of Custom Type (JSON)', () {
      final Map<String, dynamic> users = {
        'user1': {'id': 1, 'name': 'Test 1'},
        'user2': {'id': 2, 'name': 'Test 2'},
      };
      final Map<String, dynamic> json = {
        'items': users,
      };
      final Map<String, dynamic> map = jsonDecode(jsonEncode(json));
      final value = map['items'];
      final dynValue = DynamicValue(value);

      final Map<String, User?>? actual = dynValue.toMap<String, User>(
          valueBuilder: (data, key) => User.fromData(data));

      final Map<String, User?>? expected = users.map(
        (key, value) => MapEntry(
          key,
          User.fromMap(value),
        ),
      );

      expect(actual, expected);
    });
  });

  group('Access', () {
    test('single level', () {
      final Map<String, dynamic> value = {
        'id': 1,
        'name': 'Test',
      };
      final dynValue = DynamicValue(value);

      final int? actual = dynValue['id'].toInt;
      final int? expected = value['id'];
      expect(actual, expected);
    });

    test('two levels', () {
      final Map<String, dynamic> value = {
        'id': 1,
        'name': 'Test',
        'group': {
          'name': 'Test group',
        },
      };
      final dynValue = DynamicValue(value);

      final String? actual = dynValue['group']['name'].toStr;
      final String? expected = value['group']['name'];
      expect(actual, expected);
    });

    test('using index', () {
      final Map<String, dynamic> value = {
        'id': 1,
        'name': 'Test',
        'groups': [
          {
            'name': 'Test group',
          },
        ],
      };
      final dynValue = DynamicValue(value);

      final String? actual = dynValue['groups'][0]['name'].toStr;
      final String? expected = value['groups'][0]['name'];
      expect(actual, expected);
    });

    test('non-existed key', () {
      final Map<String, dynamic> value = {
        'id': 1,
        'name': 'Test',
      };
      final dynValue = DynamicValue(value);

      final String? actual = dynValue['group']['name'].toStr;
      final String? expected = null;
      expect(actual, expected);
    });

    test('non-existed index', () {
      final Map<String, dynamic> value = {
        'id': 1,
        'name': 'Test',
        'groups': [],
      };
      final dynValue = DynamicValue(value);

      final String? actual = dynValue['groups'][0]['name'].toStr;
      final String? expected = null;
      expect(actual, expected);
    });
  });

  group('Default values', () {
    test('toNum', () {
      final dynamic value = null;
      final dynValue = DynamicValue(value);

      final num? actual = dynValue['id'].to<num>(defaultValue: 7);
      final num expected = 7;
      expect(actual, expected);
    });

    test('toInt', () {
      final dynamic value = null;
      final dynValue = DynamicValue(value);

      final int? actual = dynValue['id'].to<int>(defaultValue: 7);
      final int expected = 7;
      expect(actual, expected);
    });

    test('toDouble', () {
      final dynamic value = null;
      final dynValue = DynamicValue(value);

      final double? actual = dynValue['id'].to<double>(defaultValue: 7.1);
      final double expected = 7.1;
      expect(actual, expected);
    });

    test('toString', () {
      final dynamic value = null;
      final dynValue = DynamicValue(value);

      final String? actual = dynValue['id'].to<String>(defaultValue: 'default');
      final String expected = 'default';
      expect(actual, expected);
    });

    test('toBool', () {
      final dynamic value = null;
      final dynValue = DynamicValue(value);

      final bool? actual = dynValue['id'].to<bool>(defaultValue: true);
      final bool expected = true;
      expect(actual, expected);
    });

    test('toDateTime', () {
      final dynamic value = null;
      final dynValue = DynamicValue(value);

      final DateTime now = DateTime.now();
      final DateTime? actual = dynValue['id'].to<DateTime>(defaultValue: now);
      final DateTime expected = now;
      expect(actual, expected);
    });

    test('to Custom Type', () {
      final dynamic value = null;
      final dynValue = DynamicValue(value);

      final User defaultUser = User(id: 7, name: 'Test');
      final User? actual = dynValue['id'].to<User>(
          defaultValue: defaultUser, builder: (data) => User.fromData(data));
      final User expected = defaultUser;
      expect(actual, same(expected));
    });
  });
}

class User {
  final int? id;
  final String? name;

  User({
    this.id,
    this.name,
  });

  factory User.fromData(DynamicValue data) {
    return User(
      id: data['id'].toInt,
      name: data['name'].toStr,
    );
  }

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      name: data['name'],
    );
  }

  @override
  String toString() {
    return '<User #$id: $name>';
  }

  bool operator ==(o) =>
      o is User && o.runtimeType == User && o.id == id && o.name == name;
  int get hashCode => id.hashCode ^ name.hashCode;
}
