import 'dart:async';
import 'dart:developer';
import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/interview_model.dart';
import '../../../UrlConstants/url_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InterviewQuestionBloc {
  final _interviewQuestionStreamController = StreamController<List<Data>>();
  Stream<List<Data>> get interviewQuestionStream =>
      _interviewQuestionStreamController.stream;

  // String get loginEndpoint => 'apis/student/interview/question/0/10';
  // String get loginEndpoint => 'apis/student/placement/calls';
  void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    if (token != null) {
      String completeUrl = 'https://bitcode.in:3000/apis/student/interview/question/0/10';

      // String completeUrl = UrlConstants.baseUrl + loginEndpoint;
      log(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );
      log(response.body);
      if (response.statusCode == 200) {
        // API call successful
        Map<String, dynamic> responseData = json.decode(response.body);
        InterviewModel model = InterviewModel.fromJson(responseData);
        log(response.body);
        _interviewQuestionStreamController.sink.add(model.data ?? []);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
        _interviewQuestionStreamController.sink.addError(
          const Text(
            'Something went wrong, please try again Later',
            style: TextStyleConstants.titleStyle,
          ),
        );
      }
    }
  }

  void dispose() {
    _interviewQuestionStreamController.close();
  }
}