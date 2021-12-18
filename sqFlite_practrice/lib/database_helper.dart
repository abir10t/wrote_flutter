import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper
{

  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'myTable';


  static final columnId = '_id' ;
  static final columnName = 'name' ;




  // making it a singelton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database ? _database;
  Future<Database> get database async
  {
    if(_database != null) return _database!;

    _database = await _initiateDatabase();

    return _database!;
  }


  _initiateDatabase() async
  {
     Directory directory = await getApplicationDocumentsDirectory(); // getApplicationDocumentsDirectory is from path provider package
     String path = join(directory.path,_dbName);
     // open the database using sqflite package 
     return await openDatabase(path, version: _dbVersion,onCreate: _onCreate);


  }

  Future ? _onCreate(Database db, int version)
  {
     db.query
       (
      ''' 
       CREATE TABLE $_tableName( 
       $columnId INTEGER PRIMARY KEY,
       $columnName TEXT NOT NULL )
        '''
      );

  }



}