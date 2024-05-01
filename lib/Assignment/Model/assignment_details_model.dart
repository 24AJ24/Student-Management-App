class GetAssignmentsDetailsModel {
  int? responseCode;
  String? message;
  List<Data>? data;

  GetAssignmentsDetailsModel({this.responseCode, this.message, this.data});

  GetAssignmentsDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int? participantId;
  int? allocationId;
  int? enrollmentId;
  String? attemptedOn;
  String? submittedOn;
  int? isEvaluated;
  String? evaluatedOn;
  int? evaluatedById;
  String? feedbackByTeacher;
  int? isSubmitted;
  int? assignmentId;
  String? allocationTitle;
  String? allocationDescription;
  String? allocationTags;
  String? assignmentAllocatedOn;
  String? allocationActiveFrom;
  String? activeTo;
  String? allocationRemark;
  String? allocationOverallRatings;
  String? allocationOverallReview;
  int? allocationAddedByRoleId;
  String? assignmentTitle;
  String? assignmentDescription;
  String? assignmentTags;

  Data(
      {this.participantId,
        this.allocationId,
        this.enrollmentId,
        this.attemptedOn,
        this.submittedOn,
        this.isEvaluated,
        this.evaluatedOn,
        this.evaluatedById,
        this.feedbackByTeacher,
        this.isSubmitted,
        this.assignmentId,
        this.allocationTitle,
        this.allocationDescription,
        this.allocationTags,
        this.assignmentAllocatedOn,
        this.allocationActiveFrom,
        this.activeTo,
        this.allocationRemark,
        this.allocationOverallRatings,
        this.allocationOverallReview,
        this.allocationAddedByRoleId,
        this.assignmentTitle,
        this.assignmentDescription,
        this.assignmentTags});

  Data.fromJson(Map<String, dynamic> json) {
    participantId = json['participant_id'];
    allocationId = json['allocation_id'];
    enrollmentId = json['enrollment_id'];
    attemptedOn = json['attempted_on'];
    submittedOn = json['submitted_on'];
    isEvaluated = json['is_evaluated'];
    evaluatedOn = json['evaluated_on'];
    evaluatedById = json['evaluated_by_id'];
    feedbackByTeacher = json['feedback_by_teacher'];
    isSubmitted = json['is_submitted'];
    assignmentId = json['assignment_id'];
    allocationTitle = json['allocation_title'];
    allocationDescription = json['allocation_description'];
    allocationTags = json['allocation_tags'];
    assignmentAllocatedOn = json['assignment_allocated_on'];
    allocationActiveFrom = json['allocation_active_from'];
    activeTo = json['active_to'];
    allocationRemark = json['allocation_remark'];
    allocationOverallRatings = json['allocation_overall_ratings'];
    allocationOverallReview = json['allocation_overall_review'];
    allocationAddedByRoleId = json['allocation_added_by_role_id'];
    assignmentTitle = json['assignment_title'];
    assignmentDescription = json['assignment_description'];
    assignmentTags = json['assignment_tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['participant_id'] = participantId;
    data['allocation_id'] = allocationId;
    data['enrollment_id'] = enrollmentId;
    data['attempted_on'] = attemptedOn;
    data['submitted_on'] = submittedOn;
    data['is_evaluated'] = isEvaluated;
    data['evaluated_on'] = evaluatedOn;
    data['evaluated_by_id'] = evaluatedById;
    data['feedback_by_teacher'] = feedbackByTeacher;
    data['is_submitted'] = isSubmitted;
    data['assignment_id'] = assignmentId;
    data['allocation_title'] = allocationTitle;
    data['allocation_description'] = allocationDescription;
    data['allocation_tags'] = allocationTags;
    data['assignment_allocated_on'] = assignmentAllocatedOn;
    data['allocation_active_from'] = allocationActiveFrom;
    data['active_to'] = activeTo;
    data['allocation_remark'] = allocationRemark;
    data['allocation_overall_ratings'] = allocationOverallRatings;
    data['allocation_overall_review'] = allocationOverallReview;
    data['allocation_added_by_role_id'] = allocationAddedByRoleId;
    data['assignment_title'] = assignmentTitle;
    data['assignment_description'] = assignmentDescription;
    data['assignment_tags'] = assignmentTags;
    return data;
  }
}
