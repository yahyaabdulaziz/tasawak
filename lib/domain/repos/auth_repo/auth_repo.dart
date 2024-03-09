import 'package:dartz/dartz.dart';
import 'package:tasawak/data/model/failure.dart';
import 'package:tasawak/data/model/request/register_request_body.dart';

abstract class AuthRepo {
  Future<Either<Failure, bool>> login(String email, String password);

  Future<Either<Failure, bool>> register(RegisterRequestBody requestBody);
}
