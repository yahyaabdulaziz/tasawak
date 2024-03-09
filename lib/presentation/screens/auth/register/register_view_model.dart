import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tasawak/data/model/failure.dart';
import 'package:tasawak/data/model/request/register_request_body.dart';
import 'package:tasawak/domain/use_cases/register_use_case.dart';
import 'package:tasawak/presentation/utils/base_request_states.dart';

@injectable
class RegisterViewModel extends Cubit {
  RegisterUseCase registerUseCase;

  RegisterViewModel(this.registerUseCase) : super(BaseRequestInitialState());

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  void register() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseRequestLoadingState());
    Either<Failure, bool> response = await registerUseCase.execute(
        RegisterRequestBody(
            email: emailController.text,
            name: nameController.text,
            password: passwordController.text,
            phone: phoneController.text,
            rePassword: rePasswordController.text));

    response.fold((error) => emit(BaseRequestErrorState(error.errorMessage)),
        (success) => emit(BaseRequestSuccessState()));
  }
}
