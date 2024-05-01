class LoginResponseModel {
   late int responseCode;
   late String message;
   late Data data;

  LoginResponseModel({required this.responseCode, required this.message, required this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    data = (json['data']!= null? Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = responseCode;
    data['message'] = message;
    data['data'] = this.data.toJson(); // Corrected line
    return data;
  }

}

class Data {
  late int studentId;
  late String studentName;
  late  int enrollmentId;
  late  int studentGender;
  late String imageUrl;
  late int courseId;
  late int batchId;
  late  String token;

  Data({
    required this.studentId,
    required this.studentName,
    required this.enrollmentId,
    required this.studentGender,
    required this.imageUrl,
    required this.courseId,
    required this.batchId,
    required this.token});

  Data.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    studentName = json['student_name'];
    enrollmentId = json['enrollment_id'];
    studentGender = json['student_gender'];
    imageUrl = json['image_url'];
    courseId = json['course_id'];
    batchId = json['batch_id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = studentId;
    data['student_name'] = studentName;
    data['enrollment_id'] = enrollmentId;
    data['student_gender'] = studentGender;
    data['image_url'] = imageUrl;
    data['course_id'] = courseId;
    data['batch_id'] = batchId;
    data['token'] = token;
    return data;
  }
}



/*

class LoginResponseModel {
  int responseCode;
  String message;
  Data data;

  LoginResponseModel({
    required this.responseCode,
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      responseCode: json['response_code'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  int studentId;
  String studentName;
  String? imageUrl;
  String token;

  Data({
    required this.studentId,
    required this.studentName,
    required this.imageUrl,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      studentId: json['student_id'],
      studentName: json['student_name'],
      imageUrl: json['image_url'],
      token: json['token'],
    );
  }
}


*/
