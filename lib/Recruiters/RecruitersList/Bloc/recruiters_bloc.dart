import 'dart:async';
import 'dart:developer';
import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../UrlConstants/url_constants.dart';
import '../Model/recruiters_list_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecruitersBLoc {
  final _recruitersListStreamController = StreamController<List<Data>>();
  Stream<List<Data>> get recruitersStream =>
      _recruitersListStreamController.stream;
  // String get loginEndpoint => 'apis/student/placement/calls';

  void fetchDataFromApi(/*int courserId*/) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    print(token);

    // PlacementModel new= PlacementModel[index].recruitmentCallCourseId;

    if (token != null) {

      print(token);
      const completeUrl = 'https://bitcode.in:3000/apis/student/recruiter/call/0/17';
      // String completeUrl = '${UrlConstants.baseUrl}$loginEndpoint/$courserId/:pageNo/:pageSize';
      // String completeUrl = UrlConstants.baseUrl + loginEndpoint;
      log(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );

      print(token);
      log(response.body);
      if (response.statusCode == 200) {
        // API call successful
        Map<String, dynamic> responseData = json.decode(response.body);
        RecruiterModel model = RecruiterModel.fromJson(responseData);
        log(response.body);
        _recruitersListStreamController.sink.add(model.data ?? []);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
        _recruitersListStreamController.sink.addError(
          const Text(
            'Something went wrong, please try again Later',
            style: TextStyleConstants.titleStyle,
          ),
        );
      }
    }
  }

  void dispose() {
    _recruitersListStreamController.close();
  }
}