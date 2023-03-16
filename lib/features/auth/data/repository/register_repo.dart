import 'dart:convert';
import '../../../../core/constants/api.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

abstract class RegisterRepository {
  Future<Either<String, UserModel>> register(
      {required String email,
      required String password,
      required int phone,
      required String name});
}

class RegisterRepositoryImpl extends RegisterRepository {
  @override
  Future<Either<String, UserModel>> register({required String email, required String password, required int phone, required String name}) async {
    try {
      http.Response response = await http.post(registerUrl,
          body: json.encode(
            {
              "email": email,
              "password": password,
              "name": name,
              "image":
                  'https://static.vecteezy.com/system/resources/previews/001/193/912/non_2x/sedan-car-png.png',
              "phone": phone
            },
          ),
          headers: {'lang': 'en', 'Content-Type': 'application/json'});

      return right(UserModel.fromJson(json.decode(response.body)));
    } catch (error) {
      return left(error.toString());
    }
  }
}
