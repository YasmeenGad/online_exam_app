import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:online_exam_app/src/features/questions/data/api/models/isar/question_model.dart';
import 'package:path_provider/path_provider.dart';

import '../di/di.dart';

@module
abstract class IsarModule {
  @preResolve
  Future<Isar> get isarProvider async {
    final directory = await getApplicationSupportDirectory();
    return Isar.open([QuestionModelSchema], directory: directory.path);
  }
}
