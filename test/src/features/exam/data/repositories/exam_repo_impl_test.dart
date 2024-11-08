import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:online_exam_app/src/core/utils/errors/result.dart';
import 'package:online_exam_app/src/features/exam/data/data_sources/contracts/exam_offline_datasource.dart';
import 'package:online_exam_app/src/features/exam/data/data_sources/contracts/exam_online_datasource.dart';
import 'package:online_exam_app/src/features/exam/data/repositories/exam_repo_impl.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/exams_entity.dart';
import 'package:online_exam_app/src/features/exam/domain/entities/subject_entity.dart';

import 'exam_repo_impl_test.mocks.dart';

@GenerateMocks([ExamOnlineDataSource, ExamOfflineDatasource])


void main() {
  group('ExamRepoImpl Tests', () {

      late MockExamOnlineDataSource examOnlineDataSource;
  late MockExamOfflineDatasource examOfflineDataSource;
  late ExamRepoImpl examRepo;

  setUp(() {
    provideDummy<Result<List<Subject>>>(Success(data: <Subject>[]));
    provideDummy<Result<List<Exams>>>(Success(data: <Exams>[]));
    provideDummy<Result<Exams>>(Success(
        data: Exams(
            id: '2',
            title: 'Math',
            duration: 30,
            subject: '1',
            numberOfQuestions: 25,
            active: true,
            createdAt: '12/7/2022')));
    examOnlineDataSource = MockExamOnlineDataSource();
    examOfflineDataSource = MockExamOfflineDatasource();
    examRepo = ExamRepoImpl(examOnlineDataSource, examOfflineDataSource);
  });
      test('getExamsById should return cached exams if available', () async {
        var cachedExams = [
          Exams(
            id: '1',
            title: 'Math',
            duration: 30,
            subject: '1',
            numberOfQuestions: 25,
            active: true,
            createdAt: '12/7/2022',
          ),
        ];
        when(examOfflineDataSource.getCachedExams('1')).thenAnswer((_) async => cachedExams);

        var result = await examRepo.getExamsById('1', 'token');

        verify(examOfflineDataSource.getCachedExams('1')).called(1);
        verifyNever(examOnlineDataSource.getExamById(any, any));

        expect((result as Success<List<Exams>>).data, equals(cachedExams));
      });

    test('getExamsById should fetch from online if no cached exams', () async {
      when(examOfflineDataSource.getCachedExams('1')).thenAnswer((_) async => []);
      var onlineResult = Success(data: [Exams(id: '2', title: 'Physics', duration: 40, subject: '2', numberOfQuestions: 20, active: true, createdAt: '12/8/2022')]);
      when(examOnlineDataSource.getExamById('1', 'token')).thenAnswer((_) async => onlineResult);

      var result = await examRepo.getExamsById('1', 'token');

      verify(examOfflineDataSource.getCachedExams('1')).called(1);
      verify(examOnlineDataSource.getExamById('1', 'token')).called(1);
      expect(result, onlineResult);
    });

    test('getExamDetails should return cached exam if available', () async {
      var cachedExam = Exams(id: '1', title: 'Math', duration: 30, subject: '1', numberOfQuestions: 25, active: true, createdAt: '12/7/2022');
      when(examOfflineDataSource.getCachedExam('1')).thenAnswer((_) async => cachedExam);

      var result = await examRepo.getExamDetails('1', 'token');

      verify(examOfflineDataSource.getCachedExam('1')).called(1);
      verifyNever(examOnlineDataSource.getExamDetails(any, any));
     // expect(result, Success(data: cachedExam));
      expect((result as Success<Exams>).data, cachedExam);
    });

    test('getExamDetails should fetch from online if no cached exam', () async {
      when(examOfflineDataSource.getCachedExam('1')).thenAnswer((_) async => null);
      var onlineResult = Success(data: Exams(id: '2', title: 'Physics', duration: 40, subject: '2', numberOfQuestions: 20, active: true, createdAt: '12/8/2022'));
      when(examOnlineDataSource.getExamDetails('1', 'token')).thenAnswer((_) async => onlineResult);

      var result = await examRepo.getExamDetails('1', 'token');

      verify(examOfflineDataSource.getCachedExam('1')).called(1);
      verify(examOnlineDataSource.getExamDetails('1', 'token')).called(1);
     // expect(result, onlineResult);
      expect((result as Success<Exams>).data, onlineResult.data);
    });

    test('getSubjects should return cached subjects if available', () async {
      var cachedSubjects = [Subject(id: '1', name: 'Math', icon: 'math.png', createdAt: '12/7/2022')];
      when(examOfflineDataSource.getCachedSubject()).thenAnswer((_) async => cachedSubjects);

      var result = await examRepo.getSubjects('token');

      verify(examOfflineDataSource.getCachedSubject()).called(1);
      verifyNever(examOnlineDataSource.getSubjects(any));
     // expect(result, Success(data: cachedSubjects));
      expect((result as Success<List<Subject>>).data, cachedSubjects);

    });

    test('getSubjects should fetch from online if no cached subjects', () async {
      when(examOfflineDataSource.getCachedSubject()).thenAnswer((_) async => []);
      var onlineResult = Success(data: [Subject(id: '2', name: 'Physics', icon: 'physics.png', createdAt: '12/8/2022')]);
      when(examOnlineDataSource.getSubjects('token')).thenAnswer((_) async => onlineResult);

      var result = await examRepo.getSubjects('token');

      verify(examOfflineDataSource.getCachedSubject()).called(1);
      verify(examOnlineDataSource.getSubjects('token')).called(1);
      expect(result, onlineResult);
    });
  });
}
