import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam_app/src/features/questions/domain/entities/response/question_response_entity.dart';

part 'question_response_dto.g.dart';

@JsonSerializable()
class QuestionResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "questions")
  final List<Questions>? questions;

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
  final List<Answers>? answers;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "question")
  final String? question;
  @JsonKey(name: "correct")
  final String? correct;
  @JsonKey(name: "subject")
  final Subject? subject;
  @JsonKey(name: "exam")
  final Exam? exam;
  @JsonKey(name: "createdAt")
  final String? createdAt;

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
  final String? answer;
  @JsonKey(name: "key")
  final String? key;

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

  AnswersEntity toEntity() => AnswersEntity(
        answer: answer,
        key: key,
      );
}

@JsonSerializable()
class Subject {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Subject({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return _$SubjectFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectToJson(this);
  }

  SubjectEntity toEntity() => SubjectEntity(
        Id: Id,
        name: name,
        icon: icon,
        createdAt: createdAt,
      );
}

@JsonSerializable()
class Exam {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Exam({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return _$ExamFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamToJson(this);
  }

  ExamEntity toEntity() => ExamEntity(
        Id: Id,
        title: title,
        duration: duration,
        subject: subject,
        numberOfQuestions: numberOfQuestions,
        active: active,
        createdAt: createdAt,
      );
}
