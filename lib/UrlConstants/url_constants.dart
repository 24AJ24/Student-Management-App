import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Auth/Model/login_request_model.dart';

class UrlConstants {
  static const String loginEndpoint = 'apis/auth/student';
  static const String baseUrl='https://bitcode.in:3000/';
  static const completeUrl = baseUrl + loginEndpoint;

  Future<void> onSubmitting() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');
    int? param = prefs.getInt('studentId');

    final response = await http.post(
      Uri.parse(completeUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(LoginRequestModel),
    );
  }
}
