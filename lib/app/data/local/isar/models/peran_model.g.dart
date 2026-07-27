// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peran_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPeranModelCollection on Isar {
  IsarCollection<PeranModel> get peranModels => this.collection();
}

const PeranModelSchema = CollectionSchema(
  name: r'PeranModel',
  id: 3148604977529822382,
  properties: {
    r'dibuatPada': PropertySchema(
      id: 0,
      name: r'dibuatPada',
      type: IsarType.dateTime,
    ),
    r'dihapusPada': PropertySchema(
      id: 1,
      name: r'dihapusPada',
      type: IsarType.dateTime,
    ),
    r'diperbaruiPada': PropertySchema(
      id: 2,
      name: r'diperbaruiPada',
      type: IsarType.dateTime,
    ),
    r'namaPeran': PropertySchema(
      id: 3,
      name: r'namaPeran',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 4,
      name: r'status',
      type: IsarType.bool,
    )
  },
  estimateSize: _peranModelEstimateSize,
  serialize: _peranModelSerialize,
  deserialize: _peranModelDeserialize,
  deserializeProp: _peranModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'namaPeran': IndexSchema(
      id: 1251816045734062483,
      name: r'namaPeran',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'namaPeran',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _peranModelGetId,
  getLinks: _peranModelGetLinks,
  attach: _peranModelAttach,
  version: '3.1.0+1',
);

int _peranModelEstimateSize(
  PeranModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.namaPeran.length * 3;
  return bytesCount;
}

void _peranModelSerialize(
  PeranModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dibuatPada);
  writer.writeDateTime(offsets[1], object.dihapusPada);
  writer.writeDateTime(offsets[2], object.diperbaruiPada);
  writer.writeString(offsets[3], object.namaPeran);
  writer.writeBool(offsets[4], object.status);
}

PeranModel _peranModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PeranModel();
  object.dibuatPada = reader.readDateTime(offsets[0]);
  object.dihapusPada = reader.readDateTimeOrNull(offsets[1]);
  object.diperbaruiPada = reader.readDateTime(offsets[2]);
  object.id = id;
  object.namaPeran = reader.readString(offsets[3]);
  object.status = reader.readBool(offsets[4]);
  return object;
}

P _peranModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _peranModelGetId(PeranModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _peranModelGetLinks(PeranModel object) {
  return [];
}

void _peranModelAttach(IsarCollection<dynamic> col, Id id, PeranModel object) {
  object.id = id;
}

extension PeranModelByIndex on IsarCollection<PeranModel> {
  Future<PeranModel?> getByNamaPeran(String namaPeran) {
    return getByIndex(r'namaPeran', [namaPeran]);
  }

  PeranModel? getByNamaPeranSync(String namaPeran) {
    return getByIndexSync(r'namaPeran', [namaPeran]);
  }

  Future<bool> deleteByNamaPeran(String namaPeran) {
    return deleteByIndex(r'namaPeran', [namaPeran]);
  }

  bool deleteByNamaPeranSync(String namaPeran) {
    return deleteByIndexSync(r'namaPeran', [namaPeran]);
  }

  Future<List<PeranModel?>> getAllByNamaPeran(List<String> namaPeranValues) {
    final values = namaPeranValues.map((e) => [e]).toList();
    return getAllByIndex(r'namaPeran', values);
  }

  List<PeranModel?> getAllByNamaPeranSync(List<String> namaPeranValues) {
    final values = namaPeranValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'namaPeran', values);
  }

  Future<int> deleteAllByNamaPeran(List<String> namaPeranValues) {
    final values = namaPeranValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'namaPeran', values);
  }

  int deleteAllByNamaPeranSync(List<String> namaPeranValues) {
    final values = namaPeranValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'namaPeran', values);
  }

  Future<Id> putByNamaPeran(PeranModel object) {
    return putByIndex(r'namaPeran', object);
  }

  Id putByNamaPeranSync(PeranModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'namaPeran', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNamaPeran(List<PeranModel> objects) {
    return putAllByIndex(r'namaPeran', objects);
  }

  List<Id> putAllByNamaPeranSync(List<PeranModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'namaPeran', objects, saveLinks: saveLinks);
  }
}

extension PeranModelQueryWhereSort
    on QueryBuilder<PeranModel, PeranModel, QWhere> {
  QueryBuilder<PeranModel, PeranModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PeranModelQueryWhere
    on QueryBuilder<PeranModel, PeranModel, QWhereClause> {
  QueryBuilder<PeranModel, PeranModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<PeranModel, PeranModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<PeranModel, PeranModel, QAfterWhereClause> namaPeranEqualTo(
      String namaPeran) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'namaPeran',
        value: [namaPeran],
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterWhereClause> namaPeranNotEqualTo(
      String namaPeran) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namaPeran',
              lower: [],
              upper: [namaPeran],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namaPeran',
              lower: [namaPeran],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namaPeran',
              lower: [namaPeran],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namaPeran',
              lower: [],
              upper: [namaPeran],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PeranModelQueryFilter
    on QueryBuilder<PeranModel, PeranModel, QFilterCondition> {
  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> dibuatPadaEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dibuatPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      dibuatPadaGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dibuatPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      dibuatPadaLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dibuatPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> dibuatPadaBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dibuatPada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      dihapusPadaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dihapusPada',
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      dihapusPadaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dihapusPada',
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      dihapusPadaEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dihapusPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      dihapusPadaGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dihapusPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      dihapusPadaLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dihapusPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      dihapusPadaBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dihapusPada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      diperbaruiPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diperbaruiPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      diperbaruiPadaGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diperbaruiPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      diperbaruiPadaLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diperbaruiPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      diperbaruiPadaBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diperbaruiPada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> namaPeranEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaPeran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      namaPeranGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namaPeran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> namaPeranLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namaPeran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> namaPeranBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namaPeran',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      namaPeranStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namaPeran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> namaPeranEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namaPeran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> namaPeranContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namaPeran',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> namaPeranMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namaPeran',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      namaPeranIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaPeran',
        value: '',
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition>
      namaPeranIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namaPeran',
        value: '',
      ));
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterFilterCondition> statusEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }
}

extension PeranModelQueryObject
    on QueryBuilder<PeranModel, PeranModel, QFilterCondition> {}

extension PeranModelQueryLinks
    on QueryBuilder<PeranModel, PeranModel, QFilterCondition> {}

extension PeranModelQuerySortBy
    on QueryBuilder<PeranModel, PeranModel, QSortBy> {
  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> sortByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> sortByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> sortByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.asc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> sortByDihapusPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.desc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> sortByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy>
      sortByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> sortByNamaPeran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPeran', Sort.asc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> sortByNamaPeranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPeran', Sort.desc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension PeranModelQuerySortThenBy
    on QueryBuilder<PeranModel, PeranModel, QSortThenBy> {
  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> thenByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> thenByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> thenByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.asc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> thenByDihapusPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.desc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> thenByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy>
      thenByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> thenByNamaPeran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPeran', Sort.asc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> thenByNamaPeranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPeran', Sort.desc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension PeranModelQueryWhereDistinct
    on QueryBuilder<PeranModel, PeranModel, QDistinct> {
  QueryBuilder<PeranModel, PeranModel, QDistinct> distinctByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dibuatPada');
    });
  }

  QueryBuilder<PeranModel, PeranModel, QDistinct> distinctByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dihapusPada');
    });
  }

  QueryBuilder<PeranModel, PeranModel, QDistinct> distinctByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diperbaruiPada');
    });
  }

  QueryBuilder<PeranModel, PeranModel, QDistinct> distinctByNamaPeran(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namaPeran', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PeranModel, PeranModel, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension PeranModelQueryProperty
    on QueryBuilder<PeranModel, PeranModel, QQueryProperty> {
  QueryBuilder<PeranModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PeranModel, DateTime, QQueryOperations> dibuatPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dibuatPada');
    });
  }

  QueryBuilder<PeranModel, DateTime?, QQueryOperations> dihapusPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dihapusPada');
    });
  }

  QueryBuilder<PeranModel, DateTime, QQueryOperations>
      diperbaruiPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diperbaruiPada');
    });
  }

  QueryBuilder<PeranModel, String, QQueryOperations> namaPeranProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namaPeran');
    });
  }

  QueryBuilder<PeranModel, bool, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}
