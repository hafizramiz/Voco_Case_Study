import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco_case_study/product/services/shared_pref_service.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController();
});

// Buraya shared pref servisi de alcam.

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(AuthState(authStatus: AuthStatus.unauthenticated)) {
    _onUserChanged();
  }

  void _onUserChanged() {
    final String token = CacheManager.token.read;
    if (token.isEmpty) {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
    } else {
      state = state.copyWith(authStatus: AuthStatus.authenticated);
    }
  }

  void onSignOut() async{
    await CacheManager.token.write("");
    state = state.copyWith(authStatus: AuthStatus.unauthenticated);
  }
}

enum AuthStatus { authenticated, unauthenticated }

// Burasi da state bilgimi tutan sinifim.

class AuthState extends Equatable {
  final AuthStatus authStatus;

  AuthState({required this.authStatus});

  copyWith({required AuthStatus authStatus}) {
    return AuthState(authStatus: authStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [authStatus];
}
