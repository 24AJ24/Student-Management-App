import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../UrlConstants/url_constants.dart';
import '../Model/enrollment_details_model.dart' as EnrollmentDetailsModel;
import '../Model/enrollment_details_model.dart';

class EnrollmentDetailsBloc {
  static const String loginEndpoint = 'apis/student/batch/98';
  // static const String loginEndpoint = 'https://bitcode.in:3000/apis/student/batch/98';
  final _enrollmentDetailsStreamController = StreamController<List<EnrollmentDetailsModel.Payments>>();

  Stream<List<EnrollmentDetailsModel.Payments>> get studentDetail =>
      _enrollmentDetailsStreamController.stream;

  void fetchDataFromApi() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs);
    String? token = prefs.getString('LoginToken');


    // var param =  prefs.getInt('enrollmentId');//TODO: Make SharedPreference as const
    // print('.....///// $param');

    // var param1 = BatchRequestModel.fromJson(jsonDecode(responce.body)).data?.enrollmentId;


    if (token!= null) {
      // const completeUrl =  loginEndpoint;
      const completeUrl = UrlConstants.baseUrl + loginEndpoint;
      print(completeUrl);// Printed Complete URL
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token, "Accept": "application/json",},

      );
      print('..//');

      if (response.statusCode == 200) {

        Map<String, dynamic> responseData = json.decode(response.body);
        List<dynamic> paymentList = responseData['data']['payments'];

        // List<enrollment_detail_model.Payments> paymentDetailsList = paymentList
        //     .map((paymentJson) => enrollment_detail_model.Payments.fromJson(paymentJson))
        //     .toList();
        List<EnrollmentDetailsModel.Payments> paymentDetailsList = paymentList
            .map((paymentJson) => EnrollmentDetailsModel.Payments.fromJson(paymentJson))
            .toList();

        log(response.body);
        _enrollmentDetailsStreamController.sink.add(paymentDetailsList);
      } else {
        // Handle errors or display appropriate error message to the user
      }
    }
  }

  void dispose() {
    _enrollmentDetailsStreamController.close();
  }
}