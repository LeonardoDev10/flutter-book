import 'package:sqflite/sqflite.dart';
import 'schema.dart';

import '../model/shop.dart';

/// List tables
const String shop_table = 'shops';
const String userSecret_table = 'user_secrets';

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
