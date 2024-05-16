import 'package:dio/dio.dart';
import 'package:upd8_teste/app/models/user_model.dart';

class APIService {
  final Dio dio;

  APIService(this.dio);

  Future<List<UserModel>> getUserByEmail() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      var jsonList = response.data as List;
      return jsonList.map((users) => UserModel.fromMap(users)).toList();
    } else {
      throw Exception();
    }
  }
}
