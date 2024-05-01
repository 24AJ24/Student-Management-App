/*
import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../UrlConstants/url_constants.dart';
import '../../Util/show_toast.dart';
import '../Model/message_list_model.dart';

class StudentMessageListBloc {
  final _messageDetailsStreamController =
  StreamController<List<MessageListModel>>();

  Stream<List<MessageListModel>> get messageDetailsStream =>
      _messageDetailsStreamController.stream;

  void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    if (token != null) {
      //apis/student/message/10
      const completeUrl = 'https://bitcode.in:3000/apis/student/message/0/20';
      print(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );

      log(response.body);

      if (response.statusCode == 200) {
        // API call successful
        List<dynamic> responseData = json.decode(response.body);
        List<MessageListModel> messageList =
        responseData.map((item) => MessageListModel.fromJson(item)).toList();

        showToast('Clicked');

        _messageDetailsStreamController.sink.add(messageList);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
      }
    }
  }

  void dispose() {
    _messageDetailsStreamController.close();
  }
}
*/

import 'dart:async';
import 'dart:developer';
import 'package:bitcode_student_app/Commons/text_style__constants.dart';
import 'package:flutter/cupertino.dart';
import '../../../UrlConstants/url_constants.dart';
import '../BLoc/message_list_bloc.dart';
import '../Model/message_list_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MessagesListBLoc {

  final _messageListStreamController = StreamController<List<Data>>();
  Stream<List<Data>> get studentMessageStream =>
      _messageListStreamController.stream;
  // String get loginEndpoint => 'apis/student/placement/calls/5/0/20';
  void fetchDataFromApi(int messageid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    // MessageListModel new= MessageListModel[index].recruitmentCallCourseId;


    if (token != null) {
      const completeUrl = 'https://bitcode.in:3000/apis/student/message/0/20';
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
        MessageListModel model = MessageListModel.fromJson(responseData);
        log(response.body);
        _messageListStreamController.sink.add(model.data ?? []);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
        _messageListStreamController.sink.addError(
          const Text(
            'Something went wrong, please try again Later',
            style: TextStyleConstants.titleStyle,
          ),
        );
      }
    }
  }
  void dispose() {
    _messageListStreamController.close();
  }
}
