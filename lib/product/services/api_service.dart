
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:voco_case_study/product/model/post.dart';

import '../model/user.dart';
final apiServiceProvider= Provider<ApiService>((ref) => ApiService());

class ApiService{
// Post donsun.
  Future<Post> sendPostRequest(
      {required String email, required String password}) async {
      final response=await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password':password
        }),
      );
      if (response.statusCode == 200) {
        return Post.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      } else {
        throw Exception('Failed to post.');
      }
  }



  Future<List<User>> getRequest() async {
    final String _url = "https://reqres.in/api/users/2";
    final http.Response response = await http.get(
      Uri.parse(_url),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> usersData=jsonDecode(response.body) as Map<String, dynamic>;
      List<Map<String, dynamic>> mapList=usersData["data"];
     List<User> userList=mapList.map((json) => User.fromJson(json)).toList();
      return userList;
    } else {
      print("hataya dustu");
      throw Exception('Failed to load users');
    }
  }



}



