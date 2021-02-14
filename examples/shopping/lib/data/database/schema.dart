import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDb() async {
  var databasesPath = await getDatabasesPath();
  final Future<Database> database = openDatabase(
    join(databasesPath, 'shopping.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, email TEXT, celular TEXT); \\"+
        "CREATE TABLE user_secrets(id INTEGER PRIMARY KEY, user_id INTEGER, password TEXT); \\"+
        "CREATE TABLE user_groups(id INTEGER PRIMARY KEY, user_id INTEGER, group_id INTEGER); \\"+
        "CREATE TABLE user_accesses(id INTEGER PRIMARY KEY, user_id INTEGER, token TEXT); \\"+
        "CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, age INTEGER); \\" //+
        //"CREATE TABLE products(id INTEGER PRIMARY KEY, name TEXT, age INTEGER); \\"
      );
    },
    version: 1,
  );
  return database;
}


