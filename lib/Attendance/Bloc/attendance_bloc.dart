/*
        import 'dart:async';
        import 'dart:developer';
        import 'package:http/http.dart' as http;
        import 'dart:convert';
        import 'package:shared_preferences/shared_preferences.dart';
        import '../../UrlConstants/url_constants.dart';
        import '../../Util/show_toast.dart';
        import '../Model/attendance_model.dart';


        class StudentAttendanceBloc {
          // Batch batch = Batch();
          static const String loginEndpoint = 'apis/student/attendance/48';
          // static const String loginEndpoint = 'apis/student/attendance';
          final _attendanceDetailsStreamController = StreamController<List<Data>>();

          Stream<List<Data>> get attendanceDetailsStream =>
              _attendanceDetailsStreamController.stream;

          void fetchDataFromApi() async {

            SharedPreferences prefs = await SharedPreferences.getInstance();
            // String? token = prefs.getString('LoginToken');
            String? token = prefs.getString('LoginToken');
            int? enrollmentId = prefs.getInt('enrollmentId');

            if (enrollmentId != null) {// Add a null-check for studentId
              final completeUrl = '${UrlConstants.baseUrl}$loginEndpoint/';
        print(completeUrl);
              if (token != null) {
                // const completeUrl = '${UrlConstants.baseUrl}$loginEndpoint';
                print(completeUrl);

                final response = await http.get(
                  Uri.parse(completeUrl),
                  headers: {'Authorization': token},
                );
                print('Student Attendance has been here ');

                log(response.body);


                if (response.statusCode == 200) {
                  // API call successful
                  Map<String, dynamic> responseData = json.decode(response.body);
                  AttendanceRequestModel model = AttendanceRequestModel.fromJson(
                      responseData);

                  print('..,,..//');
                  //showToast(response.body);

                  _attendanceDetailsStreamController.sink.add(model.data ?? []);
                }
              }else {
                // API call failed
              }
            }
          }

          void dispose() {
            _attendanceDetailsStreamController.close();
          }
        }
*/
/*
//
// int? enrollmentId = prefs.getInt('EnrollmentId');
//
// if (enrollmentId != null) { // Add a null-check for studentId
// String completeUrl = '${UrlConstants.baseUrl}$placementEndpoint/$courseId/$studentId';
// if (token != null) {
// try {
// final response = await http.get(
// Uri.parse(completeUrl),
// headers: {'Authorization': token},
// );
// log(response.body);
// print(completeUrl);
//
// if (response.statusCode == 200) {
// Map<String, dynamic> responseData = json.decode(response.body);
// PlacementModel model = PlacementModel.fromJson(responseData);
// _placementStreamController.sink.add(model);
// } else {
// _placementStreamController.sink
//     .addError('Something went wrong, please try again later');
// }
// } catch (e) {
// _placementStreamController.sink.addError('An error occurred: $e');
// }
// }
// } else {
// // Handle the case where studentId is null
// _placementStreamController.sink.addError('Student ID is null');
// }
// }
*/

import 'dart:async';
import 'dart:developer';
import 'package:bitcode_student_app/Batch/Model/batch_request_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../UrlConstants/url_constants.dart';
import '../../Attendance/Model/attendance_model.dart';
import '../../Util/show_toast.dart';
import '../Model/attendance_model.dart' as attendance_request_model;
import '../Model/attendance_model.dart';

class StudentAttendanceBloc {
  int? enrollmentId;

  BatchRequestModel batch=BatchRequestModel();

  static const String loginEndpoint = 'apis/student/attendance';
  final _attendanceDetailsStreamController = StreamController<List<attendance_request_model.Data>>();

  Stream<List<attendance_request_model.Data>> get attendanceDetailsStream =>
      _attendanceDetailsStreamController.stream;


  void fetchDataFromApi() async {
    print('this i the ');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');




    print('This Is the first ');
    print('This Is the first2 ');
    final completeUrl = '${UrlConstants.baseUrl}$loginEndpoint/48';
    print(completeUrl);
    print('This Is the first 3');
    if (token != null) {
      print(completeUrl);

      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );
      print('Student Attendance has been here');

      log(response.body);

      if (response.statusCode == 200) {
        print('This Is the first 4');
        Map<String, dynamic> responseData = json.decode(response.body);

        // AttendanceRequestModel.AttendanceRequestModel model =
        //     AttendanceRequestModel.AttendanceRequestModel.fromJson(
        //         responseData);
        print('This Is the first 5');
        // AttendanceRequestModel model = AttendanceRequestModel.fromJson(responseData);

        print('This Is the first 6');
        showToast(response.body);

        print('This Is the first 7');

        attendance_request_model.AttendanceRequestModel model = attendance_request_model.AttendanceRequestModel.fromJson(responseData);
        _attendanceDetailsStreamController.sink.add(model.data ?? []);
      }
    } else {
      // API call failed
    }
    }

  void dispose() {
    _attendanceDetailsStreamController.close();
  }
}

// /*
//
// import 'dart:async';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../UrlConstants/url_constants.dart';
// import '../../Util/show_toast.dart';
// import '../Model/attendance_model.dart' as attendance_request_model;
//
//
// class StudentAttendanceBloc {
//   // static const loginEndpoint = 'https://bitcode.in:3000/apis/student/batches/55';
//   static const String loginEndpoint = 'apis/student/batches';
//   //static const String value = '55';
//   final _batchDetailsStreamController =
//   StreamController<List<attendance_request_model.Data>>();
//
//   Stream<List<attendance_request_model.Data>> get attendanceDetailsStream =>
//       _batchDetailsStreamController.stream;
//
//   void fetchDataFromApi() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('LoginToken');
//
//     var param =
//     prefs.getInt('StudentId'); //TODO: Make SharedPreference as const
//     print(param);
//     var enrollment = prefs.getInt('enrollmentId');
//     print('//');
//     print(enrollment);
//
//     if (token != null) {
//       const completeUrl = 'https://bitcode.in:3000/apis/student/attendance/48';
//       // final completeUrl = '${UrlConstants.baseUrl}$loginEndpoint/$param';
//       print(completeUrl);
//       final response = await http.get(
//         Uri.parse(completeUrl),
//         headers: {'Authorization': token},
//       );
//
//       log(response.body);
//
//       if (response.statusCode == 200) {
//         // API call successful
//         Map<String, dynamic> responseData = json.decode(response.body);
//         attendance_request_model.AttendanceRequestModel model = attendance_request_model.AttendanceRequestModel.fromJson(responseData);
//         // AttendanceRequestModel model = AttendanceRequestModel.fromJson(responseData);
//
//         showToast(response.body);
//         showToast('Clicked');
//
//         _batchDetailsStreamController.sink.add(model.data ?? []);
//       } else {
//         // API call failed
//         // Handle errors or display appropriate error message to the user
//       }
//     }
//   }
//   void dispose() {
//     _batchDetailsStreamController.close();
//   }
// }
// */
