class Exams {
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final String? createdAt;

  Exams({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'duration': duration,
      'subject': subject,
      'numberOfQuestions': numberOfQuestions,
      'active': active,
      'createdAt': createdAt,
    };
  }

  factory Exams.fromJson(Map<String, dynamic> json) {
    return Exams(
      id: json['_id'],
      title: json['title'],
      duration: json['duration'],
      subject: json['subject'],
      numberOfQuestions: json['numberOfQuestions'],
      active: json['active'],
      createdAt: json['createdAt'],
    );
  }

}

