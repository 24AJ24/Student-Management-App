import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../UrlConstants/url_constants.dart';
import '../../Util/show_toast.dart';
import '../Model/feedback_model.dart';

class FeedbackRequestBloc {
  static const String loginEndpoint = 'apis/student/feedbacks';
  final _feedBackStreamController = StreamController<List<Data>>();

  Stream<List<Data>> get feedBackStream => _feedBackStreamController.stream;

  void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');

    var param = prefs.getInt('StudentId');
    print(param);

    if (token != null) {
      final completeUrl = '${UrlConstants.baseUrl}$loginEndpoint/$param';
      print(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );
      print('...///Log Print');
      log(response.body);

      if (response.statusCode == 200) {
        // API call successful
        Map<String, dynamic> responseData = json.decode(response.body);
        FeedbackRequestModel model =
        FeedbackRequestModel.fromJson(responseData);

        //showToast(response.body);

        _feedBackStreamController.sink.add(model.data ?? []);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
      }
    }
  }

  void dispose() {
    _feedBackStreamController.close();
  }
}
