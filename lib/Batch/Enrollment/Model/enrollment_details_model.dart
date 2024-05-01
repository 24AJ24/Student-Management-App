class EnrollmentDetailsModel {
  int? responseCode;
  String? message;
  Data? data;

  EnrollmentDetailsModel({
    this.responseCode, this.message, this.data
  });

  EnrollmentDetailsModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  int? fees;
  int? discount;
  String? batchTitle;
  String? courseTitle;
  String? classroomTitle;
  int? batchStatus;
  List<Payments>? payments;
  bool? paymentStatus;
  int? pendingFees;

  Data(
      {this.enrollmentId,
        this.batchId,
        this.studentId,
        this.enrollmentDate,
        this.batchStartDate,
        this.batchEndDate,
        this.fees,
        this.discount,
        this.batchTitle,
        this.courseTitle,
        this.classroomTitle,
        this.batchStatus,
        this.payments,
        this.paymentStatus,
        this.pendingFees});

  Data.fromJson(Map<String, dynamic> json) {
    enrollmentId = json['enrollment_id'];
    batchId = json['batch_id'];
    studentId = json['student_id'];
    enrollmentDate = json['enrollment_date'];
    batchStartDate = json['batch_start_date'];
    batchEndDate = json['batch_end_date'];
    fees = json['fees'];
    discount = json['discount'];
    batchTitle = json['batch_title'];
    courseTitle = json['course_title'];
    classroomTitle = json['classroom_title'];
    batchStatus = json['batch_status'];
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
      });
    }
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
    data['fees'] = this.fees;
    data['discount'] = this.discount;
    data['batch_title'] = this.batchTitle;
    data['course_title'] = this.courseTitle;
    data['classroom_title'] = this.classroomTitle;
    data['batch_status'] = this.batchStatus;
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    data['payment_status'] = this.paymentStatus;
    data['pending_fees'] = this.pendingFees;
    return data;
  }
}

class Payments {
  int? batchPaymentId;
  int? paidAmount;
  String? paymentDateTime;
  int? paymentModeId;
  String? paymentReferenceCode;
  int? paymentStatus;
  String? paymentMode;

  Payments(
      {this.batchPaymentId,
        this.paidAmount,
        this.paymentDateTime,
        this.paymentModeId,
        this.paymentReferenceCode,
        this.paymentStatus,
        this.paymentMode});

  Payments.fromJson(Map<String, dynamic> json) {
    batchPaymentId = json['batch_payment_id'];
    paidAmount = json['paid_amount'];
    paymentDateTime = json['payment_date_time'];
    paymentModeId = json['payment_mode_id'];
    paymentReferenceCode = json['payment_reference_code'];
    paymentStatus = json['payment_status'];
    paymentMode = json['payment_mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['batch_payment_id'] = this.batchPaymentId;
    data['paid_amount'] = this.paidAmount;
    data['payment_date_time'] = this.paymentDateTime;
    data['payment_mode_id'] = this.paymentModeId;
    data['payment_reference_code'] = this.paymentReferenceCode;
    data['payment_status'] = this.paymentStatus;
    data['payment_mode'] = this.paymentMode;
    return data;
  }
}