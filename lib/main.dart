import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/feature/home/home_view.dart';
import 'package:voco_case_study/product/auth_controller/auth_controller.dart';
import 'package:voco_case_study/product/init/init_app.dart';

import 'feature/login/login_view.dart';

void main() async {
  await AppInit.initApp();
  runApp(ProviderScope(child:  MyApp()));
}

class MyApp extends ConsumerWidget {
   MyApp({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final authState=ref.watch(authProvider);

    Widget _getHome(){
      if(authState.authStatus==AuthStatus.authenticated){
        return HomeView();
      }else{
        return LoginView();
      }
    }

    return MaterialApp(
      home: _getHome(),
    );
  }
}


