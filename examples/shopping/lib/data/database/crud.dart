import 'package:sqflite/sqflite.dart';
import 'schema.dart';

/// Insert Doc
Future<void> createDoc(T doc) async {
  final Database db = await getDb();
  await db.insert(user_table, doc.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
}

/// List Docs
Future<List<T>> readDocs(T doc) async {
  final Database db = await getDb();
  final List<Map<String, dynamic>> maps = await db.query('users');
  return List.generate(maps.length, (i) {
    return T.fromJson(maps[i]);
  });
}

/// Update Doc
Future<void> updateUser(T doc) async {
  final db = await getDb();
  await db.update(user_table, user.toJson(), where: "id = ?", whereArgs: [doc.id]);
}

/// Delete Doc
Future<void> deleteDoc(T doc) async {
  final db = await getDb();
  await db.delete(user_table, where: "id = ?", whereArgs: [doc.id]);
}
