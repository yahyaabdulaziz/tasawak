import 'package:dartz/dartz.dart';
import 'package:tasawak/data/model/failure.dart';
import 'package:tasawak/data/model/response/cart_dm.dart';

import '../../../../data/model/response/category_dm.dart';
import '../../../../data/model/response/product_dm.dart';

abstract class MainOnlineDS {
  Future<Either<Failure, List<CategoryDM>>> getCategories();

  Future<Either<Failure, List<ProductDM>>> getProducts();

  Future<Either<Failure, CartDM>> getLoggedUserCart();

  Future<Either<Failure, CartDM>> addProductToCart(String id);

  Future<Either<Failure, CartDM>> removeProductFromCart(String id);
}
