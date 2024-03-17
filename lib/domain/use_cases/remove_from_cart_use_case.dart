import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:tasawak/data/model/failure.dart';
import 'package:tasawak/data/model/response/cart_dm.dart';
import 'package:tasawak/domain/repos/main_repo/main_repo.dart';

@injectable
class RemoveFromCartUseCase {
  MainRepo repo;

  RemoveFromCartUseCase(this.repo);

  Future<Either<Failure, CartDM>> execute(String id) {
    return repo.removeProductFromCart(id);
  }
}
