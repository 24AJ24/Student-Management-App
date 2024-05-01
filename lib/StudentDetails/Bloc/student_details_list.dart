/*

import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/student_details_model.dart';
import '../../../UrlConstants/url_constants.dart';
import 'dart:convert';

class StudentInDetails {
  final _placementStreamController = StreamController<StudentInDetailsModel>();
  Stream<StudentInDetailsModel> get placementStream =>
      _placementStreamController.stream;
  String get placementEndpoint =>
      'apis/admin/placement/call/81/39';

  // Replace with your endpoint
  void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');
    if (token != null) {
      String completeUrl = UrlConstants.baseUrl + placementEndpoint;
      log(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );
      log(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        StudentInDetailsModel model = StudentInDetailsModel.fromJson(responseData);
        _placementStreamController.sink.add(model);
      } else {
        _placementStreamController.sink
            .addError('Something went wrong, please try again later');
      }
    }
  }

  void dispose() {
    _placementStreamController.close();
  }
}


*/

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/student_details_model.dart';
import '../../../UrlConstants/url_constants.dart';

class GetStudentsDetailsInfo {
  final _studentDetailsStreamController = StreamController<List<Data>>();

  Stream<List<Data>> get getStudentStream => _studentDetailsStreamController.stream;

  /*void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    if (token != null) {
      String completeUrl = UrlConstants.baseUrl + loginEndpoint;
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        StudentInfoModel model = StudentInfoModel.fromJson(responseData);

        _studentDetailsStreamController.sink.add(model.data ?? []);
      } else {
        // Handle errors or display appropriate error message to the user
      }
    }
  }*/
  void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    print(token);

    var param = prefs.getInt('studentId');
    print(param);
    if (token != null) {
      String completeUrl = 'https://bitcode.in:3000/apis/student';
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {


        final responseBody = response.body;

        if (responseBody.isNotEmpty) {
          Map<String, dynamic> responseData = json.decode(responseBody);
          StudentInfoModel model = StudentInfoModel.fromJson(responseData);

          // _studentDetailsStreamController.sink.add(model.data ?? []);
          _studentDetailsStreamController.sink.add([model.data ?? Data()]);

        } else {
          // Handle the case where the response body is empty
          // You can emit an empty list or handle it as needed
          _studentDetailsStreamController.sink.addError("No data found.");
        }
      } else {
        // Handle errors or display appropriate error message to the user
        _studentDetailsStreamController.sink.addError("Error ${response.statusCode}: ${response.reasonPhrase}");
      }
    }
  }


  void dispose() {
    _studentDetailsStreamController.close();
  }
}
