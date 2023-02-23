import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart';
import 'package:print_color/print_color.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/product_model.dart';

class LocalDatabase {
  Database? _database;
  void create() async {
    _database = await openDatabase(
      'Products.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute(
          'create table product (id integer ,image text ,name text , star integer ,price integer ,nutrition text )',
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

  Future<Either<String, String>> insert({
    required ProductModel productModel,
  }) async {
    try {
      String nutrition = json.encode(productModel.nutrition);
      await _database?.transaction((txn) async {
        await txn.rawInsert(
            'INSERT INTO product (id,image,name,star,price,nutrition)Values("${productModel.id},${productModel.image},${productModel.name},${productModel.star},${productModel.price},$nutrition,")');
      });

      return right('done');
    } catch (error) {
      Print.cyan(error);
      return left(error.toString());
    }
  }

  List<ProductModel> result = [];
  Future<Either<String, List<ProductModel>>> getData(Database? database) async {
    try {
      List<Map<String, Object?>>? r =
          await database?.rawQuery('SELECT * FROM product');

      r!.map((element) {
        result.add(ProductModel.fromJson(element));
      });

      return right(result);
    } catch (error) {
      return left(error.toString());
    }
  }

  void deleteData({
    required String id,
  }) {
    try {
      _database?.delete('product', where: id);
    } catch (error) {}
  }
}
