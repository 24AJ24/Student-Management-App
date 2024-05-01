class FeedbackRequestModel {
  final int? responseCode;
  final String? message;
  final List<Data>? data;

  FeedbackRequestModel({this.responseCode, this.message, this.data});

  factory FeedbackRequestModel.fromJson(Map<String, dynamic> json) {
    final dataList = json['data'] is List? (json['data'] as List).cast<Map<String, dynamic>>() : null;
    final data = dataList?.map((item) => Data.fromJson(item)).toList();

    return FeedbackRequestModel(
      responseCode: json['response_code'],
      message: json['message'],
      data: data,
    );
  }

  Map<String, dynamic> toJson() {
    final data = this.data?.map((item) => item.toJson()).toList();

    return {
      'response_code': responseCode,
      'message': message,
      'data': data,
    };
  }
}

class Data {
  final int feedbackId;
  final String feedbackTitle;
  final String feedbackCreatedOn;
  final String expiryDate;
  final bool isSubmitted;

  Data({
    required this.feedbackId,
    required this.feedbackTitle,
    required this.feedbackCreatedOn,
    required this.expiryDate,
    required this.isSubmitted,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      feedbackId: json['feedbackId'],
      feedbackTitle: json['feedbackTitle'],
      feedbackCreatedOn: json['feedbackCreatedOn'],
      expiryDate: json['expiryDate'],
      isSubmitted: json['isSubmitted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'feedbackId': feedbackId,
      'feedbackTitle': feedbackTitle,
      'feedbackCreatedOn': feedbackCreatedOn,
      'expiryDate': expiryDate,
      'isSubmitted': isSubmitted,
    };
  }
}
