import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/product/model/post.dart';
import 'package:voco_case_study/product/services/api_service.dart';
import 'package:voco_case_study/product/services/shared_pref_service.dart';

final loginProvider = StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref.watch(apiServiceProvider));
});

class LoginController extends StateNotifier<LoginState> {
  final ApiService _apiService;

  LoginController(this._apiService) : super(LoginState());

  void logInWithEmailAndPassword(String email, String password) async {
    try {
      final Post myPost =
          await _apiService.sendPostRequest(email: email, password: password);
      print("elde edilen token: ${myPost.token}");
      // Burda save token yapacam.
      await saveToken(myPost.token);
      state = state.copyWith(error: null);
    } catch (error) {
      print(" hata: $error");
      state = state.copyWith(error: "$error");
    }
  }

// Burda kullanici giris yapabildiyse onun token bilgisini alip kayit atcam
  Future<void> saveToken(String token) async {
    await CacheManager.token.write(token);
  }
}

// Burasi da state bilgimi tutan sinifim.

class LoginState extends Equatable {
  final String? error;

  LoginState({this.error});

  copyWith({String? error}) {
    return LoginState(error: error ?? this.error);
  }

  @override
  List<Object?> get props => [error];
}
