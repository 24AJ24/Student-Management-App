class PlacementModel {
  int? responseCode;
  String? message;
  late Data data;

  PlacementModel({this.responseCode, this.message, required this.data});

  PlacementModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    data['message'] = message;
    data['data'] = this.data.toJson();
      return data;
  }
}

class Data {
  late PrimaryInfo primaryInfo;
  late List<Rounds> rounds;

  Data({required this.primaryInfo,required this.rounds});

  Data.fromJson(Map<String, dynamic> json) {
    primaryInfo = (json['primaryInfo'] != null
        ? PrimaryInfo.fromJson(json['primaryInfo'])
        : null)!;
    if (json['rounds'] != null) {
      rounds = <Rounds>[];
      json['rounds'].forEach((v) {
        rounds.add(Rounds.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['primaryInfo'] = primaryInfo.toJson();
      data['rounds'] = rounds.map((v) => v.toJson()).toList();
      return data;
  }
}

class PrimaryInfo {
  int? recruitmentCallCourseId;
  int? courseId;
  int? recruitmentCallId;
  String? recruitmentTitle;
  String? recruitmentDescription;
  String? addedOn;
  String? companyName;
  String? companyAddress;
  String? companyWebsite;
  String? imageUrl;
  int? noOfPositions;
  String? remark;
  String? companyCity;
  int? companyPIN;
  String? companyCountry;
  String? companyContactNo1;
  String? companyContactNo2;
  String? companyEmail1;
  String? companyEmail2;

  PrimaryInfo(
      {this.recruitmentCallCourseId,
        this.courseId,
        this.recruitmentCallId,
        this.recruitmentTitle,
        this.recruitmentDescription,
        this.addedOn,
        this.companyName,
        this.companyAddress,
        this.companyWebsite,
        this.imageUrl,
        this.noOfPositions,
        this.remark,
        this.companyCity,
        this.companyPIN,
        this.companyCountry,
        this.companyContactNo1,
        this.companyContactNo2,
        this.companyEmail1,
        this.companyEmail2});

  PrimaryInfo.fromJson(Map<String, dynamic> json) {
    recruitmentCallCourseId = json['recruitmentCallCourseId'];
    courseId = json['courseId'];
    recruitmentCallId = json['recruitmentCallId'];
    recruitmentTitle = json['recruitmentTitle'];
    recruitmentDescription = json['recruitmentDescription'];
    addedOn = json['addedOn'];
    companyName = json['companyName'];
    companyAddress = json['companyAddress'];
    companyWebsite = json['companyWebsite'];
    imageUrl = json['imageUrl'];
    noOfPositions = json['noOfPositions'];
    remark = json['remark'];
    companyCity = json['companyCity'];
    companyPIN = json['companyPIN'];
    companyCountry = json['companyCountry'];
    companyContactNo1 = json['companyContactNo1'];
    companyContactNo2 = json['companyContactNo2'];
    companyEmail1 = json['companyEmail1'];
    companyEmail2 = json['companyEmail2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recruitmentCallCourseId'] = recruitmentCallCourseId;
    data['courseId'] = courseId;
    data['recruitmentCallId'] = recruitmentCallId;
    data['recruitmentTitle'] = recruitmentTitle;
    data['recruitmentDescription'] = recruitmentDescription;
    data['addedOn'] = addedOn;
    data['companyName'] = companyName;
    data['companyAddress'] = companyAddress;
    data['companyWebsite'] = companyWebsite;
    data['imageUrl'] = imageUrl;
    data['noOfPositions'] = noOfPositions;
    data['remark'] = remark;
    data['companyCity'] = companyCity;
    data['companyPIN'] = companyPIN;
    data['companyCountry'] = companyCountry;
    data['companyContactNo1'] = companyContactNo1;
    data['companyContactNo2'] = companyContactNo2;
    data['companyEmail1'] = companyEmail1;
    data['companyEmail2'] = companyEmail2;
    return data;
  }
}

class Rounds {
  int? roundId;
  int? callId;
  String? addedDateTime;
  String? roundDateTime;
  String? roundTitle;
  String? roundDescription;
  String? roundVenue;
  String? isAttain;

  Rounds(
      {this.roundId,
        this.callId,
        this.addedDateTime,
        this.roundDateTime,
        this.roundTitle,
        this.roundDescription,
        this.roundVenue,
        this.isAttain});

  Rounds.fromJson(Map<String, dynamic> json) {
    roundId = json['roundId'];
    callId = json['callId'];
    addedDateTime = json['addedDateTime'];
    roundDateTime = json['roundDateTime'];
    roundTitle = json['roundTitle'];
    roundDescription = json['roundDescription'];
    roundVenue = json['roundVenue'];
    isAttain = json['isAttain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['roundId'] = roundId;
    data['callId'] = callId;
    data['addedDateTime'] = addedDateTime;
    data['roundDateTime'] = roundDateTime;
    data['roundTitle'] = roundTitle;
    data['roundDescription'] = roundDescription;
    data['roundVenue'] = roundVenue;
    data['isAttain'] = isAttain;
    return data;
  }
}
