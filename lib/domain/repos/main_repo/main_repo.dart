import 'package:dartz/dartz.dart';
import 'package:tasawak/data/model/failure.dart';
import 'package:tasawak/data/model/response/category_dm.dart';
import 'package:tasawak/data/model/response/product_dm.dart';

abstract class MainRepo {
  Future<Either<Failure, List<CategoryDM>>> getCategories();

  Future<Either<Failure, List<ProductDM>>> getProducts();
}
