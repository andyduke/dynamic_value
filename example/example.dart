import '../lib/dynamic_value.dart';

void main() {
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
  };

  DynamicValue.builders[Group] = (data) => Group.fromData(data);

  final value = DynamicValue(json);

  final int? userId = value['id'].toInt;
  final String? userName = value['name'].toStr;
  final DateTime? userCreatedAt = value['created'].toDateTime;
  final int? userGroupId = value['groups'][0]['id'].toInt;
  final Group? userFirstGroup = value['groups'][0].to<Group>();
  final List<Group>? userGroups = value['groups'].toList<Group>();

  print('User ID: $userId');
  print('User name: $userName');
  print('User created at: $userCreatedAt');
  print('User group ID: $userGroupId');
  print('User first group: $userFirstGroup');
  print('User groups: $userGroups');
}

class Group {
  final int? id;
  final String? name;

  Group({
    this.id,
    this.name,
  });

  factory Group.fromData(DynamicValue data) {
    return Group(
      id: data['id'].toInt,
      name: data['name'].toStr,
    );
  }

  @override
  String toString() {
    return '<Group #$id: $name>';
  }
}
