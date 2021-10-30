// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http_requests/Models/UserModel.dart';

class DioClient {
  static final _googleSignIn = GoogleSignIn();
  // ignore: todo
  // TODO: Set up and define the methods for network operations
  final Dio _dio = Dio();
  final _baseUrl = 'https://reqres.in/api';

  // Methods
  Future<User> getUser({required String id}) async {
    print("In get data");
    // Perform GET request to the endpoint "/users/<id>"
    Response userData = await _dio.get(_baseUrl + '/users/$id');

    // Prints the raw data returned by the server
    print('User Info: ${userData.data}');

    // // Parsing the raw JSON data to the User class
    User user = User.fromJson(userData.data);

    // return userData.data;
    return user;
  }

  // With try catch
  // Future<User?> getUser({required String id}) async {
  //   User? user;
  //   try {
  //     Response userData = await _dio.get(_baseUrl + '/users/$id');
  //     print('User Info: ${userData.data}');
  //     user = User.fromJson(userData.data);
  //   } on DioError catch (e) {
  //     // The request was made and the server responded with a status code
  //     // that falls out of the range of 2xx and is also not 304.
  //     if (e.response != null) {
  //       print('Dio error!');
  //       print('STATUS: ${e.response?.statusCode}');
  //       print('DATA: ${e.response?.data}');
  //       print('HEADERS: ${e.response?.headers}');
  //     } else {
  //       // Error due to setting up or sending the request
  //       print('Error sending request!');
  //       print(e.message);
  //     }
  //   }
  //   return user;
  // }
}
