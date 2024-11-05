
class SubjectEntity {
  SubjectEntity({
      this.message, 
      this.metadata, 
      this.subjects,});

  SubjectEntity.fromJson(dynamic json) {
    message = json['message'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['subjects'] != null) {
      subjects = [];
      json['subjects'].forEach((v) {
        subjects?.add(Subject.fromJson(v));
      });
    }
  }
  String? message;
  Metadata? metadata;
  List<Subject>? subjects;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (subjects != null) {
      map['subjects'] = subjects?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class Subject {
  Subject({
      this.id, 
      this.name, 
      this.icon, 
      this.createdAt,});

  Subject.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    icon = json['icon'];
    createdAt = json['createdAt'];
  }
  String? id;
  String? name;
  String? icon;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['icon'] = icon;
    map['createdAt'] = createdAt;
    return map;
  }

}


class Metadata {
  Metadata({
      this.currentPage, 
      this.numberOfPages, 
      this.limit,});

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }

}