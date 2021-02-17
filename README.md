# DynamicValue

The easy way to work with JSON data.

## Getting Started

JSON response like this:
```json
final json = {
    "id": 1,
    "name": "User 1",
    "created": "2021-02-17 00:00:00",
    "groups": [
        {
            "id": "1",
            "name": "Group 1",
        },
    ],
}
```

You can access its fields as follows:
```dart
final value = DynamicValue(json);

value['id'].toInt                   // -> 1
value['name'].toStr                 // -> "User 1"
value['created'].toDateTime         // -> DateTime('2021-02-17 00:00:00.000')
value['groups'][0]['id'].toInt      // -> 1
value['groups'][0].to<Group>()      // -> Group(id: 1, name: "Group 1")
value['groups'].toList<Group>()     // -> [Group(id: 1, name: "Group 1")]
```

You don't have to worry about whether there is a key in the object or an index in the list, what type of value is passed (for example, numbers can be represented in JSON both as numbers and as a string), you don't need to convert the date and time to the corresponding object or a nested structure in a model class. DynamicValue takes care of all this.

## Data access

You can use text keys for objects and numeric indexes for lists to access structure fields.

```dart
value['id']     // Key access
value[0]        // Access by index
```

If there is no key or index, or the value is not an object or a list, `DynamicValue` object will be returned with a `null` value.
Otherwise a `DynamicValue` object will be returned with a value that can be converted to the desired type. 

```dart
value['not_existing_key'].toInt                         // null
value[4343].toDouble                                    // null
value['not_existing_key'].toInt ?? 1                    // 1
value['not_existing_key'].to<int>(defaultValue: 1)      // 1
```

This allows you to safely access nested data, if there is no key or index, then the result will be `DynamicValue(null)`, which can be converted to the desired type with a default value or null.


## Data conversion

DynamicValue can be converted to various data types using the `.to<T>()` method:
```dart
value['id'].to<int>()
```

The following types are supported by default:
- num
- int
- double
- bool
- String
- DateTime

There are helper getters for them:
- toNum
- toInt
- toDouble
- toBool
- toStr
- toDateTime

Type conversion can be extended by specifying the type and converter function in the `builders` and `rawBuilders` static properties:
```dart
DynamicValue.builders[User] = User.fromDynamicValue;
DynamicValue.rawBuilders[Group] = Group.fromMap;
```

You can also specify a converter function as a parameter of the `.to<T>()` method:
```dart
data.to<User>(builder: User.fromDynamicValue)           // User(id: 1, ...)
data['groups'][0].to<Group>(rawBuilder: Group.fromMap)  // Group(id: 1, ...)
```

> **For builder**: the converter function must accept `DynamicValue` as input and return the required type.
> 
> **For rawBuilder**: the converter function must accept a dart data type as input (for example Map, List, int, String, etc.) and return the required type. 


You can specify a default value using the `defaultValue` parameter, if the value cannot be converted:
```dart
.to<int>(defaultValue: 4)
```

You can convert a list of values to a list of the specified type using the `.toList<T>()` method:
```dart
value['groups'].toList<Group>()          // <Group>[Group(id: 1, ...)]
```


## Helpers

You can check if an object has a specific key or a specific index in the list using the `.has()` method:
```dart
value.has('id')                  // true
value['groups'].has(2)           // false
```

You can also check if `DynamicValue` contains `null` using the following two properties:
```dart
value.isNull             // Returns true if value is null
value.isNotNull          // Returns true if value is NOT null
```
