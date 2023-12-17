import 'package:flutter_riverpod/flutter_riverpod.dart';


final loginProvider = StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController();
});


// BURASI BENIM CONTROLLER SINIFIM.
class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState(denemeDegisken:  "Deneme degisken Baslangic"));

  void change(){
  // Burda statei degistirecek.
   state=LoginState(denemeDegisken: "Deneem degisken degisti");
  }

}


// Burasi da state bilgimi tutan sinifim.

class LoginState {
   String denemeDegisken=" Deneeme state";
   LoginState({required this.denemeDegisken});
}
