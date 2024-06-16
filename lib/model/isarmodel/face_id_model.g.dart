// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'face_id_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFaceIdModelCollection on Isar {
  IsarCollection<FaceIdModel> get faceIdModels => this.collection();
}

const FaceIdModelSchema = CollectionSchema(
  name: r'FaceIdModel',
  id: 1281895931515741371,
  properties: {
    r'faceId': PropertySchema(
      id: 0,
      name: r'faceId',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 1,
      name: r'userId',
      type: IsarType.long,
    )
  },
  estimateSize: _faceIdModelEstimateSize,
  serialize: _faceIdModelSerialize,
  deserialize: _faceIdModelDeserialize,
  deserializeProp: _faceIdModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _faceIdModelGetId,
  getLinks: _faceIdModelGetLinks,
  attach: _faceIdModelAttach,
  version: '3.1.0+1',
);

int _faceIdModelEstimateSize(
  FaceIdModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.faceId.length * 3;
  return bytesCount;
}

void _faceIdModelSerialize(
  FaceIdModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.faceId);
  writer.writeLong(offsets[1], object.userId);
}

FaceIdModel _faceIdModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FaceIdModel(
    reader.readLong(offsets[1]),
    reader.readString(offsets[0]),
  );
  object.id = id;
  return object;
}

P _faceIdModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _faceIdModelGetId(FaceIdModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _faceIdModelGetLinks(FaceIdModel object) {
  return [];
}

void _faceIdModelAttach(
    IsarCollection<dynamic> col, Id id, FaceIdModel object) {
  object.id = id;
}

extension FaceIdModelQueryWhereSort
    on QueryBuilder<FaceIdModel, FaceIdModel, QWhere> {
  QueryBuilder<FaceIdModel, FaceIdModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FaceIdModelQueryWhere
    on QueryBuilder<FaceIdModel, FaceIdModel, QWhereClause> {
  QueryBuilder<FaceIdModel, FaceIdModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterWhereClause> idBetween(
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
}

extension FaceIdModelQueryFilter
    on QueryBuilder<FaceIdModel, FaceIdModel, QFilterCondition> {
  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> faceIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'faceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition>
      faceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'faceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> faceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'faceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> faceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'faceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition>
      faceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'faceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> faceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'faceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> faceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'faceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> faceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'faceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition>
      faceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'faceId',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition>
      faceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'faceId',
        value: '',
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> userIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition>
      userIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> userIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterFilterCondition> userIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FaceIdModelQueryObject
    on QueryBuilder<FaceIdModel, FaceIdModel, QFilterCondition> {}

extension FaceIdModelQueryLinks
    on QueryBuilder<FaceIdModel, FaceIdModel, QFilterCondition> {}

extension FaceIdModelQuerySortBy
    on QueryBuilder<FaceIdModel, FaceIdModel, QSortBy> {
  QueryBuilder<FaceIdModel, FaceIdModel, QAfterSortBy> sortByFaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faceId', Sort.asc);
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterSortBy> sortByFaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faceId', Sort.desc);
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension FaceIdModelQuerySortThenBy
    on QueryBuilder<FaceIdModel, FaceIdModel, QSortThenBy> {
  QueryBuilder<FaceIdModel, FaceIdModel, QAfterSortBy> thenByFaceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faceId', Sort.asc);
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterSortBy> thenByFaceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'faceId', Sort.desc);
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension FaceIdModelQueryWhereDistinct
    on QueryBuilder<FaceIdModel, FaceIdModel, QDistinct> {
  QueryBuilder<FaceIdModel, FaceIdModel, QDistinct> distinctByFaceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'faceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<FaceIdModel, FaceIdModel, QDistinct> distinctByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId');
    });
  }
}

extension FaceIdModelQueryProperty
    on QueryBuilder<FaceIdModel, FaceIdModel, QQueryProperty> {
  QueryBuilder<FaceIdModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FaceIdModel, String, QQueryOperations> faceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'faceId');
    });
  }

  QueryBuilder<FaceIdModel, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}
