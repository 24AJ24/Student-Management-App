class MessageListModel {
  int? responseCode;
  String? message;
  List<Data>? data;

  MessageListModel({this.responseCode, this.message, this.data});

  MessageListModel.fromJson(Map<String, dynamic> json) {
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
  late int messageId;
  String? messageTitle;
  String? messageText;
  String? sentOn;
  int? sentBy;
  String? addedByName;
  Null? batchTitle;
  Null? staffImageUrl;
  List<Attachments>? attachments;

  Data(
      {
        required this.messageId,
        this.messageTitle,
        this.messageText,
        this.sentOn,
        this.sentBy,
        this.addedByName,
        this.batchTitle,
        this.staffImageUrl,
        this.attachments});

  Data.fromJson(Map<String, dynamic> json) {
    messageId = json['message_id'];
    messageTitle = json['message_title'];
    messageText = json['message_text'];
    sentOn = json['sent_on'];
    sentBy = json['sent_by'];
    addedByName = json['added_by_name'];
    batchTitle = json['batch_title'];
    staffImageUrl = json['staff_image_url'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_id'] = this.messageId;
    data['message_title'] = this.messageTitle;
    data['message_text'] = this.messageText;
    data['sent_on'] = this.sentOn;
    data['sent_by'] = this.sentBy;
    data['added_by_name'] = this.addedByName;
    data['batch_title'] = this.batchTitle;
    data['staff_image_url'] = this.staffImageUrl;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attachments {
  int? messageAttachmentId;
  String? attachmentUrl;
  String? fileType;

  Attachments({this.messageAttachmentId, this.attachmentUrl, this.fileType});

  Attachments.fromJson(Map<String, dynamic> json) {
    messageAttachmentId = json['message_attachment_id'];
    attachmentUrl = json['attachment_url'];
    fileType = json['file_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message_attachment_id'] = this.messageAttachmentId;
    data['attachment_url'] = this.attachmentUrl;
    data['file_type'] = this.fileType;
    return data;
  }
}