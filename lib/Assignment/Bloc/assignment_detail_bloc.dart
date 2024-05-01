import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../UrlConstants/url_constants.dart';
import '../../Util/show_toast.dart';
import '../Model/assignment_details_model.dart';

class AssignmentsDetailsBloc {
  static const String loginEndpoint = 'apis/student/assignments/0/10';

  final _assignmentsDetailsStreamController = StreamController<List<Data>>();

  Stream<List<Data>> get assignmentsDetailsStream =>
      _assignmentsDetailsStreamController.stream;

  void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('LoginToken');

    var param = prefs.getInt('StudentId');

    print(param);

    var enrollment = prefs.getInt('enrollmentId');

    print('//');

    print(enrollment);

    if (token != null) {
      const completeUrl = '${UrlConstants.baseUrl}$loginEndpoint';

      log(completeUrl);

      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );

      log(response.body);

      if (response.statusCode == 200) {
        // API call successful
        Map<String, dynamic> responseData = json.decode(response.body);

        GetAssignmentsDetailsModel model =
            GetAssignmentsDetailsModel.fromJson(responseData);

        if (kDebugMode) {
          print(response);
        }
        if (kDebugMode) {
          print(response.body);
        }
        // showToast(response.body);
        showToast('Clicked');

        _assignmentsDetailsStreamController.sink.add(model.data ?? []);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
      }
    }
  }

  void dispose() {
    _assignmentsDetailsStreamController.close();
  }
}
