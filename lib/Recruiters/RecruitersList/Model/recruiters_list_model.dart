class RecruiterModel {
  int? responseCode;
  String? message;
  late  List<Data> data;

  RecruiterModel({this.responseCode, this.message, required this.data});

  RecruiterModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response_code'] = this.responseCode;
    data['message'] = this.message;
    data['data'] = this.data.map((v) => v.toJson()).toList();
      return data;
  }
}

class Data {
 late int recruitmentCallId;
 late String title;
 late String description;
 late int numberOfPositions;
 late String companyName;
 late String companyCity;
 late String companyContactNumber;
 late String companyEmail;

  Data(
      {
       required this.recruitmentCallId,
       required this.title,
       required this.description,
       required this.numberOfPositions,
      required  this.companyName,
      required  this.companyCity,
      required  this.companyContactNumber,
       required this.companyEmail});

  Data.fromJson(Map<String, dynamic> json) {
    recruitmentCallId = json['recruitment_call_id'];
    title = json['title'];
    description = json['description'];
    numberOfPositions = json['number_of_positions'];
    companyName = json['company_name'];
    companyCity = json['company_city'];
    companyContactNumber = json['company_contact_number'];
    companyEmail = json['company_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recruitment_call_id'] = this.recruitmentCallId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['number_of_positions'] = this.numberOfPositions;
    data['company_name'] = this.companyName;
    data['company_city'] = this.companyCity;
    data['company_contact_number'] = this.companyContactNumber;
    data['company_email'] = this.companyEmail;
    return data;
  }
}