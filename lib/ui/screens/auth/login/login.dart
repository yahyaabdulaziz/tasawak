import 'package:flutter/material.dart';
import 'package:tasawak/ui/screens/auth/register/register.dart';
import 'package:tasawak/ui/screens/main/main.dart';
import 'package:tasawak/ui/utils/app_assets.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/form_label.dart';

class Login extends StatelessWidget {
  static const String routeName = 'login';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            //key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Image.asset(AppAssets.splash,
                    height: MediaQuery.of(context).size.height * .12),
                const SizedBox(
                  height: 75,
                ),
                Text(
                  'Welcome Back To Tasawak Application',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Please sign in with your mail',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 40,
                ),
                FormLabelWidget(
                  label: 'Email Address',
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                    controller: emailController,
                    hintText: 'enter your email address',
                    // controller: viewModel.emailController,
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter email';
                      }
                      var emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);

                      if (!emailValid) {
                        return 'Email format is not valid';
                      }

                      return null;
                    },
                    type: TextInputType.emailAddress),
                const SizedBox(
                  height: 32,
                ),
                FormLabelWidget(
                  label: 'Password',
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                  hintText: 'enter your password',
                  controller: passwordController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter password ';
                    }
                    if (text.length < 6) {
                      return 'Password should be at least 6 chrs.';
                    }
                    return null;
                  },
                  type: TextInputType.visiblePassword,
                  isPassword: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: FormLabelWidget(label: 'Forget Password')),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonWidget(
                    title: 'Login',
                    onPressed: () {
                      Navigator.pushNamed(context, Main.routeName);
                    }),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FormLabelWidget(label: "Don't have an account ? "),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Register.routeName);
                      },
                      child: FormLabelWidget(label: 'Create Account'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
