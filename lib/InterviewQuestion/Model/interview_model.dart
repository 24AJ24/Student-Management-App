class InterviewModel {
  int? responseCode;
  String? message;
  List<Data>? data;

  InterviewModel({this.responseCode, this.message, this.data});

  InterviewModel.fromJson(Map<String, dynamic> json) {
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
  String? questionTitle;
  String? questionText;
  String? addedOn;
  int? addedBy;
  String? addedByName;
  int? rating;
  String? tags;
  int? subjectId;
  String? subjectTitle;
  int? status;

  Data(
      {this.id,
        this.questionTitle,
        this.questionText,
        this.addedOn,
        this.addedBy,
        this.addedByName,
        this.rating,
        this.tags,
        this.subjectId,
        this.subjectTitle,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionTitle = json['question_title'];
    questionText = json['question_text'];
    addedOn = json['added_on'];
    addedBy = json['added_by'];
    addedByName = json['added_by_name'];
    rating = json['rating'];
    tags = json['tags'];
    subjectId = json['subject_id'];
    subjectTitle = json['subject_title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_title'] = this.questionTitle;
    data['question_text'] = this.questionText;
    data['added_on'] = this.addedOn;
    data['added_by'] = this.addedBy;
    data['added_by_name'] = this.addedByName;
    data['rating'] = this.rating;
    data['tags'] = this.tags;
    data['subject_id'] = this.subjectId;
    data['subject_title'] = this.subjectTitle;
    data['status'] = this.status;
    return data;
  }
}