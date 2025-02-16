import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';

part 'question_response_dto.g.dart';

@JsonSerializable()
class QuestionResponseDto {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "questions")
  List<Questions>? questions;

  QuestionResponseDto({
    this.message,
    this.questions,
  });

  factory QuestionResponseDto.fromJson(Map<String, dynamic> json) {
    return _$QuestionResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionResponseDtoToJson(this);
  }

  QuestionResponseEntity toEntity() => QuestionResponseEntity(
        message: message,
        questions: questions?.map((e) => e.toEntity()).toList(),
      );
}

@JsonSerializable()
class Questions {
  @JsonKey(name: "answers")
  List<Answers>? answers;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "_id")
  String? Id;
  @JsonKey(name: "question")
  String? question;
  @JsonKey(name: "correct")
  String? correct;
  @JsonKey(name: "subject")
  QuestionsSubject? subject;
  @JsonKey(name: "exam")
  QuestionsExam? exam;
  @JsonKey(name: "createdAt")
  String? createdAt;

  Questions({
    this.answers,
    this.type,
    this.Id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory Questions.fromJson(Map<String, dynamic> json) {
    return _$QuestionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsToJson(this);
  }

  QuestionsEntity toEntity() => QuestionsEntity(
        answers: answers?.map((e) => e.toEntity()).toList(),
        type: type,
        Id: Id,
        question: question,
        correct: correct,
        subject: subject?.toEntity(),
        exam: exam?.toEntity(),
        createdAt: createdAt,
      );
}

@JsonSerializable()
class Answers {
  @JsonKey(name: "answer")
  String? answer;
  @JsonKey(name: "key")
  String? key;

  Answers({
    this.answer,
    this.key,
  });

  factory Answers.fromJson(Map<String, dynamic> json) {
    return _$AnswersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersToJson(this);
  }

  QuestionsAnswersEntity toEntity() => QuestionsAnswersEntity(
        answer: answer,
        key: key,
      );
}

@JsonSerializable()
class QuestionsSubject {
  @JsonKey(name: "_id")
  String? Id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "icon")
  String? icon;
  @JsonKey(name: "createdAt")
  String? createdAt;

  QuestionsSubject({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory QuestionsSubject.fromJson(Map<String, dynamic> json) {
    return _$QuestionsSubjectFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsSubjectToJson(this);
  }

  QuestionsSubjectEntity toEntity() => QuestionsSubjectEntity(
        Id: Id,
        name: name,
        icon: icon,
        createdAt: createdAt,
      );
}

@JsonSerializable()
class QuestionsExam {
  @JsonKey(name: "_id")
  String? Id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "duration")
  int? duration;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "numberOfQuestions")
  int? numberOfQuestions;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "createdAt")
  String? createdAt;

  QuestionsExam({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory QuestionsExam.fromJson(Map<String, dynamic> json) {
    return _$QuestionsExamFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$QuestionsExamToJson(this);
  }

  QuestionsExamEntity toEntity() => QuestionsExamEntity(
        Id: Id,
        title: title,
        duration: duration,
        subject: subject,
        numberOfQuestions: numberOfQuestions,
        active: active,
        createdAt: createdAt,
      );
}
