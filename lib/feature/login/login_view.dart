
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/feature/home/home_view.dart';
import 'package:voco_case_study/feature/login/login_view_controller.dart';
import 'package:voco_case_study/product/constants/icon_constants.dart';
import 'package:voco_case_study/product/constants/regex_validation.dart';
import 'package:voco_case_study/product/constants/string_constants.dart';

import '../../product/common/error_dialog.dart';
import '../../product/constants/color_constants.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build calisti");
    ref.listen<LoginState>(loginProvider, (previous, next) {
      if (next.error != null) {
        ErrorDialog.show(context, "${next.error}");
      }else{
        Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
              );
      }
    });

    return Scaffold(
        body: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringConstants.login_view,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: ColorConstants.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else {
                        return value.isValidEmail() ? null : "Check your email";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(IconConstants.password),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length < 6) {
                        return "Password should be at least 6 character";
                      }
                      return null;
                    },
                    controller: _passwordController,
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed:  () {
                    if (_formKey.currentState!.validate()) {
                      print("validate basarili");
                      ref
                          .read(loginProvider.notifier)
                          .logInWithEmailAndPassword(
                          _emailController.text,
                          _passwordController.text);
                      print("Error var mi: ${ref.watch(loginProvider).error}");
                    }
                  },
                  child: Text(
                    StringConstants.login,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: ColorConstants.black),
                  ),
                ),

              ],
            )));
  }
}
