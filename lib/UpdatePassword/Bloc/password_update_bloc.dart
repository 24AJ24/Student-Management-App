/*import 'dart:async';
import '../Model/password_update_model.dart';
class UpdatePassword{
  final _updatePasswordStreamController = StreamController<List<Data>>();*/


//}
//
// class LatestNewsBloc {
//
//   final _latestNewsStreamController = StreamController<List<Data>>();
//
//   Stream<List<Data>> get latestNewsStream =>
//       _latestNewsStreamController.stream;
//
//   String get loginEndpoint => 'apis/student/news/0/10';
//
//   void fetchDataFromApi(int newsCode) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('LoginToken');
//     int? param =  prefs.getInt('newsId');
//
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
//       if (response.statusCode == 200) {
//         // API call successful
//         Map<String, dynamic> responseData = json.decode(response.body);
//         LatestNewsModel model = LatestNewsModel.fromJson(responseData);
//
//         log(response.body);
//         // showToast(response.body);
//
//         _latestNewsStreamController.sink.add(model.data ?? []);
//       } else {
//         // API call failed
//         // Handle errors or display appropriate error message to the user
//       }
//     }
//   }
//
//   void dispose() {
//     _latestNewsStreamController.close();
//   }
// }



import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/password_update_model.dart';

Future<void> updatePassword(UpdatePassword updatePassword) async {
  final url = Uri.parse('https://bitcode.in:3000/apis/student/55');

  final response = await http.put(
    url,
    headers: {
      'Content-Type': 'application/json',
      // Add any other required headers here
    },
    body: json.encode(updatePassword.toJson()),
  );

  if (response.statusCode == 200) {
    // Password updated successfully
    print('Password updated successfully');
  } else {
    // Handle API error
    print('Failed to update password. Status code: ${response.statusCode}');
  }
}
