import 'package:flutter/material.dart';
import 'package:tasawak/ui/screens/main/main.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/form_label.dart';

class Register extends StatelessWidget {
  static const String routeName = 'register';

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            'assets/images/splash.png',
            height: 71,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  //key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FormLabelWidget(label: 'Full Name'),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                          hintText: 'enter your full name',
                          controller: nameController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter full name';
                            }
                            return null;
                          },
                          type: TextInputType.name),
                      const SizedBox(
                        height: 28,
                      ),
                      FormLabelWidget(label: 'Email Address'),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                          hintText: 'enter your email address',
                          controller: emailController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter email';
                            }
                            var emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(text);
                            if (!emailValid) {
                              return 'email format not valid';
                            }

                            return null;
                          },
                          type: TextInputType.emailAddress),
                      const SizedBox(
                        height: 28,
                      ),
                      FormLabelWidget(label: 'Mobile Number'),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                          hintText: 'enter your mobile number',
                          controller: phoneController,
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return 'Please enter mobile number';
                            }
                            if (text.trim().length < 10) {
                              return 'Phone number should be at least 10 numbers.';
                            }
                            return null;
                          },
                          type: TextInputType.phone),
                      const SizedBox(
                        height: 28,
                      ),
                      FormLabelWidget(label: 'Password'),
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
                            return 'Phone number should be at least 6 chrs.';
                          }
                          return null;
                        },
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      FormLabelWidget(label: 'Password Confirmation'),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                        hintText: 're-enter your password confirmation',
                        controller: rePasswordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please re-enter password ';
                          }
                          if (text != passwordController.text) {
                            return "Password doesn't match.";
                          }
                          return null;
                        },
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      CustomButtonWidget(
                          title: 'Sign Up',
                          onPressed: () {
                            Navigator.pushNamed(context, Main.routeName);
                          })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
