// Mocks generated by Mockito 5.4.4 from annotations
// in online_exam_app/test/src/features/exam/data/repositories/exam_repo_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i6;
import 'package:online_exam_app/src/core/utils/errors/result.dart' as _i4;
import 'package:online_exam_app/src/features/exam/data/data_sources/contracts/exam_offline_datasource.dart'
    as _i8;
import 'package:online_exam_app/src/features/exam/data/data_sources/contracts/exam_online_datasource.dart'
    as _i2;
import 'package:online_exam_app/src/features/exam/domain/entities/exams_entity.dart'
    as _i7;
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [ExamOnlineDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockExamOnlineDataSource extends _i1.Mock
    implements _i2.ExamOnlineDataSource {
  MockExamOnlineDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i4.Result<List<_i5.Subject>>> getSubjects(String? token) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSubjects,
          [token],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i5.Subject>>>.value(
            _i6.dummyValue<_i4.Result<List<_i5.Subject>>>(
          this,
          Invocation.method(
            #getSubjects,
            [token],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i5.Subject>>>);

  @override
  _i3.Future<_i4.Result<List<_i7.Exams>>> getExamById(
    String? subjectId,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getExamById,
          [
            subjectId,
            token,
          ],
        ),
        returnValue: _i3.Future<_i4.Result<List<_i7.Exams>>>.value(
            _i6.dummyValue<_i4.Result<List<_i7.Exams>>>(
          this,
          Invocation.method(
            #getExamById,
            [
              subjectId,
              token,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Result<List<_i7.Exams>>>);

  @override
  _i3.Future<_i4.Result<_i7.Exams>> getExamDetails(
    String? examId,
    String? token,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getExamDetails,
          [
            examId,
            token,
          ],
        ),
        returnValue: _i3.Future<_i4.Result<_i7.Exams>>.value(
            _i6.dummyValue<_i4.Result<_i7.Exams>>(
          this,
          Invocation.method(
            #getExamDetails,
            [
              examId,
              token,
            ],
          ),
        )),
      ) as _i3.Future<_i4.Result<_i7.Exams>>);
}

/// A class which mocks [ExamOfflineDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockExamOfflineDatasource extends _i1.Mock
    implements _i8.ExamOfflineDatasource {
  MockExamOfflineDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> cacheSubjects(List<_i5.Subject>? subjects) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheSubjects,
          [subjects],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<List<_i5.Subject>> getCachedSubject() => (super.noSuchMethod(
        Invocation.method(
          #getCachedSubject,
          [],
        ),
        returnValue: _i3.Future<List<_i5.Subject>>.value(<_i5.Subject>[]),
      ) as _i3.Future<List<_i5.Subject>>);

  @override
  _i3.Future<void> cacheExams(
    List<_i7.Exams>? exams,
    String? subjectId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheExams,
          [
            exams,
            subjectId,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<List<_i7.Exams>> getCachedExams(String? subjectId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCachedExams,
          [subjectId],
        ),
        returnValue: _i3.Future<List<_i7.Exams>>.value(<_i7.Exams>[]),
      ) as _i3.Future<List<_i7.Exams>>);

  @override
  _i3.Future<void> cacheExam(
    _i7.Exams? exam,
    String? examId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheExam,
          [
            exam,
            examId,
          ],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<_i7.Exams?> getCachedExam(String? examId) => (super.noSuchMethod(
        Invocation.method(
          #getCachedExam,
          [examId],
        ),
        returnValue: _i3.Future<_i7.Exams?>.value(),
      ) as _i3.Future<_i7.Exams?>);
}