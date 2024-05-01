// //
// /*
// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Bloc/placement_bloc.dart';
// import '../Model/placement_model.dart';
// import '../../../UrlConstants/url_constants.dart';
// import 'dart:convert';
//
// class PlacementInBloc {
//   final _placementStreamController = StreamController<PlacementModel>();
//   Stream<PlacementModel> get placementStream =>
//       _placementStreamController.stream;
//   String get placementEndpoint =>
//       'apis/admin/placement/call/81/39'; // Replace with your endpoint
//   void fetchDataFromApi(int courseId) async {
//     debugPrint("id $courseId");
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('LoginToken');
//     if (token != null) {
//       String completeUrl = UrlConstants.baseUrl + placementEndpoint;
//       log(completeUrl);
//       final response = await http.get(
//         Uri.parse(completeUrl),
//         headers: {'Authorization': token},
//       );
//       log(response.body);
//       if (response.statusCode == 200) {
//         Map<String, dynamic> responseData = json.decode(response.body);
//         PlacementModel model = PlacementModel.fromJson(responseData);
//         _placementStreamController.sink.add(model);
//       } else {
//         _placementStreamController.sink
//             .addError('Something went wrong, please try again later');
//       }
//     }
//   }
//
//   void dispose() {
//     _placementStreamController.close();
//   }
// }*/
// ///dfs
// ////*
// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../Model/placement_model.dart';
// import '../../../UrlConstants/url_constants.dart';
// import 'package:bitcode_student_app/Auth/Model/login_response_model.dart';
// import '../Bloc/placement_bloc.dart';
// import 'dart:convert';
//
// class PlacementInBloc {
//   final _placementStreamController = StreamController<PlacementModel>();
//   Stream<PlacementModel> get placementStream =>
//       _placementStreamController.stream;
//   String get placementEndpoint => 'apis/admin/placement/call';
//       // 'apis/admin/placement/call/81/39'; // Replace with your endpoint
//   void fetchDataFromApi(int courseId) async {
//     debugPrint("id $courseId");
//     // debugPrint("id $student ");
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('LoginToken');
//     if (token != null) {
//
//       var studentId = LoginResponseModel.fromJson(jsonDecode(response.body))
//           .data
//           .studentId;
//
//       String completeUrl = '${UrlConstants.baseUrl}$placementEndpoint/$courseId/$studentId';
//       log(completeUrl);
//       final response = await http.get(
//         Uri.parse(completeUrl),
//         headers: {'Authorization': token},
//       );
//       log(response.body);
//       if (response.statusCode == 200) {
//
//
//
//
//         Map<String, dynamic> responseData = json.decode(response.body);
//         PlacementModel model = PlacementModel.fromJson(responseData);
//         _placementStreamController.sink.add(model);
//       } else {
//         _placementStreamController.sink
//             .addError('Something went wrong, please try again later');
//       }
//     }
//   }
//
//   void dispose() {
//     _placementStreamController.close();
//   }
// }*/


// /*
//
// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../Auth/Model/login_response_model.dart';
// import '../Model/placement_model.dart';
// import '../../../UrlConstants/url_constants.dart';
// import 'package:bitcode_student_app/Auth/Bloc/login_bloc.dart' as LoginFormBloc;
// import 'dart:convert';
//
//
//
//
// class PlacementInBloc {
//   final _placementStreamController = StreamController<PlacementModel>();
//   Stream<PlacementModel> get placementStream =>
//       _placementStreamController.stream;
//   String get placementEndpoint => 'apis/admin/placement/call';
//
//   // void fetchDataFromApi(int courseId,) async {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String? token = prefs.getString('LoginToken');
//   //   int? studentId= prefs.getInt('StudentId');
//   //
//   //   String completeUrl = '${UrlConstants.baseUrl}$placementEndpoint/$courseId/$studentId';
//   //   if (token != null) {
//   //     //
//   //
//   //     // String completeUrl = '${UrlConstants.baseUrl}$placementEndpoint/$courseId/$studentId';
//   //
//   //     try {
//   //       final response = await http.get(
//   //         Uri.parse(completeUrl),
//   //         headers: {'Authorization': token},
//   //       );
//   //       log(response.body);
//   //
//   //       if (response.statusCode == 200) {
//   //
//   //
//   //
//   //         var studentId = LoginResponseModel.fromJson(jsonDecode(response.body))
//   //             .data
//   //             .studentId;
//   //         var sharedPref = await SharedPreferences.getInstance();
//   //         sharedPref.setInt('StudentId', studentId);
//   //
//   //
//   //
//   //         Map<String, dynamic> responseData = json.decode(response.body);
//   //         PlacementModel model = PlacementModel.fromJson(responseData);
//   //         _placementStreamController.sink.add(model);
//   //       } else {
//   //         _placementStreamController.sink
//   //             .addError('Something went wrong, please try again later');
//   //       }
//   //     } catch (e) {
//   //       _placementStreamController.sink.addError('An error occurred: $e');
//   //     }
//   //   }
//   // }
//
//   void fetchDataFromApi(int courseId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('LoginToken');
//     int? studentId = prefs.getInt('StudentId');
//
//     if (studentId != null) { // Add a null-check for studentId
//       String completeUrl = '${UrlConstants.baseUrl}$placementEndpoint/$courseId/$studentId';
//       if (token != null) {
//         try {
//           final response = await http.get(
//             Uri.parse(completeUrl),
//             headers: {'Authorization': token},
//           );
//           log(response.body);
//           print(completeUrl);
//
//           if (response.statusCode == 200) {
//             Map<String, dynamic> responseData = json.decode(response.body);
//             PlacementModel model = PlacementModel.fromJson(responseData);
//             _placementStreamController.sink.add(model);
//           } else {
//             _placementStreamController.sink
//                 .addError('Something went wrong, please try again later');
//           }
//         } catch (e) {
//           _placementStreamController.sink.addError('An error occurred: $e');
//         }
//       }
//     } else {
//       // Handle the case where studentId is null
//       _placementStreamController.sink.addError('Student ID is null');
//     }
//   }
//
//
//
//   //TODO: THIS IS THE RIGHT ONE
//   // 'apis/admin/placement/call/81/39'; // Replace with your endpoint
//   // void fetchDataFromApi(int courseId) async {
//   //   debugPrint("id $courseId");
//   //   // debugPrint("id $student ");
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   String? token = prefs.getString('LoginToken');
//   //   if (token != null) {
//   //
//   //     var studentId = LoginResponseModel.fromJson(jsonDecode(response.body))
//   //         .data
//   //         .studentId;
//   //
//   //     String completeUrl = '${UrlConstants.baseUrl}$placementEndpoint/$courseId/$studentId';
//   //     log(completeUrl);
//   //     final response = await http.get(
//   //       Uri.parse(completeUrl),
//   //       headers: {'Authorization': token},
//   //     );
//   //     log(response.body);
//   //     if (response.statusCode == 200) {
//   //
//   //
//   //
//   //
//   //       Map<String, dynamic> responseData = json.decode(response.body);
//   //       PlacementModel model = PlacementModel.fromJson(responseData);
//   //       _placementStreamController.sink.add(model);
//   //     } else {
//   //       _placementStreamController.sink
//   //           .addError('Something went wrong, please try again later');
//   //     }
//   //   }
//   // }
//
//   void dispose() {
//     _placementStreamController.close();
//   }
// }*/
// /*
//
//
//
// import 'dart:async';
// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../Auth/Model/login_response_model.dart';
// import '../Model/placement_model.dart';
// import '../../../UrlConstants/url_constants.dart';
// import 'package:bitcode_student_app/Auth/Bloc/login_bloc.dart' as LoginFormBloc;
// import 'dart:convert';
//
//
//
//
// class PlacementInBloc {
//   final _placementStreamController = StreamController<PlacementModel>();
//   Stream<PlacementModel> get placementStream =>
//       _placementStreamController.stream;
//   String get placementEndpoint => 'apis/admin/placement/call';
//   void fetchDataFromApi(int courseId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('LoginToken');
//     int? studentId = prefs.getInt('StudentId');
//
//     if (studentId != null) { // Add a null-check for studentId
//       String completeUrl = '${UrlConstants.baseUrl}$placementEndpoint/$courseId/$studentId';
//       if (token != null) {
//         try {
//           final response = await http.get(
//             Uri.parse(completeUrl),
//             headers: {'Authorization': token},
//           );
//           log(response.body);
//           print(completeUrl);
//
//           if (response.statusCode == 200) {
//             Map<String, dynamic> responseData = json.decode(response.body);
//             PlacementModel model = PlacementModel.fromJson(responseData);
//             _placementStreamController.sink.add(model);
//           } else {
//             _placementStreamController.sink
//                 .addError('Something went wrong, please try again later');
//           }
//         } catch (e) {
//           _placementStreamController.sink.addError('An error occurred: $e');
//         }
//       }
//     } else {
//       // Handle the case where studentId is null
//       _placementStreamController.sink.addError('Student ID is null');
//     }
//   }
//
//
//
//   void dispose() {
//     _placementStreamController.close();
//   }
// }
// */





import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Auth/Model/login_response_model.dart';
import '../Model/placement_model.dart';
import '../../../UrlConstants/url_constants.dart';
import 'package:bitcode_student_app/Auth/Bloc/login_bloc.dart' as LoginFormBloc;
import 'dart:convert';




class PlacementInBloc {
  final _placementStreamController = StreamController<PlacementModel>();
  Stream<PlacementModel> get placementStream =>
      _placementStreamController.stream;//11
  String get placementEndpoint => 'apis/admin/placement/call';
  void fetchDataFromApi(int courseId1) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');
    int? studentId = prefs.getInt('StudentId');

    if (studentId != null) { // Add a null-check for studentId
      String completeUrl = '${UrlConstants.baseUrl}$placementEndpoint/$courseId1/$studentId';
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
}