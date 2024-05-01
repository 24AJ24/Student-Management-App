// import 'package:flutter/material.dart';
// import '../../UrlConstants/url_constants.dart';
// import '../Model/login_request_model.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../Util/show_toast.dart';
// import '../Model/login_response_model.dart';
//
// class LoginFormBloc extends FormBloc<String, String> {
//   final username = TextFieldBloc(
//     validators: [
//       FieldBlocValidators.required,
//       FieldBlocValidators.email,
//     ],
//   );
//
//   final password = TextFieldBloc(
//     validators: [
//       FieldBlocValidators.required,
//     ],
//   );
//
//   LoginFormBloc() {
//     addFieldBlocs(
//       fieldBlocs: [
//         username,
//         password,
//       ],
//     );
//   }
//
//   @override
//   Future<void> onSubmitting() async {
//     try {
//       final loginRequestModel = LoginRequestModel(
//         username: username.value,
//         password: password.value,
//       );
//       final reqBody = jsonEncode({
//         "username": username.value,
//         "password": password.value,
//       });
//       final response = await http.post(Uri.parse(UrlConstants.completeUrl),
//           headers: {'Content-Type': 'application/json'},
//           body:
//           reqBody //TODO: We can use this jsonEncode(LoginRequestModel) or jsonEncode(LoginRequestModel.toJson())
//       );
//       print(loginRequestModel.toJson());
//       if (response.statusCode == 200) {
//         // Handle success
//
//         print('API request successful, $response');
//
//         //print('API request successful, $response');
//         var loginToken =
//             LoginResponseModel.fromJson(jsonDecode(response.body)).data.token;
//         var studentId = LoginResponseModel.fromJson(jsonDecode(response.body))
//             .data
//             .studentId;
//         print('This is the Student ID ➡️➡️➡️➡️➡️➡️: $studentId');
//         print('This is the Login Token ➡️➡️➡️➡️➡️➡️ : $loginToken');
//         var sharedPref = await SharedPreferences.getInstance();
//         sharedPref.setString('LoginToken', loginToken);
//         sharedPref.setInt('StudentId', studentId);
//         showToast('Logged In');
//         //showToast(response.body);
//         print(response.body);
//         //showToast(response.body);
//         emitSuccess(successResponse: response.body);
//       } else {
//         // Handle error
//         print(response.statusCode);
//         print('API request failed');
//         print(response.body);
//         //emitFailure(failureResponse: 'Login failed');
//
//         // const errorMessage= Text(
//         //   'Server problem, please try again later',
//         //   style: TextStyle(
//         //     color: Colors.red, // Customize the text color
//         //     fontSize: 16, // Customize the font size
//         //     fontWeight: FontWeight.bold, // Customize the font weight
//         //   ),
//         // );
//         //
//         // emitFailure(failureResponse: errorMessage);
//         const errorMessage = Text(
//           'Server problem, please try again later',
//           style: TextStyle(
//             color: Colors.red, // Customize the text color
//             fontSize: 16, // Customize the font size
//             fontWeight: FontWeight.bold, // Customize the font weight
//           ),
//         );
//
//         final errorMessageString = errorMessage.data; // Extract the text from the Text widget
//
//         emitFailure(failureResponse: errorMessageString);
//
//
//       }
//     } catch (e) {
//       // Handle exceptions
//       print('An exception occurred');
//       print(e.toString());
//      // emitFailure(failureResponse: 'An exception occurred');
//
//
//
//       const errorMessage = Text(
//         'An exception occurred. Please try again later.',
//         style: TextStyle(
//           color: Colors.red, // Customize the text color
//           fontSize: 16, // Customize the font size
//           fontWeight: FontWeight.bold, // Customize the font weight
//         ),
//       );
//
//       final errorMessageString = errorMessage.data;
//       emitFailure(failureResponse: errorMessageString);
//
//     }
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
// import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../UrlConstants/url_constants.dart';
import '../../Util/show_toast.dart';
import '../Model/login_request_model.dart';
import '../Model/login_response_model.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final username = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  LoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        username,
        password,
      ],
    );
  }

  @override
  Future<void> onSubmitting() async {
    try {
      final loginRequestModel = LoginRequestModel(
        username: username.value,
        password: password.value,
      );
      final reqBody = jsonEncode({
        "username": username.value,
        "password": password.value,
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

        final errorMessageString =
            errorMessage.data; // Extract the text from the Text widget

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
}

/*
import 'package:flutter/material.dart';
import '../../UrlConstants/url_constants.dart';
import '../Model/login_request_model.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Util/show_toast.dart';
import '../Model/login_response_model.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final username = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  LoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        username,
        password,
      ],
    );
  }

  @override
  Future<void> onSubmitting() async {
    try {
      final loginRequestModel = LoginRequestModel(
        username: username.value,
        password: password.value,
      );
      final reqBody = jsonEncode({
        "username": username.value,
        "password": password.value,
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
}

 */
