/*
import 'package:flutter/material.dart';
import '../../UrlConstants/url_constants.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Util/show_toast.dart';
import '../Model/forgot_password_model.dart';


class LoginFormBloc extends FormBloc<String, String> {
  final username = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.username,
    ],
  );


  LoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        username,
      ],
    );
  }

  @override
  Future<void> onSubmitting() async {
    try {
      final loginRequestModel = LoginRequestModel(
        username: username.value,

      );
      final reqBody = jsonEncode({
        "username": username.value,

      });
      final response = await http.post(Uri.parse(UrlConstants.completeUrl),
          headers: {'Content-Type': 'application/json'},
          body:
          reqBody //TODO: We can use this jsonEncode(LoginRequestModel) or jsonEncode(LoginRequestModel.toJson())
      );
      print(loginRequestModel.toJson());
      if (response.statusCode == 200) {
        // Handle success

        print('API request successful, $response');

        //print('API request successful, $response');
        var loginToken =
            LoginResponseModel.fromJson(jsonDecode(response.body)).data.token;
        var studentId = LoginResponseModel.fromJson(jsonDecode(response.body))
            .data
            .studentId;
        print('This is the Student ID ➡️➡️➡️➡️➡️➡️: $studentId');
        print('This is the Login Token ➡️➡️➡️➡️➡️➡️ : $loginToken');
        var sharedPref = await SharedPreferences.getInstance();
        sharedPref.setString('LoginToken', loginToken);
        sharedPref.setInt('StudentId', studentId);
        showToast('Logged In');
        //showToast(response.body);
        print(response.body);
        //showToast(response.body);
        emitSuccess(successResponse: response.body);
      } else {
        // Handle error
        print(response.statusCode);
        print('API request failed');
        print(response.body);
        //emitFailure(failureResponse: 'Login failed');

        // const errorMessage= Text(
        //   'Server problem, please try again later',
        //   style: TextStyle(
        //     color: Colors.red, // Customize the text color
        //     fontSize: 16, // Customize the font size
        //     fontWeight: FontWeight.bold, // Customize the font weight
        //   ),
        // );
        //
        // emitFailure(failureResponse: errorMessage);
        const errorMessage = Text(
          'Server problem, please try again later',
          style: TextStyle(
            color: Colors.red, // Customize the text color
            fontSize: 16, // Customize the font size
            fontWeight: FontWeight.bold, // Customize the font weight
          ),
        );

        final errorMessageString = errorMessage.data; // Extract the text from the Text widget

        emitFailure(failureResponse: errorMessageString);


      }
    } catch (e) {
      // Handle exceptions
      print('An exception occurred');
      print(e.toString());
      // emitFailure(failureResponse: 'An exception occurred');



      const errorMessage = Text(
        'Turn on Internet. Please try again later',
        // 'An exception occurred. Please try again later.',
        style: TextStyle(
          color: Colors.red, // Customize the text color
          fontSize: 16, // Customize the font size
          fontWeight: FontWeight.bold, // Customize the font weight
        ),
      );

      final errorMessageString = errorMessage.data;
      emitFailure(failureResponse: errorMessageString);

    }
  }
}*/


///
///
///
///
///
///
///
///
/*

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
  final TextEditingController _usernameController = TextEditingController();
  String _responseMessage = '';

  Future<void> _sendPasswordResetRequest(String username) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    if`
    if (token != null) {
      final apiUrl = Uri.parse('https://bitcode.in:3000/apis/student/password');

      try {
        final response = await http.post(
          apiUrl,
          body: jsonEncode({'username': username}),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          final responseCode = responseData['response_code'];
          final message = responseData['message'];

          if (responseCode == 0) {
            setState(() {
              _responseMessage = message;
            });
          } else {
            setState(() {
              _responseMessage = 'Failed to reset password: $message';
            });
          }
        } else {
          setState(() {
            _responseMessage = 'Failed to connect to the server.';
          });
        }
      } catch (error) {
        setState(() {
          _responseMessage = 'An error occurred: $error';
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
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final username = _usernameController.text;
                _sendPasswordResetRequest(username);
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
*/

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Model/forgot_password_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _sendPasswordResetRequest(String username) async {
    final apiUrl = Uri.parse('https://bitcode.in:3000/apis/student/password');

    try {
      final response = await http.post(
        apiUrl,
        body: jsonEncode({'username': username}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final forgotPasswordResponse = ForgotPasswordResponse.fromJson(
            responseData);

        if (forgotPasswordResponse.responseCode == 0) {
          _showSuccessDialog();
        } else {
          _showErrorDialog(forgotPasswordResponse.message);
        }
      } else {
        _showErrorDialog('Failed to connect to the server.');
      }
    } catch (error) {
      _showErrorDialog('An error occurred: $error');
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Password reset email sent successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text('An error occurred: $errorMessage'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Forgot Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please enter your username to reset your password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _sendPasswordResetRequest(_usernameController.text);
              },
              child: Text('Send Reset Email'),
            ),
          ],
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Forgot Password'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _usernameController,
//               decoration: const InputDecoration(
//                 labelText: 'Username',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 final username = _usernameController.text;
//                 _sendPasswordResetRequest(username);
//               },
//               child: const Text('Reset Password'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
