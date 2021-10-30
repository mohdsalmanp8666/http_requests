// ignore_for_file: duplicate_import, unused_import

import 'dart:convert';

import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_requests/Dio/DioClient.dart';
import 'package:http_requests/Dio/google_signin_api.dart';
import 'package:http_requests/Models/UserModel.dart';

class GoogleSignInApi {
  final token = '';

  static final _googleSignIn = GoogleSignIn(
      // scopes: [
      //   'email',
      //   // 'openid',
      //   // 'profile',
      //   'https://www.googleapis.com/auth/contacts.readonly',
      //   "https://www.googleapis.com/auth/userinfo.profile"
      // ],
      // clientId:
      //     '124056496150-u9ntusa5ii56k5a9n4abcbf579jsg9hq.apps.googleusercontent.com',
      );
  static Future<GoogleSignInAccount?> login() =>
      // _googleSignIn.signIn().then<void>((GoogleSignInAccount googleSignInAccount) {
      // googleSignInAccount.authentication.then<void>((GoogleSignInAuthentication googleSignInAuthentication) {
      //   _auth.signInWithGoogle(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken)})};
      _googleSignIn.signIn().then((result) {
        result!.authentication.then((googleKey) async {
          // print(googleKey.serverAuthCode);
          Map<String, String> body = {};
          print(googleKey.accessToken);

          body['tokenId'] =
              // 'eyJhbGciOiJSUzI1NiIsImtpZCI6ImJiZDJhYzdjNGM1ZWI4YWRjOGVlZmZiYzhmNWEyZGQ2Y2Y3NTQ1ZTQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXpwIjoiNTc4NzU3NzMzNTI3LWZxMWowbW81dGJrNmI1Mm1ydDFpaDZxcmR0dDc3ZDh2LmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiYXVkIjoiNTc4NzU3NzMzNTI3LWZxMWowbW81dGJrNmI1Mm1ydDFpaDZxcmR0dDc3ZDh2LmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTA3Nzc1NjExMjI4ODgwMTA2MTQwIiwiZW1haWwiOiJtb2hkc2FsbWFucDg2NkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6IjAtanBCN256NHFzZnd1Y2JqbHFUR1EiLCJuYW1lIjoiTW9oZC5TYWxtYW4gUGF0ZWwiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUFUWEFKenpBNkE0dXdXeVNNa2t3bTFlTExCaG9OcjR2RHd4elJRUDFXX0I3QT1zOTYtYyIsImdpdmVuX25hbWUiOiJNb2hkLlNhbG1hbiIsImZhbWlseV9uYW1lIjoiUGF0ZWwiLCJsb2NhbGUiOiJlbiIsImlhdCI6MTYzNTA3OTA5MSwiZXhwIjoxNjM1MDgyNjkxLCJqdGkiOiJhZjc1NTUzMThkNTAyZDRhNzU0ODE4NmE5YzBlMTcwYzFjZmNlN2I4In0.kEA71nscy07vJsNQhWcoHt4thE-5R8-AuYur2WNw8_I3bcnJ2MX4-_Fi_NAjqvnOJqocq-0kaNVfG5CwOL9z43pGhV9FIqNGRI7zFvg5IicnZrFiXXJ_mZIkekcBuAOKHZRMoAogD2oLq20pPaM-XglM_UVFo9w8F5ey1Xib-iu67CIsuUN_B_jYncqch1Vu8Ql1xtuJ3nn5qMi0HwGUUwrjAnIdFMhBadVDpxgtwjrwdsWqc9Y4NOww06MwTn5F3Ux7eFXaMXh_R605xofdlGHxl6FpLQJ1N3sp4wFsYUGMQBs-CblENKHf_WNxVh8BUrMVcu2bfiiRzYUZDdHCLw';
              googleKey.idToken!.toString();
          print(googleKey.idToken.toString());
          print(_googleSignIn.currentUser!.displayName);
          var response = await http.post(
            Uri.parse(
              'https://roombae.com/api/authentication/rest-auth/google/',
            ),
            body: jsonEncode(body),
            // headers: {"tokenId": "${googleKey.accessToken}"},
          );
          // var cookie = response.headers['set-cookie'];
          // headers['cookie'] = cookie!;
          if (response.headers.isNotEmpty) {
            print(response.headers);
            // print("Cookie Value ${cookie}");
            // headers['set-cookie'] = cookie;
          }

          // print("Status Code: ${response.statusCode}");
          // print(response.headers);
        }).catchError((err) {
          print('inner error');
        });
      }).catchError((err) {
        print('error occured');
      });
  static Future<GoogleSignInAccount?> logout() => _googleSignIn.signOut();
}
