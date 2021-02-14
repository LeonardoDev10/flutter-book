import 'package:sqflite/sqflite.dart';
import 'schema.dart';

import '../model/user.dart';

/// List tables
const String user_table = 'users';
const String userSecret_table = 'user_secrets';
const String userGroup_table = 'user_groups';
const String userAccess_table = 'user_accesses';

/// User Table

/// Insert User
Future<void> createtUser(User user) async {
  final Database db = await getDb();
  await db.insert(user_table, user.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
}

/// List Users
Future<List<User>> readUsers() async {
  final Database db = await getDb();
  final List<Map<String, dynamic>> maps = await db.query('users');
  return List.generate(maps.length, (i) {
    return User(
      id: maps[i]['id'],
      username: maps[i]['username'],
      email: maps[i]['email'],
      celular: maps[i]['celular'],
    );
  });
}

/// Update user
Future<void> updateUser(User user) async {
  final db = await getDb();
  await db.update(user_table, user.toJson(), where: "id = ?", whereArgs: [user.id]);
}

/// Delete User
Future<void> deleteUser(int id) async {
  final db = await getDb();
  await db.delete(user_table, where: "id = ?", whereArgs: [id]);
}

/// UserSecret Table

/// Insert User Secret
Future<void> createUserSecret(UserSecret userSecret) async {
  final Database db = await getDb();
  await db.insert(userSecret_table, userSecret.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
}

/// List User Secrets
Future<List<UserSecret>> readUserSecrets() async {
  final Database db = await getDb();
  final List<Map<String, dynamic>> maps = await db.query(userSecret_table);
  return List.generate(maps.length, (i) {
    return UserSecret(
      id: maps[i]['id'],
      user: (maps[i]['user']).id,
      password: maps[i]['password'],
    );
  });
}

/// Update user Secret
Future<void> updateUserSecret(UserSecret userSecret) async {
  final db = await getDb();
  await db.update(userSecret_table, userSecret.toJson(), where: "id = ?", whereArgs: [userSecret.id]);
}

/// Delete User
Future<void> deleteUserSecret(int id) async {
  final db = await getDb();
  await db.delete(userSecret_table, where: "id = ?", whereArgs: [id]);
}

/// UserGroup Table

/// Insert UserGroup
Future<void> createUserGroup(UserGroup userGroup) async {
  final Database db = await getDb();
  await db.insert(userGroup_table, userGroup.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
}

/// List User Group
Future<List<UserGroup>> readUserGroups() async {
  final Database db = await getDb();
  final List<Map<String, dynamic>> maps = await db.query(userGroup_table);
  return List.generate(maps.length, (i) {
    return UserGroup(
      id: maps[i]['id'],
      user: (maps[i]['user']).id,
      group: (maps[i]['group']).id,
    );
  });
}

/// Update user Group
Future<void> updateUserGroup(UserGroup userGroup) async {
  final db = await getDb();
  await db.update(userGroup_table, userGroup.toJson(), where: "id = ?", whereArgs: [userGroup.id]);
}

/// Delete UserGroup
Future<void> deleteUserGroup(int id) async {
  final db = await getDb();
  await db.delete(userGroup_table, where: "id = ?", whereArgs: [id]);
}


/// UserAccess Table

/// Insert UserAccess
Future<void> createUserAccess(UserAccess userAccess) async {
  final Database db = await getDb();
  await db.insert(userAccess_table, userAccess.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
}

/// List UserAccess
Future<List<UserAccess>> readUserAccesses() async {
  final Database db = await getDb();
  final List<Map<String, dynamic>> maps = await db.query(userAccess_table);
  return List.generate(maps.length, (i) {
    return UserAccess(
      id: maps[i]['id'],
      user: (maps[i]['user']).id,
      token: maps[i]['token']
    );
  });
}

/// Update UserAccess
Future<void> updateUserAccess(UserAccess userAccess) async {
  final db = await getDb();
  await db.update(userAccess_table, userAccess.toJson(), where: "id = ?", whereArgs: [userAccess.id]);
}

/// Delete UserAccess
Future<void> deleteUserAccess(int id) async {
  final db = await getDb();
  await db.delete(userAccess_table, where: "id = ?", whereArgs: [id]);
}
