// /*
//
// import 'dart:async';
// import 'dart:developer';
// import 'package:bitcode_student_app/Commons/text_style__constants.dart';
// import 'package:flutter/cupertino.dart';
// import '../Model/message_details_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class MessageDetailList {
//   final _messageListStreamController = StreamController<MessagesDetailsModel>();
//
//
//   Stream<MessagesDetailsModel> get studentMessageStream =>
//       _messageListStreamController.stream;
//   // String get loginEndpoint => 'apis/student/placement/calls/5/0/20';
//   void fetchDataFromApi() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('LoginToken');
//
//     // MessagesDetailsModel new= MessagesDetailsModel[index].recruitmentCallCourseId;
//
//
//     if (token != null) {
//       const completeUrl = 'https://bitcode.in:3000/apis/student/message/4';
//       // String completeUrl = UrlConstants.baseUrl + loginEndpoint;
//       log(completeUrl);
//       final response = await http.get(
//         Uri.parse(completeUrl),
//         headers: {'Authorization': token},
//       );
//       log(response.body);
//       if (response.statusCode == 200) {
//         // API call successful
//         Map<String, dynamic> responseData = json.decode(response.body);
//         MessagesDetailsModel model = MessagesDetailsModel.fromJson(responseData);
//         log(response.body);
//         _messageListStreamController.sink.add(model);
//       } else {
//         // API call failed
//         // Handle errors or display appropriate error message to the user
//         _messageListStreamController.sink.addError(
//           const Text(
//             'Something went wrong, please try again Later',
//             style: TextStyleConstants.titleStyle,
//           ),
//         );
//       }
//     }
//   }
//   void dispose() {
//     _messageListStreamController.close();
//   }
// }
// */


import 'dart:async';
import 'dart:developer';
import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/cupertino.dart';
import '../../../UrlConstants/url_constants.dart';
import '../Model/message_details_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MessageDetailList {
  final _messageListStreamController = StreamController<List<Data>>();


  Stream<List<Data>> get studentMessageStream =>
      _messageListStreamController.stream;
  String get loginEndpoint => 'apis/student/message';
  void fetchDataFromApi(int messageid) async {


    debugPrint("id $messageid");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    // MessagesDetailsModel new= MessagesDetailsModel[index].recruitmentCallCourseId;


    if (token != null) {
      // const completeUrl = 'https://bitcode.in:3000/apis/student/message/4';
      String completeUrl = '${UrlConstants.baseUrl}$loginEndpoint/$messageid';
      log(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );
      log(response.body);
      if (response.statusCode == 200) {
        // API call successful
        Map<String, dynamic> responseData = json.decode(response.body);
        MessagesDetailsModel model = MessagesDetailsModel.fromJson(responseData);
        log(response.body);
        _messageListStreamController.sink.add([model.data ?? Data()]);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
        _messageListStreamController.sink.addError(
          const Text(
            'Something went wrong, please try again Later',
            style: TextStyleConstants.titleStyle,
          ),
        );
      }
    }
  }
  void dispose() {
    _messageListStreamController.close();
  }
}

