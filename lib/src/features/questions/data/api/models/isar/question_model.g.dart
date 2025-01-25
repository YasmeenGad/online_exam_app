// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuestionModelCollection on Isar {
  IsarCollection<QuestionModel> get questionModels => this.collection();
}

const QuestionModelSchema = CollectionSchema(
  name: r'QuestionModel',
  id: -2676110388347547262,
  properties: {
    r'attemptId': PropertySchema(
      id: 0,
      name: r'attemptId',
      type: IsarType.string,
    ),
    r'correctAnswer': PropertySchema(
      id: 1,
      name: r'correctAnswer',
      type: IsarType.string,
    ),
    r'examId': PropertySchema(
      id: 2,
      name: r'examId',
      type: IsarType.string,
    ),
    r'isCorrect': PropertySchema(
      id: 3,
      name: r'isCorrect',
      type: IsarType.bool,
    ),
    r'questionId': PropertySchema(
      id: 4,
      name: r'questionId',
      type: IsarType.string,
    ),
    r'questionText': PropertySchema(
      id: 5,
      name: r'questionText',
      type: IsarType.string,
    ),
    r'questionType': PropertySchema(
      id: 6,
      name: r'questionType',
      type: IsarType.string,
    ),
    r'suggestedAnswers': PropertySchema(
      id: 7,
      name: r'suggestedAnswers',
      type: IsarType.objectList,
      target: r'AnswerModel',
    ),
    r'userAnswer': PropertySchema(
      id: 8,
      name: r'userAnswer',
      type: IsarType.string,
    )
  },
  estimateSize: _questionModelEstimateSize,
  serialize: _questionModelSerialize,
  deserialize: _questionModelDeserialize,
  deserializeProp: _questionModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'questionId': IndexSchema(
      id: 5032123391997384121,
      name: r'questionId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'questionId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'examId': IndexSchema(
      id: 8639766665118373825,
      name: r'examId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'examId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'AnswerModel': AnswerModelSchema},
  getId: _questionModelGetId,
  getLinks: _questionModelGetLinks,
  attach: _questionModelAttach,
  version: '3.1.0+1',
);

int _questionModelEstimateSize(
  QuestionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.attemptId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.correctAnswer.length * 3;
  bytesCount += 3 + object.examId.length * 3;
  bytesCount += 3 + object.questionId.length * 3;
  bytesCount += 3 + object.questionText.length * 3;
  bytesCount += 3 + object.questionType.length * 3;
  bytesCount += 3 + object.suggestedAnswers.length * 3;
  {
    final offsets = allOffsets[AnswerModel]!;
    for (var i = 0; i < object.suggestedAnswers.length; i++) {
      final value = object.suggestedAnswers[i];
      bytesCount += AnswerModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.userAnswer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _questionModelSerialize(
  QuestionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.attemptId);
  writer.writeString(offsets[1], object.correctAnswer);
  writer.writeString(offsets[2], object.examId);
  writer.writeBool(offsets[3], object.isCorrect);
  writer.writeString(offsets[4], object.questionId);
  writer.writeString(offsets[5], object.questionText);
  writer.writeString(offsets[6], object.questionType);
  writer.writeObjectList<AnswerModel>(
    offsets[7],
    allOffsets,
    AnswerModelSchema.serialize,
    object.suggestedAnswers,
  );
  writer.writeString(offsets[8], object.userAnswer);
}

QuestionModel _questionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuestionModel(
    attemptId: reader.readStringOrNull(offsets[0]),
    correctAnswer: reader.readString(offsets[1]),
    examId: reader.readString(offsets[2]),
    questionId: reader.readString(offsets[4]),
    questionText: reader.readString(offsets[5]),
    questionType: reader.readString(offsets[6]),
    suggestedAnswers: reader.readObjectList<AnswerModel>(
          offsets[7],
          AnswerModelSchema.deserialize,
          allOffsets,
          AnswerModel(),
        ) ??
        [],
    userAnswer: reader.readStringOrNull(offsets[8]),
  );
  object.id = id;
  return object;
}

P _questionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readObjectList<AnswerModel>(
            offset,
            AnswerModelSchema.deserialize,
            allOffsets,
            AnswerModel(),
          ) ??
          []) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _questionModelGetId(QuestionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _questionModelGetLinks(QuestionModel object) {
  return [];
}

void _questionModelAttach(
    IsarCollection<dynamic> col, Id id, QuestionModel object) {
  object.id = id;
}

extension QuestionModelQueryWhereSort
    on QueryBuilder<QuestionModel, QuestionModel, QWhere> {
  QueryBuilder<QuestionModel, QuestionModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuestionModelQueryWhere
    on QueryBuilder<QuestionModel, QuestionModel, QWhereClause> {
  QueryBuilder<QuestionModel, QuestionModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterWhereClause>
      questionIdEqualTo(String questionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'questionId',
        value: [questionId],
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterWhereClause>
      questionIdNotEqualTo(String questionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [],
              upper: [questionId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [questionId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [questionId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'questionId',
              lower: [],
              upper: [questionId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterWhereClause> examIdEqualTo(
      String examId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'examId',
        value: [examId],
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterWhereClause>
      examIdNotEqualTo(String examId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examId',
              lower: [],
              upper: [examId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examId',
              lower: [examId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examId',
              lower: [examId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'examId',
              lower: [],
              upper: [examId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension QuestionModelQueryFilter
    on QueryBuilder<QuestionModel, QuestionModel, QFilterCondition> {
  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'attemptId',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'attemptId',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attemptId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'attemptId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'attemptId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attemptId',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      attemptIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'attemptId',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      correctAnswerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      correctAnswerGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      correctAnswerLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      correctAnswerBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      correctAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      correctAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      correctAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      correctAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      correctAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      correctAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      examIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      examIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      examIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      examIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'examId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      examIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      examIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      examIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'examId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      examIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'examId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      examIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'examId',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      examIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'examId',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      isCorrectEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCorrect',
        value: value,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionId',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTextGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTextLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTextBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionText',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionType',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      questionTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionType',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      suggestedAnswersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedAnswers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      suggestedAnswersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedAnswers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      suggestedAnswersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedAnswers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      suggestedAnswersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedAnswers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      suggestedAnswersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedAnswers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      suggestedAnswersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'suggestedAnswers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userAnswer',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userAnswer',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      userAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userAnswer',
        value: '',
      ));
    });
  }
}

extension QuestionModelQueryObject
    on QueryBuilder<QuestionModel, QuestionModel, QFilterCondition> {
  QueryBuilder<QuestionModel, QuestionModel, QAfterFilterCondition>
      suggestedAnswersElement(FilterQuery<AnswerModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'suggestedAnswers');
    });
  }
}

extension QuestionModelQueryLinks
    on QueryBuilder<QuestionModel, QuestionModel, QFilterCondition> {}

extension QuestionModelQuerySortBy
    on QueryBuilder<QuestionModel, QuestionModel, QSortBy> {
  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> sortByAttemptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      sortByAttemptIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      sortByCorrectAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      sortByCorrectAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> sortByExamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> sortByExamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> sortByIsCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      sortByIsCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> sortByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      sortByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      sortByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      sortByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      sortByQuestionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionType', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      sortByQuestionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionType', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> sortByUserAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAnswer', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      sortByUserAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAnswer', Sort.desc);
    });
  }
}

extension QuestionModelQuerySortThenBy
    on QueryBuilder<QuestionModel, QuestionModel, QSortThenBy> {
  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> thenByAttemptId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      thenByAttemptIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'attemptId', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      thenByCorrectAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      thenByCorrectAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'correctAnswer', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> thenByExamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> thenByExamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'examId', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> thenByIsCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      thenByIsCorrectDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCorrect', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> thenByQuestionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      thenByQuestionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionId', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      thenByQuestionText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      thenByQuestionTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionText', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      thenByQuestionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionType', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      thenByQuestionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questionType', Sort.desc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy> thenByUserAnswer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAnswer', Sort.asc);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QAfterSortBy>
      thenByUserAnswerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userAnswer', Sort.desc);
    });
  }
}

extension QuestionModelQueryWhereDistinct
    on QueryBuilder<QuestionModel, QuestionModel, QDistinct> {
  QueryBuilder<QuestionModel, QuestionModel, QDistinct> distinctByAttemptId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attemptId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QDistinct> distinctByCorrectAnswer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'correctAnswer',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QDistinct> distinctByExamId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'examId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QDistinct> distinctByIsCorrect() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCorrect');
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QDistinct> distinctByQuestionId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QDistinct> distinctByQuestionText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionText', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QDistinct> distinctByQuestionType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questionType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuestionModel, QuestionModel, QDistinct> distinctByUserAnswer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userAnswer', caseSensitive: caseSensitive);
    });
  }
}

extension QuestionModelQueryProperty
    on QueryBuilder<QuestionModel, QuestionModel, QQueryProperty> {
  QueryBuilder<QuestionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuestionModel, String?, QQueryOperations> attemptIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attemptId');
    });
  }

  QueryBuilder<QuestionModel, String, QQueryOperations>
      correctAnswerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'correctAnswer');
    });
  }

  QueryBuilder<QuestionModel, String, QQueryOperations> examIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'examId');
    });
  }

  QueryBuilder<QuestionModel, bool, QQueryOperations> isCorrectProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCorrect');
    });
  }

  QueryBuilder<QuestionModel, String, QQueryOperations> questionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionId');
    });
  }

  QueryBuilder<QuestionModel, String, QQueryOperations> questionTextProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionText');
    });
  }

  QueryBuilder<QuestionModel, String, QQueryOperations> questionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questionType');
    });
  }

  QueryBuilder<QuestionModel, List<AnswerModel>, QQueryOperations>
      suggestedAnswersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suggestedAnswers');
    });
  }

  QueryBuilder<QuestionModel, String?, QQueryOperations> userAnswerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userAnswer');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const AnswerModelSchema = Schema(
  name: r'AnswerModel',
  id: -3220956187614606550,
  properties: {
    r'answerText': PropertySchema(
      id: 0,
      name: r'answerText',
      type: IsarType.string,
    )
  },
  estimateSize: _answerModelEstimateSize,
  serialize: _answerModelSerialize,
  deserialize: _answerModelDeserialize,
  deserializeProp: _answerModelDeserializeProp,
);

int _answerModelEstimateSize(
  AnswerModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.answerText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _answerModelSerialize(
  AnswerModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.answerText);
}

AnswerModel _answerModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AnswerModel(
    answerText: reader.readStringOrNull(offsets[0]),
  );
  return object;
}

P _answerModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension AnswerModelQueryFilter
    on QueryBuilder<AnswerModel, AnswerModel, QFilterCondition> {
  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'answerText',
      ));
    });
  }

  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'answerText',
      ));
    });
  }

  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'answerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'answerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'answerText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'answerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'answerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'answerText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'answerText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'answerText',
        value: '',
      ));
    });
  }

  QueryBuilder<AnswerModel, AnswerModel, QAfterFilterCondition>
      answerTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'answerText',
        value: '',
      ));
    });
  }
}

extension AnswerModelQueryObject
    on QueryBuilder<AnswerModel, AnswerModel, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CheckResultModelSchema = Schema(
  name: r'CheckResultModel',
  id: -6629023318581799070,
  properties: {
    r'correct': PropertySchema(
      id: 0,
      name: r'correct',
      type: IsarType.long,
    ),
    r'correctQuestions': PropertySchema(
      id: 1,
      name: r'correctQuestions',
      type: IsarType.objectList,
      target: r'CorrectQuestionModel',
    ),
    r'message': PropertySchema(
      id: 2,
      name: r'message',
      type: IsarType.string,
    ),
    r'total': PropertySchema(
      id: 3,
      name: r'total',
      type: IsarType.string,
    ),
    r'wrong': PropertySchema(
      id: 4,
      name: r'wrong',
      type: IsarType.long,
    ),
    r'wrongQuestions': PropertySchema(
      id: 5,
      name: r'wrongQuestions',
      type: IsarType.objectList,
      target: r'WrongQuestionModel',
    )
  },
  estimateSize: _checkResultModelEstimateSize,
  serialize: _checkResultModelSerialize,
  deserialize: _checkResultModelDeserialize,
  deserializeProp: _checkResultModelDeserializeProp,
);

int _checkResultModelEstimateSize(
  CheckResultModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.correctQuestions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[CorrectQuestionModel]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += CorrectQuestionModelSchema.estimateSize(
              value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.message;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.total;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.wrongQuestions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[WrongQuestionModel]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              WrongQuestionModelSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _checkResultModelSerialize(
  CheckResultModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.correct);
  writer.writeObjectList<CorrectQuestionModel>(
    offsets[1],
    allOffsets,
    CorrectQuestionModelSchema.serialize,
    object.correctQuestions,
  );
  writer.writeString(offsets[2], object.message);
  writer.writeString(offsets[3], object.total);
  writer.writeLong(offsets[4], object.wrong);
  writer.writeObjectList<WrongQuestionModel>(
    offsets[5],
    allOffsets,
    WrongQuestionModelSchema.serialize,
    object.wrongQuestions,
  );
}

CheckResultModel _checkResultModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CheckResultModel(
    correct: reader.readLongOrNull(offsets[0]),
    correctQuestions: reader.readObjectList<CorrectQuestionModel>(
      offsets[1],
      CorrectQuestionModelSchema.deserialize,
      allOffsets,
      CorrectQuestionModel(),
    ),
    message: reader.readStringOrNull(offsets[2]),
    total: reader.readStringOrNull(offsets[3]),
    wrong: reader.readLongOrNull(offsets[4]),
    wrongQuestions: reader.readObjectList<WrongQuestionModel>(
      offsets[5],
      WrongQuestionModelSchema.deserialize,
      allOffsets,
      WrongQuestionModel(),
    ),
  );
  return object;
}

P _checkResultModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<CorrectQuestionModel>(
        offset,
        CorrectQuestionModelSchema.deserialize,
        allOffsets,
        CorrectQuestionModel(),
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<WrongQuestionModel>(
        offset,
        WrongQuestionModelSchema.deserialize,
        allOffsets,
        WrongQuestionModel(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CheckResultModelQueryFilter
    on QueryBuilder<CheckResultModel, CheckResultModel, QFilterCondition> {
  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correct',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correct',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correct',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correct',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correct',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correct',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctQuestionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correctQuestions',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctQuestionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correctQuestions',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctQuestionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctQuestionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctQuestionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctQuestionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctQuestionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctQuestionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'correctQuestions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'message',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'message',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'message',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'message',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'message',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'message',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'total',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'total',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'total',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'total',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'total',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      totalIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'total',
        value: '',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wrong',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wrong',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrong',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wrong',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wrong',
        value: value,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wrong',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongQuestionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wrongQuestions',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongQuestionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wrongQuestions',
      ));
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongQuestionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongQuestionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongQuestionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongQuestionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongQuestionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongQuestionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wrongQuestions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CheckResultModelQueryObject
    on QueryBuilder<CheckResultModel, CheckResultModel, QFilterCondition> {
  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      correctQuestionsElement(FilterQuery<CorrectQuestionModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'correctQuestions');
    });
  }

  QueryBuilder<CheckResultModel, CheckResultModel, QAfterFilterCondition>
      wrongQuestionsElement(FilterQuery<WrongQuestionModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'wrongQuestions');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WrongQuestionModelSchema = Schema(
  name: r'WrongQuestionModel',
  id: 3817000333970432085,
  properties: {
    r'correctAnswer': PropertySchema(
      id: 0,
      name: r'correctAnswer',
      type: IsarType.string,
    ),
    r'incorrectAnswer': PropertySchema(
      id: 1,
      name: r'incorrectAnswer',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 2,
      name: r'questionId',
      type: IsarType.string,
    ),
    r'questionText': PropertySchema(
      id: 3,
      name: r'questionText',
      type: IsarType.string,
    )
  },
  estimateSize: _wrongQuestionModelEstimateSize,
  serialize: _wrongQuestionModelSerialize,
  deserialize: _wrongQuestionModelDeserialize,
  deserializeProp: _wrongQuestionModelDeserializeProp,
);

int _wrongQuestionModelEstimateSize(
  WrongQuestionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.correctAnswer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.incorrectAnswer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.questionId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.questionText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _wrongQuestionModelSerialize(
  WrongQuestionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.correctAnswer);
  writer.writeString(offsets[1], object.incorrectAnswer);
  writer.writeString(offsets[2], object.questionId);
  writer.writeString(offsets[3], object.questionText);
}

WrongQuestionModel _wrongQuestionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WrongQuestionModel(
    correctAnswer: reader.readStringOrNull(offsets[0]),
    incorrectAnswer: reader.readStringOrNull(offsets[1]),
    questionId: reader.readStringOrNull(offsets[2]),
    questionText: reader.readStringOrNull(offsets[3]),
  );
  return object;
}

P _wrongQuestionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension WrongQuestionModelQueryFilter
    on QueryBuilder<WrongQuestionModel, WrongQuestionModel, QFilterCondition> {
  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correctAnswer',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correctAnswer',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      correctAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'incorrectAnswer',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'incorrectAnswer',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'incorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'incorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'incorrectAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'incorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'incorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'incorrectAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'incorrectAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'incorrectAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      incorrectAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'incorrectAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: '',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionId',
        value: '',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionText',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionText',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: '',
      ));
    });
  }

  QueryBuilder<WrongQuestionModel, WrongQuestionModel, QAfterFilterCondition>
      questionTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionText',
        value: '',
      ));
    });
  }
}

extension WrongQuestionModelQueryObject
    on QueryBuilder<WrongQuestionModel, WrongQuestionModel, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CorrectQuestionModelSchema = Schema(
  name: r'CorrectQuestionModel',
  id: 1487140663080820911,
  properties: {
    r'correctAnswer': PropertySchema(
      id: 0,
      name: r'correctAnswer',
      type: IsarType.string,
    ),
    r'questionId': PropertySchema(
      id: 1,
      name: r'questionId',
      type: IsarType.string,
    ),
    r'questionText': PropertySchema(
      id: 2,
      name: r'questionText',
      type: IsarType.string,
    )
  },
  estimateSize: _correctQuestionModelEstimateSize,
  serialize: _correctQuestionModelSerialize,
  deserialize: _correctQuestionModelDeserialize,
  deserializeProp: _correctQuestionModelDeserializeProp,
);

int _correctQuestionModelEstimateSize(
  CorrectQuestionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.correctAnswer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.questionId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.questionText;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _correctQuestionModelSerialize(
  CorrectQuestionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.correctAnswer);
  writer.writeString(offsets[1], object.questionId);
  writer.writeString(offsets[2], object.questionText);
}

CorrectQuestionModel _correctQuestionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CorrectQuestionModel(
    correctAnswer: reader.readStringOrNull(offsets[0]),
    questionId: reader.readStringOrNull(offsets[1]),
    questionText: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _correctQuestionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CorrectQuestionModelQueryFilter on QueryBuilder<CorrectQuestionModel,
    CorrectQuestionModel, QFilterCondition> {
  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> correctAnswerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'correctAnswer',
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> correctAnswerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'correctAnswer',
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> correctAnswerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> correctAnswerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> correctAnswerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> correctAnswerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'correctAnswer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> correctAnswerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> correctAnswerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
          QAfterFilterCondition>
      correctAnswerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'correctAnswer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
          QAfterFilterCondition>
      correctAnswerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'correctAnswer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> correctAnswerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> correctAnswerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'correctAnswer',
        value: '',
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionId',
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
          QAfterFilterCondition>
      questionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
          QAfterFilterCondition>
      questionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionId',
        value: '',
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionId',
        value: '',
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionTextIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'questionText',
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionTextIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'questionText',
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionTextEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionTextGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionTextLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionTextBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questionText',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
          QAfterFilterCondition>
      questionTextContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questionText',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
          QAfterFilterCondition>
      questionTextMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questionText',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionTextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questionText',
        value: '',
      ));
    });
  }

  QueryBuilder<CorrectQuestionModel, CorrectQuestionModel,
      QAfterFilterCondition> questionTextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questionText',
        value: '',
      ));
    });
  }
}

extension CorrectQuestionModelQueryObject on QueryBuilder<CorrectQuestionModel,
    CorrectQuestionModel, QFilterCondition> {}
