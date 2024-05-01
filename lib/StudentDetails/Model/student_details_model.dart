
class StudentInfoModel{
int? responseCode;
String? message;
Data? data;

StudentInfoModel({this.responseCode, this.message, this.data});

StudentInfoModel.fromJson(Map<String, dynamic> json) {
  responseCode = json['response_code'];
  message = json['message'];
  data = json['data'] != null ? Data.fromJson(json['data']) : null;
}

}

class Data {
int? studentId;
String? studentName;
int? gender;
String? birthDate;
String? registrationDateTime;
String? localAddress;
String? localCity;
int? localCityPin;
String? localCityState;
String? permanentAddress;
String? permanentCity;
String? permanentCityState;
int? permanentCityPin;
String? college;
String? collegeCity;
int? collegePin;
String? contactNo;
String? email;
String? contactNumberRelative;
String? emailRelative;
int? dnd;
String? imageUrl;
String? referralMedium;
List<Null>? studentDocuments;
String? studentResume;

Data({
this.studentId,
this.studentName,
this.gender,
this.birthDate,
this.registrationDateTime,
this.localAddress,
this.localCity,
this.localCityPin,
this.localCityState,
this.permanentAddress,
this.permanentCity,
this.permanentCityState,
this.permanentCityPin,
this.college,
this.collegeCity,
this.collegePin,
this.contactNo,
this.email,
this.contactNumberRelative,
this.emailRelative,
this.dnd,
this.imageUrl,
this.referralMedium,
this.studentDocuments,
this.studentResume,
});

Data.fromJson(Map<String, dynamic> json) {
studentId = json['student_id'];
studentName = json['student_name'];
gender = json['gender'];
birthDate = json['birth_date'];
registrationDateTime = json['registration_date_time'];
localAddress = json['local_address'];
localCity = json['local_city'];
localCityPin = json['local_city_pin'];
localCityState = json['local_city_state'];
permanentAddress = json['permanent_address'];
permanentCity = json['permanent_city'];
permanentCityState = json['permanent_city_state'];
permanentCityPin = json['permanent_city_pin'];
college = json['college'];
collegeCity = json['college_city'];
collegePin = json['college_pin'];
contactNo = json['contact_no'];
email = json['email'];
contactNumberRelative = json['contact_number_relative'];
emailRelative = json['email_relative'];
dnd = json['dnd'];
imageUrl = json['image_url'];
referralMedium = json['referral_medium'];
studentDocuments = json['student_documents']!= null? List<Null>.from(json['student_documents']) : null;
studentResume = json['student_resume'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = {};
data['student_id'] = studentId;
data['student_name'] = studentName;
data['gender'] = gender;
data['birth_date'] = birthDate;
data['registration_date_time'] = registrationDateTime;
data['local_address'] = localAddress;
data['local_city'] = localCity;
data['local_city_pin'] = localCityPin;
data['local_city_state'] = localCityState;
data['permanent_address'] = permanentAddress;
data['permanent_city'] = permanentCity;
data['permanent_city_state'] = permanentCityState;
data['permanent_city_pin'] = permanentCityPin;
data['college'] = college;
data['college_city'] = collegeCity;
data['college_pin'] = collegePin;
    data['contact_no']=contactNo;
    data['email'].email;
    data['contact_number_relative']=contactNumberRelative;
    data['email_relative']=emailRelative;
    data['dnd']=dnd;
    data['image_url']=imageUrl;
    data['referral_medium']=referralMedium;
    // if (this.studentDocuments != null) {
    //   data['student_documents'] =
    //       this.studentDocuments!.map((v) => v.toJson()).toList();
    // }
    data['student_resume']=studentResume;
    return data;
  }
  }