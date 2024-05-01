import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../UrlConstants/url_constants.dart';
import '../../Util/show_toast.dart';
import '../Model/batch_request_model.dart' as batch_request_model;
import '../Model/batch_request_model.dart';

class BatchDetailsBloc {
  // static const loginEndpoint = 'https://bitcode.in:3000/apis/student/batches/55';
  static const String loginEndpoint = 'apis/student/batches';
  //static const String value = '55';
  final _batchDetailsStreamController =
  StreamController<List<batch_request_model.Data>>();

  Stream<List<batch_request_model.Data>> get batchDetailsStream =>
      _batchDetailsStreamController.stream;

  void fetchDataFromApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('LoginToken');
    var param =
    prefs.getInt('StudentId'); //TODO: Make SharedPreference as const
    print(param);
    var enrollment = prefs.getInt('enrollmentId');
    print('//');
    print(enrollment);

    if (token != null) {
      // const completeUrl = 'http://192.168.0.112:3000/apis/student/batches/55';
      final completeUrl = '${UrlConstants.baseUrl}$loginEndpoint/$param';
      print(completeUrl);
      final response = await http.get(
        Uri.parse(completeUrl),
        headers: {'Authorization': token},
      );

      log(response.body);

      if (response.statusCode == 200) {
        // API call successful
        Map<String, dynamic> responseData = json.decode(response.body);
        BatchRequestModel model = BatchRequestModel.fromJson(responseData);

        // showToast(response.body);
        showToast('Clicked');

        _batchDetailsStreamController.sink.add(model.data ?? []);
      } else {
        // API call failed
        // Handle errors or display appropriate error message to the user
      }
    }
  }
  void dispose() {
    _batchDetailsStreamController.close();
  }
}
