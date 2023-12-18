import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/model/user.dart';
import '../../product/services/api_service.dart';

final homeProvider = StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController(ref.watch(apiServiceProvider));
});

class HomeController extends StateNotifier<HomeState> {
  final ApiService _apiService;

  HomeController(this._apiService) : super(HomeState());

  void fetchUser() async {
    try {
      print("data cekilmeye baslandi");

      state=state.copyWith(error: null,userList: null);
      final List<User> allUsers = await _apiService.getRequest();

      state = state.copyWith(error: null,userList: allUsers);
    } catch (error) {
      state = state.copyWith(error: "$error",userList: null);
    }
  }
}


class HomeState extends Equatable {
  final String? error;
  final List<User>? userList;

  HomeState({this.error,this.userList});

  copyWith({String? error, List<User>? userList}) {
    return HomeState(error: error ?? this.error, userList: userList?? this.userList);
  }

  @override
  List<Object?> get props => [error, userList];
}
