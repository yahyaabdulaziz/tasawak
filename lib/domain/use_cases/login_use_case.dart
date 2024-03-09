import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tasawak/data/model/failure.dart';
import 'package:tasawak/data/repo/auth_repo/auth_repo_impl.dart';
import 'package:tasawak/domain/repos/auth_repo/auth_repo.dart';

@injectable
class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase(this.authRepo);

  Future<Either<Failure, bool>> execute(String email, String password) {
    return authRepo.login(email, password);
  }
}
