

class AttendanceRequestModel {
  int? responseCode;
  String? message;
  List<Data>? data;

  AttendanceRequestModel({this.responseCode, this.message, this.data});

  AttendanceRequestModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? batchAttendanceId;
  int? batchId;
  String? attendanceDate;
  String? tIMEFORMATBsaInTimeHI;
  String? tIMEFORMATBsaOutTimeHI;
  String? remark;
  String? attendanceTakenBy;
  int? attendance;
  bool? isOnline;

  Data(
      {this.id,
        this.batchAttendanceId,
        this.batchId,
        this.attendanceDate,
        this.tIMEFORMATBsaInTimeHI,
        this.tIMEFORMATBsaOutTimeHI,
        this.remark,
        this.attendanceTakenBy,
        this.attendance,
        this.isOnline});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    batchAttendanceId = json['batch_attendance_id'];
    batchId = json['batch_id'];
    attendanceDate = json['attendance_date'];
    tIMEFORMATBsaInTimeHI = json['TIME_FORMAT(bsa.in_time, "%h:%i" )'];
    tIMEFORMATBsaOutTimeHI = json['TIME_FORMAT(bsa.out_time, "%h:%i" )'];
    remark = json['remark'];
    attendanceTakenBy = json['attendance_taken_by'];
    attendance = json['attendance'];
    isOnline = json['is_online'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['batch_attendance_id'] = this.batchAttendanceId;
    data['batch_id'] = this.batchId;
    data['attendance_date'] = this.attendanceDate;
    data['TIME_FORMAT(bsa.in_time, "%h:%i" )'] = this.tIMEFORMATBsaInTimeHI;
    data['TIME_FORMAT(bsa.out_time, "%h:%i" )'] = this.tIMEFORMATBsaOutTimeHI;
    data['remark'] = this.remark;
    data['attendance_taken_by'] = this.attendanceTakenBy;
    data['attendance'] = this.attendance;
    data['is_online'] = this.isOnline;
    return data;
  }
}