class PlacementModel {
  int? responseCode;
  String? message;
  List<Data>? data;

  PlacementModel({this.responseCode, this.message, this.data});

  PlacementModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? recruitmentCallCourseId;
  int? recruitmentCallId;
  String? recruitmentTitle;
  String? recruitmentDescription;
  String? addedOn;
  String? companyName;
  String? companyAddress;
  String? companyWebsite;
  String? imageUrl;
  String? isAttended;

  Data({
    this.recruitmentCallCourseId,
    this.recruitmentCallId,
    this.recruitmentTitle,
    this.recruitmentDescription,
    this.addedOn,
    this.companyName,
    this.companyAddress,
    this.companyWebsite,
    this.imageUrl,
    this.isAttended});

  Data.fromJson(Map<String, dynamic> json) {
    recruitmentCallCourseId = json['recruitment_call_course_id'];
    recruitmentCallId = json['recruitment_call_id'];
    recruitmentTitle = json['recruitment_title'];
    recruitmentDescription = json['recruitment_description'];
    addedOn = json['added_on'];
    companyName = json['company_name'];
    companyAddress = json['company_address'];
    companyWebsite = json['company_website'];
    imageUrl = json['image_url'];
    isAttended = json['is_attended'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recruitment_call_course_id'] = recruitmentCallCourseId;
    data['recruitment_call_id'] = recruitmentCallId;
    data['recruitment_title'] = recruitmentTitle;
    data['recruitment_description'] = recruitmentDescription;
    data['added_on'] = addedOn;
    data['company_name'] = companyName;
    data['company_address'] = companyAddress;
    data['company_website'] = companyWebsite;
    data['image_url'] = imageUrl;
    data['is_attended'] = isAttended;
    return data;
  }
}