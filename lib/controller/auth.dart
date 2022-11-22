// ignore_for_file: use_build_context_synchronously
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pusher_ayoub_test/constants/end_points.dart';
import 'package:pusher_ayoub_test/constants/keys.dart';
import 'package:pusher_ayoub_test/controller/pusher.dart';
import 'package:pusher_ayoub_test/models/credentials.dart';
import 'package:pusher_ayoub_test/presentation/home_page.dart';

import '../helpers/loading.dart';
import 'interceptor.dart';

class AuthController {
  String? email;
  String? pwd;
  final _dio = Dio();
  final _endPoints = ApiEndPoints();
  final _pusher = PusherChannelProvider();

  Map<String, String> _setBody(String email, String pwd) {
    final body = {
      "client_id": "FrontHireMe",
      'email': email,
      "grant_type": "password",
      'password': pwd
    };
    return body;
  }

  BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 2000,
    receiveTimeout: 2000,
  );

  Future<void> signIn(BuildContext context) async {
    log(' login is triggered');
    showLoading(context);
    final body = _setBody(email!, pwd!);
    final Response res = await _dio.post(_endPoints.createToken, data: body);
    if (res.statusCode == 202) {
      final Response res = await _dio.post(_endPoints.signIn, data: body);
      if (res.statusCode == 200) {
        initDio(res.data['access_token']);
        _pusher.init(Credentials(
          token: res.data['access_token'],
          name: res.data['first_name'],
          userId: res.data['id'],
        ));
        log('I AM LOGGED IN');
        hideLoading(context);
        Navigator.pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomePage()),
          (route) {
            return false;
          },
        );
      } else {
        hideLoading(context);
        log('fail sign in');
      }
    } else {
      log('failed to login');
      hideLoading(context);
    }
  }

  void initDio(String? token) {
    _dio.options = options;
    _dio.interceptors.add(ApiInterceptor(token));
  }

  Future<void> signOut() async {
    try {
      await _dio.post(baseUrl + _endPoints.signOut, data: {"token": myToken});
    } catch (e) {
      log('couldnt log out $e');
    }
  }

  Future<void> initPusher() async {}

  Future<void> diconnectPusher() async {}
}
