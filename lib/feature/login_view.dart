import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/feature/login_view_controller.dart';
import 'package:voco_case_study/product/constants/icon_constants.dart';
import 'package:voco_case_study/product/constants/string_constants.dart';

import '../product/constants/color_constants.dart';

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
    print("build");
    ref.listen(loginProvider, (previous, next) {
       Text("data");
      print("state bilgim: ${previous.toString()}");
    });

    return Scaffold(
        body: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    controller: _emailController,
                   // autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length < 5) {
                        return "Name should be at least 5 character";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(IconConstants.password),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    autovalidateMode: AutovalidateMode.always,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (value.length < 5) {
                        return "Name should be at least 4 character";
                      }
                      return null;
                    },
                    controller: _passwordController,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("on press called");
                  },
                  child: Text(
                    StringConstants.login,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: ColorConstants.black),
                  ),
                )
              ],
            )));
  }
}


