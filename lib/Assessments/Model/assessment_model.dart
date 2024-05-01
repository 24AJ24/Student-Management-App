class AssessmentModel {
  int? responseCode;
  String? message;
  Data? data;

  AssessmentModel({this.responseCode, this.message, this.data});

  AssessmentModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
class Data {
  int? participantId;
  int? allocationId;
  int? enrollmentId;
  int? isAppeared;
  int? isSubmitted;
  int? isPublish;
  String? attemptedOn;
  String? submittedOn;
  String? evaluatedOn;
  String? feedbackByTeacher;
  int? assessmentId;
  String? allocationTitle;
  String? allocationDescription;
  String? assessmentAllocatedOn;
  String? allocationActiveFrom;
  String? allocationActiveTo;
  int? isApproved;
  String? assessmentTitle;
  String? assessmentDescription;
  int? assessmentDuration;
  int? assessmentTotalMarks;
  int? assessmentPassingMarks;
  String? assessmentTags;
  String? batchTitle;
  String? courseTitle;
  List<AllocatedSubjectChapters>? allocatedSubjectChapters;

  Data({
    this.participantId,
    this.allocationId,
    this.enrollmentId,
    this.isAppeared,
    this.isSubmitted,
    this.isPublish,
    this.attemptedOn,
    this.submittedOn,
    this.evaluatedOn,
    this.feedbackByTeacher,
    this.assessmentId,
    this.allocationTitle,
    this.allocationDescription,
    this.assessmentAllocatedOn,
    this.allocationActiveFrom,
    this.allocationActiveTo,
    this.isApproved,
    this.assessmentTitle,
    this.assessmentDescription,
    this.assessmentDuration,
    this.assessmentTotalMarks,
    this.assessmentPassingMarks,
    this.assessmentTags,
    this.batchTitle,
    this.courseTitle,
    this.allocatedSubjectChapters,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      participantId: json['participant_id'],
      allocationId: json['allocation_id'],
      enrollmentId: json['enrollment_id'],
      isAppeared: json['is_appeared'],
      isSubmitted: json['is_submitted'],
      isPublish: json['is_publish'],
      attemptedOn: json['attempted_on'],
      submittedOn: json['submitted_on'],
      evaluatedOn: json['evaluated_on'],
      feedbackByTeacher: json['feedback_by_teacher'],
      assessmentId: json['assessment_id'],
      allocationTitle: json['allocation_title'],
      allocationDescription: json['allocation_description'],
      assessmentAllocatedOn: json['assessment_allocated_on'],
      allocationActiveFrom: json['allocation_active_from'],
      allocationActiveTo: json['allocation_active_to'],
      isApproved: json['is_approved'],
      assessmentTitle: json['assessment_title'],
      assessmentDescription: json['assessment_description'],
      assessmentDuration: json['assessment_duration'],
      assessmentTotalMarks: json['assessment_total_marks'],
      assessmentPassingMarks: json['assessment_passing_marks'],
      assessmentTags: json['assessment_tags'],
      batchTitle: json['batch_title'],
      courseTitle: json['course_title'],
      allocatedSubjectChapters: json['allocated_subject_chapters'] != null
          ? List<AllocatedSubjectChapters>.from(
          json['allocated_subject_chapters']
              .map((v) => AllocatedSubjectChapters.fromJson(v)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['participant_id'] = participantId;
    data['allocation_id'] = allocationId;
    data['enrollment_id'] = enrollmentId;
    data['is_appeared'] = isAppeared;
    data['is_submitted'] = isSubmitted;
    data['is_publish'] = isPublish;
    data['attempted_on'] = attemptedOn;
    data['submitted_on'] = submittedOn;
    data['evaluated_on'] = evaluatedOn;
    data['feedback_by_teacher'] = feedbackByTeacher;
    data['assessment_id'] = assessmentId;
    data['allocation_title'] = allocationTitle;
    data['allocation_description'] = allocationDescription;
    data['assessment_allocated_on'] = assessmentAllocatedOn;
    data['allocation_active_from'] = allocationActiveFrom;
    data['allocation_active_to'] = allocationActiveTo;
    data['is_approved'] = isApproved;
    data['assessment_title'] = assessmentTitle;
    data['assessment_description'] = assessmentDescription;
    data['assessment_duration'] = assessmentDuration;
    data['assessment_total_marks'] = assessmentTotalMarks;
    data['assessment_passing_marks'] = assessmentPassingMarks;
    data['assessment_tags'] = assessmentTags;
    data['batch_title'] = batchTitle;
    data['course_title'] = courseTitle;
    data['allocated_subject_chapters'] = allocatedSubjectChapters != null
        ? allocatedSubjectChapters!
        .map((v) => v.toJson())
        .toList()
        : null; // Explicitly cast the list to dynamic or null
    return data;
  }
}



class AllocatedSubjectChapters {
  int? assessmentSubjectId;
  int? assessmentId;
  int? subjectId;
  int? assessmentSubjectTotalQuestions;
  String? subjectTitle;
  String? subjectDescription;
  List<AssessmentAllocatedChapters>? assessmentAllocatedChapters;

  AllocatedSubjectChapters(
      {this.assessmentSubjectId,
        this.assessmentId,
        this.subjectId,
        this.assessmentSubjectTotalQuestions,
        this.subjectTitle,
        this.subjectDescription,
        this.assessmentAllocatedChapters});

  AllocatedSubjectChapters.fromJson(Map<String, dynamic> json) {
    assessmentSubjectId = json['assessment_subject_id'];
    assessmentId = json['assessment_id'];
    subjectId = json['subject_id'];
    assessmentSubjectTotalQuestions =
    json['assessment_subject_total_questions'];
    subjectTitle = json['subject_title'];
    subjectDescription = json['subject_description'];
    if (json['assessment_allocated_chapters'] != null) {
      assessmentAllocatedChapters = <AssessmentAllocatedChapters>[];
      json['assessment_allocated_chapters'].forEach((v) {
        assessmentAllocatedChapters!
            .add(AssessmentAllocatedChapters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assessment_subject_id'] = assessmentSubjectId;
    data['assessment_id'] = assessmentId;
    data['subject_id'] = subjectId;
    data['assessment_subject_total_questions'] =
        assessmentSubjectTotalQuestions;
    data['subject_title'] = subjectTitle;
    data['subject_description'] = subjectDescription;
    if (assessmentAllocatedChapters != null) {
      data['assessment_allocated_chapters'] =
          assessmentAllocatedChapters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AssessmentAllocatedChapters {
  int? assessmentChapterId;
  int? assessmentSubjectId;
  int? totalQuestions;
  String? chapterTitle;
  String? chapterDescription;
  int? lowComplexity;
  String? normalComplexity;
  String? highComplexity;

  AssessmentAllocatedChapters(
      {this.assessmentChapterId,
        this.assessmentSubjectId,
        this.totalQuestions,
        this.chapterTitle,
        this.chapterDescription,
        this.lowComplexity,
        this.normalComplexity,
        this.highComplexity});

  AssessmentAllocatedChapters.fromJson(Map<String, dynamic> json) {
    assessmentChapterId = json['assessment_chapter_id'];
    assessmentSubjectId = json['assessment_subject_id'];
    totalQuestions = json['total_questions'];
    chapterTitle = json['chapter_title'];
    chapterDescription = json['chapter_description'];
    lowComplexity = json['low_complexity'];
    normalComplexity = json['normal_complexity'];
    highComplexity = json['high_complexity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['assessment_chapter_id'] = assessmentChapterId;
    data['assessment_subject_id'] = assessmentSubjectId;
    data['total_questions'] = totalQuestions;
    data['chapter_title'] = chapterTitle;
    data['chapter_description'] = chapterDescription;
    data['low_complexity'] = lowComplexity;
    data['normal_complexity'] = normalComplexity;
    data['high_complexity'] = highComplexity;
    return data;
  }
}
