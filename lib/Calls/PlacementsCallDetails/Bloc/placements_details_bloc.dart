import 'dart:async';
import 'dart:developer';
import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Auth/Model/login_response_model.dart' as LoginResponseModel;
import '../../../UrlConstants/url_constants.dart';
import '../Model/placements_details_list_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PlacementBloc {
  final _placementDetailStreamController = StreamController<List<Data>>();
  Stream<List<Data>> get studentPlacementStream =>
      _placementDetailStreamController.stream;

  String get loginEndpoint => 'apis/student/placement/calls/5/0/20';
  // String get loginEndpoint => 'apis/student/placement/calls';
  void fetchDataFromApi(int courserId1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    if (token != null) {
      String completeUrl = UrlConstants.baseUrl + loginEndpoint;
      log(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );
      log(response.body);
      if (response.statusCode == 200) {
        // API call successful
        Map<String, dynamic> responseData = json.decode(response.body);
        PlacementModel model = PlacementModel.fromJson(responseData);
        log(response.body);
        _placementDetailStreamController.sink.add(model.data ?? []);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
        _placementDetailStreamController.sink.addError(
          const Text(
            'Something went wrong, please try again Later',
            style: TextStyleConstants.titleStyle,
          ),
        );
      }
    }
  }

  void dispose() {
    _placementDetailStreamController.close();
  }
}



/*
import 'dart:async';
import 'dart:developer';
import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Auth/Model/login_response_model.dart' as LoginResponseModel;
import '../../../UrlConstants/url_constants.dart';
import '../Model/placements_details_list_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PlacementBloc {
  final _placementStreamController = StreamController<PlacementModel>();
  Stream<PlacementModel> get studentPlacementStream =>
      _placementStreamController.stream;//11
  String get placementEndpoint => 'apis/admin/placement/call';
  void fetchDataFromApi(int courseId1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');
    int? courseId = prefs.getInt('CourseId');

    if (courseId != null) { // Add a null-check for studentId
      String completeUrl = '${UrlConstants.baseUrl}$placementEndpoint/$courseId/0/20';
      if (token != null) {
        try {
          final response = await http.get(
            Uri.parse(completeUrl),
            headers: {'Authorization': token},
          );
          log(response.body);
          print(completeUrl);

          if (response.statusCode == 200) {
            Map<String, dynamic> responseData = json.decode(response.body);
            PlacementModel model = PlacementModel.fromJson(responseData);
            _placementStreamController.sink.add(model);
          } else {
            _placementStreamController.sink
                .addError('Something went wrong, please try again later');
          }
        } catch (e) {
          _placementStreamController.sink.addError('An error occurred: $e');
        }
      }
    } else {
      // Handle the case where studentId is null
      _placementStreamController.sink.addError('Student ID is null');
    }
  }



  void dispose() {
    _placementStreamController.close();
  }
}*/
/*class PlacementBloc {
  final _placementDetailStreamController = StreamController<List<Data>>();
  Stream<List<Data>> get studentPlacementStream =>
      _placementDetailStreamController.stream;

  String get loginEndpoint => 'apis/student/placement/calls/5/0/20';
  // String get loginEndpoint => 'apis/student/placement/calls';


  void fetchDataFromApi(int courserId1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    if (token != null) {
      String completeUrl = UrlConstants.baseUrl + loginEndpoint;
      log(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );
      log(response.body);
      if (response.statusCode == 200) {
        // API call successful
        Map<String, dynamic> responseData = json.decode(response.body);
        PlacementModel model = PlacementModel.fromJson(responseData);
        log(response.body);
        _placementDetailStreamController.sink.add(model.data ?? []);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
        _placementDetailStreamController.sink.addError(
          const Text(
            'Something went wrong, please try again Later',
            style: TextStyleConstants.titleStyle,
          ),
        );
      }
    }
  }

  void dispose() {
    _placementDetailStreamController.close();
  }
}*/




















































































































































/*

import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../UrlConstants/url_constants.dart';
import 'dart:convert';
class PlacementInBloc {
  final _placementStreamController = StreamController<PlacementModel>();

  Stream<PlacementModel> get placementStream =>
      _placementStreamController.stream;
  String get placementEndpoint =>
      'apis/admin/placement/call';

  void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');
    if (token != null) {

      String completeUrl = '${UrlConstants.baseUrl}$placementEndpoint/${recruitmentCallCourseId}';
      log(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );
      log(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        PlacementModel model = PlacementModel.fromJson(responseData);
        _placementStreamController.sink.add(model);

        // Extract courseId and recruitmentCallCourseId from the API response
        int courseId = model.data.primaryInfo.courseId ?? 0;
        int recruitmentCallCourseId = model.data.primaryInfo
            .recruitmentCallCourseId ?? 0;

        // Now you can use courseId and recruitmentCallCourseId as needed
      } else {
        _placementStreamController.sink
            .addError('Something went wrong, please try again later');
      }
    }
  }
}
*/

/*
import 'dart:async';
import 'dart:developer';
import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/cupertino.dart';
import '../../../UrlConstants/url_constants.dart';
import '../Model/placements_details_list_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PlacementBloc {
  final _placementDetailStreamController = StreamController<List<Data>>();
  Stream<List<Data>> get studentPlacementStream =>
      _placementDetailStreamController.stream;
  String get loginEndpoint => 'apis/student/placement/calls/5/0/20';
  void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');
    if (token != null) {
      //const completeUrl = 'http://192.168.0.112:3000/apis/student/news/0/10';
      String completeUrl = UrlConstants.baseUrl + loginEndpoint;
      log(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );
      log(response.body);
      if (response.statusCode == 200) {
        // API call successful
        Map<String, dynamic> responseData = json.decode(response.body);
        PlacementModel model = PlacementModel.fromJson(responseData);
        log(response.body);
        _placementDetailStreamController.sink.add(model.data ?? []);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
        _placementDetailStreamController.sink.addError(
          const Text(
            'Something went wrong, please try again Later',
            style: TextStyleConstants.titleStyle,
          ),
        );
      }
    }
  }
  void dispose() {
    _placementDetailStreamController.close();
  }
}
*/
