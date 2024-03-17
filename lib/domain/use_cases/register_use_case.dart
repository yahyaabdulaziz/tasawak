import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tasawak/data/model/failure.dart';
import 'package:tasawak/data/model/request/register_request_body.dart';
import 'package:tasawak/domain/repos/auth_repo/auth_repo.dart';

@injectable
class RegisterUseCase {
  AuthRepo authRepo;

  RegisterUseCase(this.authRepo);

  Future<Either<Failure, bool>> execute(RegisterRequestBody body) {
    return authRepo.register(body);
  }
}
