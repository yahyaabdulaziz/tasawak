import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:tasawak/data/model/failure.dart';
import 'package:tasawak/data/model/response/categories_response.dart';
import 'package:tasawak/data/model/response/category_dm.dart';
import 'package:tasawak/data/model/response/product_dm.dart';
import 'package:tasawak/data/model/response/products_response.dart';
import 'package:tasawak/domain/repos/main_repo/data_source/main_online_ds.dart';
import 'package:tasawak/presentation/utils/constants.dart';
import 'package:tasawak/presentation/utils/end_points.dart';


@Injectable(as: MainOnlineDS)
class MainOnlineDSImpl extends MainOnlineDS {
  @override
  Future<Either<Failure, List<CategoryDM>>> getCategories() async {
    try {
      Uri uri = Uri.https(EndPoints.baseUrl, EndPoints.categories);
      Response serverResponse = await get(uri);
      CategoriesResponse response =
          CategoriesResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300 &&
          response.data?.isNotEmpty == true) {
        return Right(response.data!);
      } else {
        return Left(Failure(response.message ?? Constants.defaultErrorMessage));
      }
    } catch (error, stacktrace) {
      print("Handling exception: ${error} , Stacktrace: $stacktrace");
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductDM>>> getProducts() async {
    try {
      Uri uri = Uri.https(EndPoints.baseUrl, EndPoints.products);
      Response serverResponse = await get(uri);
      ProductsResponse response =
          ProductsResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300 &&
          response.data?.isNotEmpty == true) {
        return Right(response.data!);
      } else {
        return Left(Failure(response.message ?? Constants.defaultErrorMessage));
      }
    } catch (error, stacktrace) {
      print("Handling exception: ${error} , Stacktrace: $stacktrace");
      return Left(Failure(Constants.defaultErrorMessage));
    }
  }
}
