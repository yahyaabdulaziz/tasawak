import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tasawak/data/model/failure.dart';
import 'package:tasawak/data/model/response/cart_dm.dart';
import 'package:tasawak/domain/repos/main_repo/main_repo.dart';

@injectable
class GetLoggedUseCase {
  MainRepo repo;

  GetLoggedUseCase(this.repo);

  Future<Either<Failure, CartDM>> execute() {
    return repo.getLoggedUserCart();
  }
}
