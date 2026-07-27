// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'akun_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAkunModelCollection on Isar {
  IsarCollection<AkunModel> get akunModels => this.collection();
}

const AkunModelSchema = CollectionSchema(
  name: r'AkunModel',
  id: -2759086466516454564,
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
    r'email': PropertySchema(
      id: 3,
      name: r'email',
      type: IsarType.string,
    ),
    r'idPengguna': PropertySchema(
      id: 4,
      name: r'idPengguna',
      type: IsarType.long,
    ),
    r'kataSandi': PropertySchema(
      id: 5,
      name: r'kataSandi',
      type: IsarType.string,
    )
  },
  estimateSize: _akunModelEstimateSize,
  serialize: _akunModelSerialize,
  deserialize: _akunModelDeserialize,
  deserializeProp: _akunModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'idPengguna': IndexSchema(
      id: -1092966039149577079,
      name: r'idPengguna',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idPengguna',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'email': IndexSchema(
      id: -26095440403582047,
      name: r'email',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'email',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _akunModelGetId,
  getLinks: _akunModelGetLinks,
  attach: _akunModelAttach,
  version: '3.1.0+1',
);

int _akunModelEstimateSize(
  AkunModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.email.length * 3;
  bytesCount += 3 + object.kataSandi.length * 3;
  return bytesCount;
}

void _akunModelSerialize(
  AkunModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dibuatPada);
  writer.writeDateTime(offsets[1], object.dihapusPada);
  writer.writeDateTime(offsets[2], object.diperbaruiPada);
  writer.writeString(offsets[3], object.email);
  writer.writeLong(offsets[4], object.idPengguna);
  writer.writeString(offsets[5], object.kataSandi);
}

AkunModel _akunModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AkunModel();
  object.dibuatPada = reader.readDateTime(offsets[0]);
  object.dihapusPada = reader.readDateTimeOrNull(offsets[1]);
  object.diperbaruiPada = reader.readDateTime(offsets[2]);
  object.email = reader.readString(offsets[3]);
  object.id = id;
  object.idPengguna = reader.readLongOrNull(offsets[4]);
  object.kataSandi = reader.readString(offsets[5]);
  return object;
}

P _akunModelDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _akunModelGetId(AkunModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _akunModelGetLinks(AkunModel object) {
  return [];
}

void _akunModelAttach(IsarCollection<dynamic> col, Id id, AkunModel object) {
  object.id = id;
}

extension AkunModelByIndex on IsarCollection<AkunModel> {
  Future<AkunModel?> getByIdPengguna(int? idPengguna) {
    return getByIndex(r'idPengguna', [idPengguna]);
  }

  AkunModel? getByIdPenggunaSync(int? idPengguna) {
    return getByIndexSync(r'idPengguna', [idPengguna]);
  }

  Future<bool> deleteByIdPengguna(int? idPengguna) {
    return deleteByIndex(r'idPengguna', [idPengguna]);
  }

  bool deleteByIdPenggunaSync(int? idPengguna) {
    return deleteByIndexSync(r'idPengguna', [idPengguna]);
  }

  Future<List<AkunModel?>> getAllByIdPengguna(List<int?> idPenggunaValues) {
    final values = idPenggunaValues.map((e) => [e]).toList();
    return getAllByIndex(r'idPengguna', values);
  }

  List<AkunModel?> getAllByIdPenggunaSync(List<int?> idPenggunaValues) {
    final values = idPenggunaValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idPengguna', values);
  }

  Future<int> deleteAllByIdPengguna(List<int?> idPenggunaValues) {
    final values = idPenggunaValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idPengguna', values);
  }

  int deleteAllByIdPenggunaSync(List<int?> idPenggunaValues) {
    final values = idPenggunaValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idPengguna', values);
  }

  Future<Id> putByIdPengguna(AkunModel object) {
    return putByIndex(r'idPengguna', object);
  }

  Id putByIdPenggunaSync(AkunModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'idPengguna', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdPengguna(List<AkunModel> objects) {
    return putAllByIndex(r'idPengguna', objects);
  }

  List<Id> putAllByIdPenggunaSync(List<AkunModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idPengguna', objects, saveLinks: saveLinks);
  }

  Future<AkunModel?> getByEmail(String email) {
    return getByIndex(r'email', [email]);
  }

  AkunModel? getByEmailSync(String email) {
    return getByIndexSync(r'email', [email]);
  }

  Future<bool> deleteByEmail(String email) {
    return deleteByIndex(r'email', [email]);
  }

  bool deleteByEmailSync(String email) {
    return deleteByIndexSync(r'email', [email]);
  }

  Future<List<AkunModel?>> getAllByEmail(List<String> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return getAllByIndex(r'email', values);
  }

  List<AkunModel?> getAllByEmailSync(List<String> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'email', values);
  }

  Future<int> deleteAllByEmail(List<String> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'email', values);
  }

  int deleteAllByEmailSync(List<String> emailValues) {
    final values = emailValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'email', values);
  }

  Future<Id> putByEmail(AkunModel object) {
    return putByIndex(r'email', object);
  }

  Id putByEmailSync(AkunModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'email', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEmail(List<AkunModel> objects) {
    return putAllByIndex(r'email', objects);
  }

  List<Id> putAllByEmailSync(List<AkunModel> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'email', objects, saveLinks: saveLinks);
  }
}

extension AkunModelQueryWhereSort
    on QueryBuilder<AkunModel, AkunModel, QWhere> {
  QueryBuilder<AkunModel, AkunModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhere> anyIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idPengguna'),
      );
    });
  }
}

extension AkunModelQueryWhere
    on QueryBuilder<AkunModel, AkunModel, QWhereClause> {
  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idPenggunaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idPengguna',
        value: [null],
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idPenggunaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idPengguna',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idPenggunaEqualTo(
      int? idPengguna) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idPengguna',
        value: [idPengguna],
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idPenggunaNotEqualTo(
      int? idPengguna) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPengguna',
              lower: [],
              upper: [idPengguna],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPengguna',
              lower: [idPengguna],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPengguna',
              lower: [idPengguna],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPengguna',
              lower: [],
              upper: [idPengguna],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idPenggunaGreaterThan(
    int? idPengguna, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idPengguna',
        lower: [idPengguna],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idPenggunaLessThan(
    int? idPengguna, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idPengguna',
        lower: [],
        upper: [idPengguna],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> idPenggunaBetween(
    int? lowerIdPengguna,
    int? upperIdPengguna, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idPengguna',
        lower: [lowerIdPengguna],
        includeLower: includeLower,
        upper: [upperIdPengguna],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> emailEqualTo(
      String email) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'email',
        value: [email],
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterWhereClause> emailNotEqualTo(
      String email) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [],
              upper: [email],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [email],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [email],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'email',
              lower: [],
              upper: [email],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AkunModelQueryFilter
    on QueryBuilder<AkunModel, AkunModel, QFilterCondition> {
  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> dibuatPadaEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dibuatPada',
        value: value,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> dibuatPadaLessThan(
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> dibuatPadaBetween(
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
      dihapusPadaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dihapusPada',
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
      dihapusPadaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dihapusPada',
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> dihapusPadaEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dihapusPada',
        value: value,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> dihapusPadaLessThan(
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> dihapusPadaBetween(
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
      diperbaruiPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diperbaruiPada',
        value: value,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> emailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> emailGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> emailLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> emailBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> idPenggunaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idPengguna',
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
      idPenggunaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idPengguna',
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> idPenggunaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idPengguna',
        value: value,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
      idPenggunaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idPengguna',
        value: value,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> idPenggunaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idPengguna',
        value: value,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> idPenggunaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idPengguna',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> kataSandiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kataSandi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
      kataSandiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kataSandi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> kataSandiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kataSandi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> kataSandiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kataSandi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> kataSandiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kataSandi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> kataSandiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kataSandi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> kataSandiContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kataSandi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> kataSandiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kataSandi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition> kataSandiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kataSandi',
        value: '',
      ));
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterFilterCondition>
      kataSandiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kataSandi',
        value: '',
      ));
    });
  }
}

extension AkunModelQueryObject
    on QueryBuilder<AkunModel, AkunModel, QFilterCondition> {}

extension AkunModelQueryLinks
    on QueryBuilder<AkunModel, AkunModel, QFilterCondition> {}

extension AkunModelQuerySortBy on QueryBuilder<AkunModel, AkunModel, QSortBy> {
  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByDihapusPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.desc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByIdPenggunaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.desc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByKataSandi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kataSandi', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> sortByKataSandiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kataSandi', Sort.desc);
    });
  }
}

extension AkunModelQuerySortThenBy
    on QueryBuilder<AkunModel, AkunModel, QSortThenBy> {
  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByDihapusPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.desc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByIdPenggunaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.desc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByKataSandi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kataSandi', Sort.asc);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QAfterSortBy> thenByKataSandiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kataSandi', Sort.desc);
    });
  }
}

extension AkunModelQueryWhereDistinct
    on QueryBuilder<AkunModel, AkunModel, QDistinct> {
  QueryBuilder<AkunModel, AkunModel, QDistinct> distinctByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dibuatPada');
    });
  }

  QueryBuilder<AkunModel, AkunModel, QDistinct> distinctByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dihapusPada');
    });
  }

  QueryBuilder<AkunModel, AkunModel, QDistinct> distinctByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diperbaruiPada');
    });
  }

  QueryBuilder<AkunModel, AkunModel, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AkunModel, AkunModel, QDistinct> distinctByIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idPengguna');
    });
  }

  QueryBuilder<AkunModel, AkunModel, QDistinct> distinctByKataSandi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kataSandi', caseSensitive: caseSensitive);
    });
  }
}

extension AkunModelQueryProperty
    on QueryBuilder<AkunModel, AkunModel, QQueryProperty> {
  QueryBuilder<AkunModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AkunModel, DateTime, QQueryOperations> dibuatPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dibuatPada');
    });
  }

  QueryBuilder<AkunModel, DateTime?, QQueryOperations> dihapusPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dihapusPada');
    });
  }

  QueryBuilder<AkunModel, DateTime, QQueryOperations> diperbaruiPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diperbaruiPada');
    });
  }

  QueryBuilder<AkunModel, String, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<AkunModel, int?, QQueryOperations> idPenggunaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idPengguna');
    });
  }

  QueryBuilder<AkunModel, String, QQueryOperations> kataSandiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kataSandi');
    });
  }
}
