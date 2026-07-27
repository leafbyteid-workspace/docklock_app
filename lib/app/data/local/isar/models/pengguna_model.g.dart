// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pengguna_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPenggunaModelCollection on Isar {
  IsarCollection<PenggunaModel> get penggunaModels => this.collection();
}

const PenggunaModelSchema = CollectionSchema(
  name: r'PenggunaModel',
  id: 7908689721996268944,
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
    r'idPeran': PropertySchema(
      id: 3,
      name: r'idPeran',
      type: IsarType.long,
    ),
    r'jenisKelamin': PropertySchema(
      id: 4,
      name: r'jenisKelamin',
      type: IsarType.byte,
      enumMap: _PenggunaModeljenisKelaminEnumValueMap,
    ),
    r'namaLengkap': PropertySchema(
      id: 5,
      name: r'namaLengkap',
      type: IsarType.string,
    ),
    r'namaPengguna': PropertySchema(
      id: 6,
      name: r'namaPengguna',
      type: IsarType.string,
    ),
    r'usia': PropertySchema(
      id: 7,
      name: r'usia',
      type: IsarType.long,
    )
  },
  estimateSize: _penggunaModelEstimateSize,
  serialize: _penggunaModelSerialize,
  deserialize: _penggunaModelDeserialize,
  deserializeProp: _penggunaModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'idPeran': IndexSchema(
      id: 3052453129981405932,
      name: r'idPeran',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idPeran',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'namaPengguna': IndexSchema(
      id: 9066827254901046159,
      name: r'namaPengguna',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'namaPengguna',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _penggunaModelGetId,
  getLinks: _penggunaModelGetLinks,
  attach: _penggunaModelAttach,
  version: '3.1.0+1',
);

int _penggunaModelEstimateSize(
  PenggunaModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.namaLengkap.length * 3;
  bytesCount += 3 + object.namaPengguna.length * 3;
  return bytesCount;
}

void _penggunaModelSerialize(
  PenggunaModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dibuatPada);
  writer.writeDateTime(offsets[1], object.dihapusPada);
  writer.writeDateTime(offsets[2], object.diperbaruiPada);
  writer.writeLong(offsets[3], object.idPeran);
  writer.writeByte(offsets[4], object.jenisKelamin.index);
  writer.writeString(offsets[5], object.namaLengkap);
  writer.writeString(offsets[6], object.namaPengguna);
  writer.writeLong(offsets[7], object.usia);
}

PenggunaModel _penggunaModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PenggunaModel();
  object.dibuatPada = reader.readDateTime(offsets[0]);
  object.dihapusPada = reader.readDateTimeOrNull(offsets[1]);
  object.diperbaruiPada = reader.readDateTime(offsets[2]);
  object.id = id;
  object.idPeran = reader.readLongOrNull(offsets[3]);
  object.jenisKelamin = _PenggunaModeljenisKelaminValueEnumMap[
          reader.readByteOrNull(offsets[4])] ??
      JenisKelamin.belumDiisi;
  object.namaLengkap = reader.readString(offsets[5]);
  object.namaPengguna = reader.readString(offsets[6]);
  object.usia = reader.readLongOrNull(offsets[7]);
  return object;
}

P _penggunaModelDeserializeProp<P>(
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
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (_PenggunaModeljenisKelaminValueEnumMap[
              reader.readByteOrNull(offset)] ??
          JenisKelamin.belumDiisi) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _PenggunaModeljenisKelaminEnumValueMap = {
  'belumDiisi': 0,
  'pria': 1,
  'wanita': 2,
};
const _PenggunaModeljenisKelaminValueEnumMap = {
  0: JenisKelamin.belumDiisi,
  1: JenisKelamin.pria,
  2: JenisKelamin.wanita,
};

Id _penggunaModelGetId(PenggunaModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _penggunaModelGetLinks(PenggunaModel object) {
  return [];
}

void _penggunaModelAttach(
    IsarCollection<dynamic> col, Id id, PenggunaModel object) {
  object.id = id;
}

extension PenggunaModelByIndex on IsarCollection<PenggunaModel> {
  Future<PenggunaModel?> getByNamaPengguna(String namaPengguna) {
    return getByIndex(r'namaPengguna', [namaPengguna]);
  }

  PenggunaModel? getByNamaPenggunaSync(String namaPengguna) {
    return getByIndexSync(r'namaPengguna', [namaPengguna]);
  }

  Future<bool> deleteByNamaPengguna(String namaPengguna) {
    return deleteByIndex(r'namaPengguna', [namaPengguna]);
  }

  bool deleteByNamaPenggunaSync(String namaPengguna) {
    return deleteByIndexSync(r'namaPengguna', [namaPengguna]);
  }

  Future<List<PenggunaModel?>> getAllByNamaPengguna(
      List<String> namaPenggunaValues) {
    final values = namaPenggunaValues.map((e) => [e]).toList();
    return getAllByIndex(r'namaPengguna', values);
  }

  List<PenggunaModel?> getAllByNamaPenggunaSync(
      List<String> namaPenggunaValues) {
    final values = namaPenggunaValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'namaPengguna', values);
  }

  Future<int> deleteAllByNamaPengguna(List<String> namaPenggunaValues) {
    final values = namaPenggunaValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'namaPengguna', values);
  }

  int deleteAllByNamaPenggunaSync(List<String> namaPenggunaValues) {
    final values = namaPenggunaValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'namaPengguna', values);
  }

  Future<Id> putByNamaPengguna(PenggunaModel object) {
    return putByIndex(r'namaPengguna', object);
  }

  Id putByNamaPenggunaSync(PenggunaModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'namaPengguna', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNamaPengguna(List<PenggunaModel> objects) {
    return putAllByIndex(r'namaPengguna', objects);
  }

  List<Id> putAllByNamaPenggunaSync(List<PenggunaModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'namaPengguna', objects, saveLinks: saveLinks);
  }
}

extension PenggunaModelQueryWhereSort
    on QueryBuilder<PenggunaModel, PenggunaModel, QWhere> {
  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhere> anyIdPeran() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idPeran'),
      );
    });
  }
}

extension PenggunaModelQueryWhere
    on QueryBuilder<PenggunaModel, PenggunaModel, QWhereClause> {
  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause>
      idPeranIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idPeran',
        value: [null],
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause>
      idPeranIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idPeran',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause> idPeranEqualTo(
      int? idPeran) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idPeran',
        value: [idPeran],
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause>
      idPeranNotEqualTo(int? idPeran) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPeran',
              lower: [],
              upper: [idPeran],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPeran',
              lower: [idPeran],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPeran',
              lower: [idPeran],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idPeran',
              lower: [],
              upper: [idPeran],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause>
      idPeranGreaterThan(
    int? idPeran, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idPeran',
        lower: [idPeran],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause> idPeranLessThan(
    int? idPeran, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idPeran',
        lower: [],
        upper: [idPeran],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause> idPeranBetween(
    int? lowerIdPeran,
    int? upperIdPeran, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idPeran',
        lower: [lowerIdPeran],
        includeLower: includeLower,
        upper: [upperIdPeran],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause>
      namaPenggunaEqualTo(String namaPengguna) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'namaPengguna',
        value: [namaPengguna],
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterWhereClause>
      namaPenggunaNotEqualTo(String namaPengguna) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namaPengguna',
              lower: [],
              upper: [namaPengguna],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namaPengguna',
              lower: [namaPengguna],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namaPengguna',
              lower: [namaPengguna],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namaPengguna',
              lower: [],
              upper: [namaPengguna],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PenggunaModelQueryFilter
    on QueryBuilder<PenggunaModel, PenggunaModel, QFilterCondition> {
  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      dibuatPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dibuatPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      dibuatPadaBetween(
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      dihapusPadaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dihapusPada',
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      dihapusPadaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dihapusPada',
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      dihapusPadaEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dihapusPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      diperbaruiPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diperbaruiPada',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      idPeranIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'idPeran',
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      idPeranIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'idPeran',
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      idPeranEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idPeran',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      idPeranGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idPeran',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      idPeranLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idPeran',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      idPeranBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idPeran',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      jenisKelaminEqualTo(JenisKelamin value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'jenisKelamin',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      jenisKelaminGreaterThan(
    JenisKelamin value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'jenisKelamin',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      jenisKelaminLessThan(
    JenisKelamin value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'jenisKelamin',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      jenisKelaminBetween(
    JenisKelamin lower,
    JenisKelamin upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'jenisKelamin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaLengkapEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaLengkapGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaLengkapLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaLengkapBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namaLengkap',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaLengkapStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaLengkapEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaLengkapContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namaLengkap',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaLengkapMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namaLengkap',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaLengkapIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaLengkap',
        value: '',
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaLengkapIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namaLengkap',
        value: '',
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaPenggunaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaPengguna',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaPenggunaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namaPengguna',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaPenggunaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namaPengguna',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaPenggunaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namaPengguna',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaPenggunaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namaPengguna',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaPenggunaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namaPengguna',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaPenggunaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namaPengguna',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaPenggunaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namaPengguna',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaPenggunaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaPengguna',
        value: '',
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      namaPenggunaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namaPengguna',
        value: '',
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      usiaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'usia',
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      usiaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'usia',
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition> usiaEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'usia',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      usiaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'usia',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition>
      usiaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'usia',
        value: value,
      ));
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterFilterCondition> usiaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'usia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PenggunaModelQueryObject
    on QueryBuilder<PenggunaModel, PenggunaModel, QFilterCondition> {}

extension PenggunaModelQueryLinks
    on QueryBuilder<PenggunaModel, PenggunaModel, QFilterCondition> {}

extension PenggunaModelQuerySortBy
    on QueryBuilder<PenggunaModel, PenggunaModel, QSortBy> {
  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> sortByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      sortByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> sortByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      sortByDihapusPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      sortByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      sortByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> sortByIdPeran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPeran', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> sortByIdPeranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPeran', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      sortByJenisKelamin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jenisKelamin', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      sortByJenisKelaminDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jenisKelamin', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> sortByNamaLengkap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaLengkap', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      sortByNamaLengkapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaLengkap', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      sortByNamaPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPengguna', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      sortByNamaPenggunaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPengguna', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> sortByUsia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usia', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> sortByUsiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usia', Sort.desc);
    });
  }
}

extension PenggunaModelQuerySortThenBy
    on QueryBuilder<PenggunaModel, PenggunaModel, QSortThenBy> {
  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> thenByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      thenByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> thenByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      thenByDihapusPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      thenByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      thenByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> thenByIdPeran() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPeran', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> thenByIdPeranDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPeran', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      thenByJenisKelamin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jenisKelamin', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      thenByJenisKelaminDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'jenisKelamin', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> thenByNamaLengkap() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaLengkap', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      thenByNamaLengkapDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaLengkap', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      thenByNamaPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPengguna', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy>
      thenByNamaPenggunaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPengguna', Sort.desc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> thenByUsia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usia', Sort.asc);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QAfterSortBy> thenByUsiaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'usia', Sort.desc);
    });
  }
}

extension PenggunaModelQueryWhereDistinct
    on QueryBuilder<PenggunaModel, PenggunaModel, QDistinct> {
  QueryBuilder<PenggunaModel, PenggunaModel, QDistinct> distinctByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dibuatPada');
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QDistinct>
      distinctByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dihapusPada');
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QDistinct>
      distinctByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diperbaruiPada');
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QDistinct> distinctByIdPeran() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idPeran');
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QDistinct>
      distinctByJenisKelamin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'jenisKelamin');
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QDistinct> distinctByNamaLengkap(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namaLengkap', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QDistinct> distinctByNamaPengguna(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namaPengguna', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PenggunaModel, PenggunaModel, QDistinct> distinctByUsia() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'usia');
    });
  }
}

extension PenggunaModelQueryProperty
    on QueryBuilder<PenggunaModel, PenggunaModel, QQueryProperty> {
  QueryBuilder<PenggunaModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PenggunaModel, DateTime, QQueryOperations> dibuatPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dibuatPada');
    });
  }

  QueryBuilder<PenggunaModel, DateTime?, QQueryOperations>
      dihapusPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dihapusPada');
    });
  }

  QueryBuilder<PenggunaModel, DateTime, QQueryOperations>
      diperbaruiPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diperbaruiPada');
    });
  }

  QueryBuilder<PenggunaModel, int?, QQueryOperations> idPeranProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idPeran');
    });
  }

  QueryBuilder<PenggunaModel, JenisKelamin, QQueryOperations>
      jenisKelaminProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'jenisKelamin');
    });
  }

  QueryBuilder<PenggunaModel, String, QQueryOperations> namaLengkapProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namaLengkap');
    });
  }

  QueryBuilder<PenggunaModel, String, QQueryOperations> namaPenggunaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namaPengguna');
    });
  }

  QueryBuilder<PenggunaModel, int?, QQueryOperations> usiaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'usia');
    });
  }
}
