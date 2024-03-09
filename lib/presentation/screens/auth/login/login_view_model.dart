import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tasawak/data/model/failure.dart';
import 'package:tasawak/domain/use_cases/login_use_case.dart';
import 'package:tasawak/presentation/utils/base_request_states.dart';

@injectable
class LoginViewModel extends Cubit {
  LoginViewModel(this.loginUseCase) : super(BaseRequestInitialState());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  LoginUseCase loginUseCase;

  void login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseRequestLoadingState());
    Either<Failure, bool> response = await loginUseCase.execute(
        emailController.text, passwordController.text);
    response.fold((error) {
      emit(BaseRequestErrorState(error.errorMessage));
    }, (success) {
      emit(BaseRequestSuccessState());
    });
  }
}

class InitialState {}
