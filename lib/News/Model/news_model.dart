import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LatestNewsModel {
  int? responseCode;
  String? message;
  List<Data>? data;

  LatestNewsModel({this.responseCode, this.message, this.data});

  LatestNewsModel.fromJson(Map<String, dynamic> json) {
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
  late int newsId;
  late int? newsCategoryId;
  late String? newsCategoryTitle;
  late String? newsTitle;
  late String? newsText;
  late String? publishedOn;
  late String? author;
  late  String? mainImageUrl;
  late  String? authorImageUrl;
  late List<Attachments>? attachments;

  Data({
    required this.newsId,
    required this.newsCategoryId,
    required this.newsCategoryTitle,
    required this.newsTitle,
    required this.newsText,
    required this.publishedOn,
    required this.author,
    required this.mainImageUrl,
    required this.authorImageUrl,
    required this.attachments});

  Data.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'] as int;
    newsCategoryId = json['news_category_id'];
    newsCategoryTitle = json['news_category_title'];
    newsTitle = json['news_title'];
    newsText = json['news_text'];
    publishedOn = json['published_on'];
    author = json['author'];
    mainImageUrl = json['main_image_url'];
    authorImageUrl = json['author_image_url'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_id'] = this.newsId;
    data['news_category_id'] = this.newsCategoryId;
    data['news_category_title'] = this.newsCategoryTitle;
    data['news_title'] = this.newsTitle;
    data['news_text'] = this.newsText;
    data['published_on'] = this.publishedOn;
    data['author'] = this.author;
    data['main_image_url'] = this.mainImageUrl;
    data['author_image_url'] = this.authorImageUrl;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attachments {
  int? newsAttachmentId;
  String? attachmentUrl;

  Attachments({this.newsAttachmentId, this.attachmentUrl});

  Attachments.fromJson(Map<String, dynamic> json) {
    newsAttachmentId = json['news_attachment_id'];
    attachmentUrl = json['attachment_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_attachment_id'] = this.newsAttachmentId;
    data['attachment_url'] = this.attachmentUrl;
    return data;
  }
}