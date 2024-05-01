// import 'dart:async';
// import 'dart:developer';
// import 'dart:ffi';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../UrlConstants/url_constants.dart';
// import '../Model/news_list_model.dart';
//
// class GetNewsDetails {
//
//   final _newsDetailsStreamController = StreamController<List<Data>>();
//
//   Stream<List<Data>> get getNewsStream =>
//       _newsDetailsStreamController.stream;
//   String get loginEndpoint => 'apis/student/news/29';
//
// /*  void fetchDataFromApi() async {
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('LoginToken');
//     String? param= prefs.getString('newsId');
//
//     print(param);
//     // print('///');
//     // var param= prefs.getInt('newsId');
//     // print(param);
//
//     if (token != null) {
//       //const completeUrl = 'http://192.168.0.112:3000/apis/student/news/0/10';
//       String completeUrl = UrlConstants.baseUrl+loginEndpoint;
//       log(completeUrl);
//       final response = await http.get(
//         Uri.parse(completeUrl),
//         headers: {'Authorization': token},
//       );
//       log(response.body);
//
//
//       if (response.statusCode == 200) {
//         // API call successful
//         Map<String, dynamic> responseData = json.decode(response.body);
//         NewsListDetails model = NewsListDetails.fromJson(responseData);
//
//         log(response.body);
//         // showToast(response.body);
//
//        _newsDetailsStreamController.sink.add(model.data ?? []);
//       } else {
//         // API call failed
//         // Handle errors or display appropriate error message to the user
//       }
//     }
//   }*/
//
//   void fetchDataFromApi() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('LoginToken');
//     //String? param = prefs.getString('newsId');
//
//     // var param =prefs.get(key)
//
//     if (token!= null) {
//
//       String completeUrl = UrlConstants.baseUrl + loginEndpoint;
//       final response = await http.get(
//         Uri.parse(completeUrl),
//         headers: {'Authorization': token},
//       );
//
//       if (response.statusCode == 200) {
//         Map<String, dynamic> responseData = json.decode(response.body);
//         var newsId = NewsListDetails.fromJson(jsonDecode(response.body))
//             .data;
//         var sharedPref = await SharedPreferences.getInstance();
//
//
//         NewsListDetails model = NewsListDetails.fromJson(responseData);
//
//         _newsDetailsStreamController.sink.add(model.data?? []);
//       } else {
//         // Handle errors or display appropriate error message to the user
//       }
//     }
//   }
//
//   void dispose() {
//     _newsDetailsStreamController.close();
//   }
// }


import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../Model/news_request.dart' as NewsRequest;
import '../../../UrlConstants/url_constants.dart';
import '../Model/news_list_model.dart';

class GetNewsDetails {
  final _newsDetailsStreamController = StreamController<List<Data>>();

  Stream<List<Data>> get getNewsStream => _newsDetailsStreamController.stream;
  String get newsEndpoint => 'apis/student/news';

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
        NewsListDetails model = NewsListDetails.fromJson(responseData);

        _newsDetailsStreamController.sink.add(model.data ?? []);
      } else {
        // Handle errors or display appropriate error message to the user
      }
    }
  }*/
  void fetchDataFromApi(int newsCode) async {
    debugPrint("id $newsCode");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');


    print(token);

    var param = prefs.getInt('newsId');
    print(param);
    if (token != null) {
      String completeUrl = '${UrlConstants.baseUrl}$newsEndpoint/$newsCode';
      // String completeUrl = 'https://bitcode.in:3000/apis/student/news/29';
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );

      if (response.statusCode == 200) {


        final responseBody = response.body;
        if (responseBody.isNotEmpty) {
          Map<String, dynamic> responseData = json.decode(responseBody);
          NewsListDetails model = NewsListDetails.fromJson(responseData);

          // _newsDetailsStreamController.sink.add(model.data ?? []);
          _newsDetailsStreamController.sink.add([model.data ?? Data()]);

        } else {
          // Handle the case where the response body is empty
          // You can emit an empty list or handle it as needed
          _newsDetailsStreamController.sink.addError("No data found.");
        }
      } else {
        // Handle errors or display appropriate error message to the user
        _newsDetailsStreamController.sink.addError("Error ${response.statusCode}: ${response.reasonPhrase}");
      }
    }
  }


  void dispose() {
    _newsDetailsStreamController.close();
  }
}
