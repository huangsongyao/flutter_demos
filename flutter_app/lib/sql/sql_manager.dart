import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class SQFMnanger {
  final sqlFileName = "db.sql";
  final table = "post";
  Database db;
  openDB() async {
    String path = "${await getDatabasesPath()}/${sqlFileName}";
    if (db == null) {
      db = await openDatabase(path, onCreate: (Database db, int version){
        db.execute('''
          Create Table post(
            userId integer,
            content text,
          );
        ''');
      });
    }
  }
  insert(Map<String, dynamic> object) async {
    await db.insert(table, object);
  }
}