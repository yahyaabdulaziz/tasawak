import 'package:dartz/dartz.dart';
import 'package:tasawak/data/model/failure.dart';

import '../../../../data/model/response/category_dm.dart';
import '../../../../data/model/response/product_dm.dart';

abstract class MainOnlineDS {
  Future<Either<Failure, List<CategoryDM>>> getCategories();

  Future<Either<Failure, List<ProductDM>>> getProducts();
}
