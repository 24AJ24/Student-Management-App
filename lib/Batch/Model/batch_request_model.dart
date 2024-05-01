/*
class BatchRequestModel {
  int? responseCode;
  String? message;
  List<Data>? data;

  BatchRequestModel({this.responseCode, this.message, this.data});

  BatchRequestModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? enrollmentId;
  int? batchId;
  int? studentId;
  String? enrollmentDate;
  String? batchStartDate;
  String? batchEndDate;
  int? staffId;
  int? fees;
  double? discount;
  int? enrollmentStatus;
  int? batchStatus;
  String? batchTitle;
  String? courseTitle;
  String? classroomTitle;
  String? attendanceInPercentage;
  bool? paymentStatus;
  int? pendingFees;

  Data(
      {this.enrollmentId,
        this.batchId,
        this.studentId,
        this.enrollmentDate,
        this.batchStartDate,
        this.batchEndDate,
        this.staffId,
        this.fees,
        this.discount,
        this.enrollmentStatus,
        this.batchStatus,
        this.batchTitle,
        this.courseTitle,
        this.classroomTitle,
        this.attendanceInPercentage,
        this.paymentStatus,
        this.pendingFees});

  Data.fromJson(Map<String, dynamic> json) {
    enrollmentId = json['enrollment_id'];
    batchId = json['batch_id'];
    studentId = json['student_id'];
    enrollmentDate = json['enrollment_date'];
    batchStartDate = json['batch_start_date'];
    batchEndDate = json['batch_end_date'];
    staffId = json['staff_id'];
    fees = json['fees'];
    discount = json['discount']?.toDouble();
    enrollmentStatus = json['enrollment_status'];
    batchStatus = json['batch_status'];
    batchTitle = json['batch_title'];
    courseTitle = json['course_title'];
    classroomTitle = json['classroom_title'];
    attendanceInPercentage = json['attendance_in_percentage'];
    paymentStatus = json['payment_status'];
    pendingFees = json['pending_fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enrollment_id'] = this.enrollmentId;
    data['batch_id'] = this.batchId;
    data['student_id'] = this.studentId;
    data['enrollment_date'] = this.enrollmentDate;
    data['batch_start_date'] = this.batchStartDate;
    data['batch_end_date'] = this.batchEndDate;
    data['staff_id'] = this.staffId;
    data['fees'] = this.fees;
    data['discount'] = this.discount;
    data['enrollment_status'] = this.enrollmentStatus;
    data['batch_status'] = this.batchStatus;
    data['batch_title'] = this.batchTitle;
    data['course_title'] = this.courseTitle;
    data['classroom_title'] = this.classroomTitle;
    data['attendance_in_percentage'] = this.attendanceInPercentage;
    data['payment_status'] = this.paymentStatus;
    data['pending_fees'] = this.pendingFees;
    return data;
  }
}
*/


class BatchRequestModel {
  int? responseCode;
  String? message;
  List<Data>? data;

  BatchRequestModel({this.responseCode, this.message, this.data});

  BatchRequestModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late int enrollmentId;
  int? batchId;
  int? studentId;
  String? enrollmentDate;
  String? batchStartDate;
  String? batchEndDate;
  int? staffId;
  int? fees;
  double? discount;
  int? enrollmentStatus;
  int? batchStatus;
  String? batchTitle;
  String? courseTitle;
  String? classroomTitle;
  String? attendanceInPercentage;
  bool? paymentStatus;
  int? pendingFees;

  Data(
      {
        required this.enrollmentId,
        this.batchId,
        this.studentId,
        this.enrollmentDate,
        this.batchStartDate,
        this.batchEndDate,
        this.staffId,
        this.fees,
        this.discount,
        this.enrollmentStatus,
        this.batchStatus,
        this.batchTitle,
        this.courseTitle,
        this.classroomTitle,
        this.attendanceInPercentage,
        this.paymentStatus,
        this.pendingFees});

  Data.fromJson(Map<String, dynamic> json) {
    enrollmentId = json['enrollment_id'];
    batchId = json['batch_id'];
    studentId = json['student_id'];
    enrollmentDate = json['enrollment_date'];
    batchStartDate = json['batch_start_date'];
    batchEndDate = json['batch_end_date'];
    staffId = json['staff_id'];
    fees = json['fees'];
    discount = json['discount']?.toDouble();
    enrollmentStatus = json['enrollment_status'];
    batchStatus = json['batch_status'];
    batchTitle = json['batch_title'];
    courseTitle = json['course_title'];
    classroomTitle = json['classroom_title'];
    attendanceInPercentage = json['attendance_in_percentage'];
    paymentStatus = json['payment_status'];
    pendingFees = json['pending_fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enrollment_id'] = this.enrollmentId;
    data['batch_id'] = this.batchId;
    data['student_id'] = this.studentId;
    data['enrollment_date'] = this.enrollmentDate;
    data['batch_start_date'] = this.batchStartDate;
    data['batch_end_date'] = this.batchEndDate;
    data['staff_id'] = this.staffId;
    data['fees'] = this.fees;
    data['discount'] = this.discount;
    data['enrollment_status'] = this.enrollmentStatus;
    data['batch_status'] = this.batchStatus;
    data['batch_title'] = this.batchTitle;
    data['course_title'] = this.courseTitle;
    data['classroom_title'] = this.classroomTitle;
    data['attendance_in_percentage'] = this.attendanceInPercentage;
    data['payment_status'] = this.paymentStatus;
    data['pending_fees'] = this.pendingFees;
    return data;
  }
}
