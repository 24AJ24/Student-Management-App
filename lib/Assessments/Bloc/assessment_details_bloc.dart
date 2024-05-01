import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Commons/text_style__constants.dart';
import '../../Util/show_toast.dart';
import '../Model/assessment_model.dart';


class AssessmentDetailsBloc {

  final _batchDetailsStreamController =
  StreamController<List<Data>>();

  Stream<List<Data>> get batchDetailsStream =>
      _batchDetailsStreamController.stream;

  void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    var param =
    prefs.getInt('StudentId'); //TODO: Make SharedPreference as const
    print(param);
    // var enrollment = prefs.getInt('enrollmentId');
    // print('//');
    // print(enrollment);

    if (token != null) {
      const completeUrl = 'http://192.168.0.112:3000/apis/student/batches/55';

      print(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );

      log(response.body);

      if (response.statusCode == 200) {
        // API call successful
        Map<String, dynamic> responseData = json.decode(response.body);
        AssessmentModel model = AssessmentModel.fromJson(responseData);

        // showToast(response.body);
        showToast('Clicked');
        _batchDetailsStreamController.sink.add(model.data as List<Data>);
        //_batchDetailsStreamController.sink.add(model.data ?? []);
        // _batchDetailsStreamController.sink.add(model.dataa ??[]);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
        // _batchDetailsStreamController.sink.addError(
        //   const Text(
        //     'Something went wrong, please try again ❌!!!',
        //     style: TextStyle(
        //       fontSize: 16.0,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.red,
        //     ),
        //   ),
        // );

        // Add an error message to the batch details stream controller
        _batchDetailsStreamController.sink.addError(
          const Text(
            'Something went wrong, please try again ❌!!!',
            style: TextStyleConstants.titleStyle,
          ),
        );


      }
    }
  }

  void dispose() {
    _batchDetailsStreamController.close();
  }
}

/*
import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../UrlConstants/url_constants.dart';
import '../../Util/show_toast.dart';
import '../Model/assessment_model.dart';

class AssessmentDetailsBloc {
  final _batchDetailsStreamController = StreamController<List<Data>>();

  Stream<List<Data>> get batchDetailsStream => _batchDetailsStreamController.stream;

  void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');
    int? studentId = prefs.getInt('StudentId');

    if (token!= null && studentId!= null) {
      final response = await http.get(
        Uri.parse('$baseUrl/apis/student/batches/$studentId'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final model = AssessmentModel.fromJson(responseData);
        _batchDetailsStreamController.sink.add(model.data as List<Data>);
      } else {
        // Handle errors or display appropriate error message to the user
      }
    }
  }

  void dispose() {
    _batchDetailsStreamController.close();
  }
}

*/
