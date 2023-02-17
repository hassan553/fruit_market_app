import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  static Database? _database;
  static void create() async {
    _database = await openDatabase(
      'products.db',
      version: 3,
      onCreate: (database, version) {
        database
            .execute(
          'create table product (id integer primary key ,image text ,name text ,integer star ,price integer ,nutrition list )',
        )
            .then((value) {
          print('create database products  successfully ');
        }).catchError(
          (onError) {
            print(onError.toString());
          },
        );
      },
      onOpen: (database) {
        getData(database);
      },
    );
  }

  static Future<Either<String, String>> insert({
    required Map<String, dynamic> productModel,
  }) async {
    try {
      await _database?.transaction((txn) async {
        await txn.insert('product', productModel);
      });
      return right('done');
    } catch (error) {
      return left(error.toString());
    }
  }

  static Future<Either<String, List<Map<String, Object?>>?>> getData(
      Database? database) async {
    try {
      List<Map<String, Object?>>? result = await database?.query('product');
      print('i get data successfully ');

      return right(result);
    } catch (error) {
      return left(error.toString());
    }
  }

  static void deleteData({
    required String id,
  }) {
    try {
      _database?.delete('product', where: id);
    } catch (error) {}
  }
}
