import 'dart:convert';
import '../../../../core/constants/api.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

abstract class LoginRepository {
  Future<Either<String, UserModel>> login(String email, String password);
}

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<Either<String, UserModel>> login(String email, String password) async {
    try {
      http.Response response = await http.post(loginUrl,
          body: json.encode(
            {
              "email": email,
              "password": password,
            },
          ),
          headers: {'lang': 'en', 'Content-Type': 'application/json'});

      return right(UserModel.fromJson(json.decode(response.body)));
    } catch (error) {
      return left(error.toString());
    }
  }
}
