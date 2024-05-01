import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';

import '../../UrlConstants/url_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/news_model.dart';

class LatestNewsBloc {

  final _latestNewsStreamController = StreamController<List<Data>>();

  Stream<List<Data>> get latestNewsStream =>
      _latestNewsStreamController.stream;

  String get loginEndpoint => 'apis/student/news/0/10';

  void fetchDataFromApi(int newsCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');
    int? param =  prefs.getInt('newsId');


    if (token != null) {
      //const completeUrl = 'http://192.168.0.112:3000/apis/student/news/0/10';
      String completeUrl = UrlConstants.baseUrl+loginEndpoint;
      log(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );
      log(response.body);
      if (response.statusCode == 200) {
        // API call successful
        Map<String, dynamic> responseData = json.decode(response.body);
        LatestNewsModel model = LatestNewsModel.fromJson(responseData);

        log(response.body);
        // showToast(response.body);

        _latestNewsStreamController.sink.add(model.data ?? []);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
      }
    }
  }

  void dispose() {
    _latestNewsStreamController.close();
  }
}