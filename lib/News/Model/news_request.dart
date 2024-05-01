// class NewsRequest {
//   int? responseCode;
//   String? message;
//   late Data data;
//
//   NewsRequest({this.responseCode, this.message, required this.data});
//
//   NewsRequest.fromJson(Map<String, dynamic> json) {
//     responseCode = json['response_code'];
//     message = json['message'];
//     data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['response_code'] = this.responseCode;
//     data['message'] = this.message;
//     data['data'] = this.data.toJson();
//       return data;
//   }
// }
//
// class Data {
//   late int newsId;
//   late int newsCategoryId;
//
//   Data(
//       {required this.newsId,
//         required this.newsCategoryId,
//         });
//
//   Data.fromJson(Map<String, dynamic> json) {
//     newsId = json['news_id'];
//     newsCategoryId = json['news_category_id'];
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['news_id'] = this.newsId;
//     data['news_category_id'] = this.newsCategoryId;
//
//     }
//     return data;
//   }
// }

class NewsRequest {
  int responseCode;
  String message;
  Data data;

  NewsRequest({
    required this.responseCode,
    required this.message,
    required this.data,
  });

  factory NewsRequest.fromJson(Map<String, dynamic> json) {
    return NewsRequest(
      responseCode: json['response_code'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  int newsId;
  String newsCategoryId;

  Data({
    required this.newsId,
    required this.newsCategoryId,

  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      newsId: json['newsId'],
      newsCategoryId: json['newsCategoryId'],
    );
  }
}