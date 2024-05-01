/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {


  TextEditingController emailController = TextEditingController();
  String responseMessage = "";

  Future<void> sendPasswordResetEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');



    if (token != null) {

    final apiUrl = Uri.parse('https://bitcode.in:3000/apis/student/password');
    final response = await http.post(apiUrl, body: {'email': email});

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final int responseCode = data['response_code'];

      if (responseCode == 0) {
        setState(() {
          responseMessage = data['message'];
        });
      } else {
        setState(() {
          responseMessage = "Failed to reset password.";
        });
      }
    } else {
      setState(() {
        responseMessage = "Failed to connect to the server.";
      });
    }
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final email = emailController.text;
                sendPasswordResetEmail(email);
              },
              child: const Text("Reset Password"),
            ),
            const SizedBox(height: 16.0),
            Text(responseMessage),
          ],
        ),
      ),
    );
  }
}*//*

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _responseMessage = '';

  Future<void> _sendPasswordResetEmail(String username) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('login_token');

    if (token!= null) {
      final Uri apiUrl = Uri.parse('https://bitcode.in:3000/apis/student/password');
      final http.Response response = await http.post(apiUrl,
          headers: {'Content-Type': 'application/json'},
          body: {'username': username});

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final int responseCode = data['response_code'];

        if (responseCode == 0) {
          setState(() {
            _responseMessage = data['message'];
          });
        } else {
          setState(() {
            _responseMessage = 'Failed to reset password.';
          });
        }
      } else {
        setState(() {
          _responseMessage = 'Failed to connect to the server.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final String email = _emailController.text;
                _sendPasswordResetEmail(email);
              },
              child: const Text('Reset Password'),
            ),
            const SizedBox(height: 16.0),
            Text(_responseMessage),
          ],
        ),
      ),
    );
  }
}

// class ForgotPassword {
//   int responseCode;
//   String message;
//   Data data;
//
//   ForgotPassword({
//     required this.responseCode,
//     required this.message,
//     required this.data,
//   });
//
//   factory ForgotPassword.fromJson(Map<String, dynamic> json) {
//     return ForgotPassword(
//       responseCode: json['response_code'],
//       message: json['message'],
//       data: Data.fromJson(json['data']),
//     );
//   }
// }
//
// class Data {
//   int studentId;
//   String studentName;
//   String? imageUrl;
//   String token;
//
//   Data({
//     required this.studentId,
//     required this.studentName,
//     required this.imageUrl,
//     required this.token,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) {
//     return Data(
//       studentId: json['student_id'],
//       studentName: json['student_name'],
//       imageUrl: json['image_url'],
//       token: json['token'],
//     );
//   }
// }
*/

/*

*/
/*


*//*
*/
/*

*/

/*

class ForgotPassword {
  int responseCode;
  String message;
  Data data;

  ForgotPassword({
    required this.responseCode,
    required this.message,
    required this.data,
  });

  factory ForgotPassword.fromJson(Map<String, dynamic> json) {
    return ForgotPassword(
      responseCode: json['response_code'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  String token;
  String username;

  Data({
    required this.username,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      username: json['username'],
      token: json['token'],
    );
  }
}*/
class ForgotPasswordResponse {
  final int responseCode;
  final String message;
  final String data;

  ForgotPasswordResponse({
    required this.responseCode,
    required this.message,
    required this.data,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      responseCode: json['response_code'],
      message: json['message'],
      data: json['data'],
    );
  }
}
