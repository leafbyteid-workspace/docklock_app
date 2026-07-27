// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sesi_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSesiModelCollection on Isar {
  IsarCollection<SesiModel> get sesiModels => this.collection();
}

const SesiModelSchema = CollectionSchema(
  name: r'SesiModel',
  id: 7588840255564572555,
  properties: {
    r'diPerbaruiPada': PropertySchema(
      id: 0,
      name: r'diPerbaruiPada',
      type: IsarType.dateTime,
    ),
    r'dibuatPada': PropertySchema(
      id: 1,
      name: r'dibuatPada',
      type: IsarType.dateTime,
    ),
    r'idAkun': PropertySchema(
      id: 2,
      name: r'idAkun',
      type: IsarType.long,
    ),
    r'keluarPada': PropertySchema(
      id: 3,
      name: r'keluarPada',
      type: IsarType.dateTime,
    ),
    r'masukTerakhirPada': PropertySchema(
      id: 4,
      name: r'masukTerakhirPada',
      type: IsarType.dateTime,
    ),
    r'sedangMasuk': PropertySchema(
      id: 5,
      name: r'sedangMasuk',
      type: IsarType.bool,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.byte,
      enumMap: _SesiModelstatusEnumValueMap,
    ),
    r'terakhirAktifPada': PropertySchema(
      id: 7,
      name: r'terakhirAktifPada',
      type: IsarType.dateTime,
    ),
    r'tokenAkses': PropertySchema(
      id: 8,
      name: r'tokenAkses',
      type: IsarType.string,
    ),
    r'tokenAksesAkhir': PropertySchema(
      id: 9,
      name: r'tokenAksesAkhir',
      type: IsarType.dateTime,
    ),
    r'tokenPemulihan': PropertySchema(
      id: 10,
      name: r'tokenPemulihan',
      type: IsarType.string,
    ),
    r'tokenPemulihanAkhir': PropertySchema(
      id: 11,
      name: r'tokenPemulihanAkhir',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _sesiModelEstimateSize,
  serialize: _sesiModelSerialize,
  deserialize: _sesiModelDeserialize,
  deserializeProp: _sesiModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'idAkun': IndexSchema(
      id: 1854728754135717249,
      name: r'idAkun',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idAkun',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _sesiModelGetId,
  getLinks: _sesiModelGetLinks,
  attach: _sesiModelAttach,
  version: '3.1.0+1',
);

int _sesiModelEstimateSize(
  SesiModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.tokenAkses;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tokenPemulihan;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _sesiModelSerialize(
  SesiModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.diPerbaruiPada);
  writer.writeDateTime(offsets[1], object.dibuatPada);
  writer.writeLong(offsets[2], object.idAkun);
  writer.writeDateTime(offsets[3], object.keluarPada);
  writer.writeDateTime(offsets[4], object.masukTerakhirPada);
  writer.writeBool(offsets[5], object.sedangMasuk);
  writer.writeByte(offsets[6], object.status.index);
  writer.writeDateTime(offsets[7], object.terakhirAktifPada);
  writer.writeString(offsets[8], object.tokenAkses);
  writer.writeDateTime(offsets[9], object.tokenAksesAkhir);
  writer.writeString(offsets[10], object.tokenPemulihan);
  writer.writeDateTime(offsets[11], object.tokenPemulihanAkhir);
}

SesiModel _sesiModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SesiModel();
  object.diPerbaruiPada = reader.readDateTime(offsets[0]);
  object.dibuatPada = reader.readDateTime(offsets[1]);
  object.id = id;
  object.idAkun = reader.readLong(offsets[2]);
  object.keluarPada = reader.readDateTimeOrNull(offsets[3]);
  object.masukTerakhirPada = reader.readDateTimeOrNull(offsets[4]);
  object.sedangMasuk = reader.readBool(offsets[5]);
  object.status =
      _SesiModelstatusValueEnumMap[reader.readByteOrNull(offsets[6])] ??
          StatusSesi.aktif;
  object.terakhirAktifPada = reader.readDateTime(offsets[7]);
  object.tokenAkses = reader.readStringOrNull(offsets[8]);
  object.tokenAksesAkhir = reader.readDateTimeOrNull(offsets[9]);
  object.tokenPemulihan = reader.readStringOrNull(offsets[10]);
  object.tokenPemulihanAkhir = reader.readDateTimeOrNull(offsets[11]);
  return object;
}

P _sesiModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (_SesiModelstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          StatusSesi.aktif) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SesiModelstatusEnumValueMap = {
  'aktif': 0,
  'kedaluwarsa': 1,
  'keluar': 2,
};
const _SesiModelstatusValueEnumMap = {
  0: StatusSesi.aktif,
  1: StatusSesi.kedaluwarsa,
  2: StatusSesi.keluar,
};

Id _sesiModelGetId(SesiModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sesiModelGetLinks(SesiModel object) {
  return [];
}

void _sesiModelAttach(IsarCollection<dynamic> col, Id id, SesiModel object) {
  object.id = id;
}

extension SesiModelByIndex on IsarCollection<SesiModel> {
  Future<SesiModel?> getByIdAkun(int idAkun) {
    return getByIndex(r'idAkun', [idAkun]);
  }

  SesiModel? getByIdAkunSync(int idAkun) {
    return getByIndexSync(r'idAkun', [idAkun]);
  }

  Future<bool> deleteByIdAkun(int idAkun) {
    return deleteByIndex(r'idAkun', [idAkun]);
  }

  bool deleteByIdAkunSync(int idAkun) {
    return deleteByIndexSync(r'idAkun', [idAkun]);
  }

  Future<List<SesiModel?>> getAllByIdAkun(List<int> idAkunValues) {
    final values = idAkunValues.map((e) => [e]).toList();
    return getAllByIndex(r'idAkun', values);
  }

  List<SesiModel?> getAllByIdAkunSync(List<int> idAkunValues) {
    final values = idAkunValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'idAkun', values);
  }

  Future<int> deleteAllByIdAkun(List<int> idAkunValues) {
    final values = idAkunValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'idAkun', values);
  }

  int deleteAllByIdAkunSync(List<int> idAkunValues) {
    final values = idAkunValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'idAkun', values);
  }

  Future<Id> putByIdAkun(SesiModel object) {
    return putByIndex(r'idAkun', object);
  }

  Id putByIdAkunSync(SesiModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'idAkun', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdAkun(List<SesiModel> objects) {
    return putAllByIndex(r'idAkun', objects);
  }

  List<Id> putAllByIdAkunSync(List<SesiModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idAkun', objects, saveLinks: saveLinks);
  }
}

extension SesiModelQueryWhereSort
    on QueryBuilder<SesiModel, SesiModel, QWhere> {
  QueryBuilder<SesiModel, SesiModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterWhere> anyIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idAkun'),
      );
    });
  }
}

extension SesiModelQueryWhere
    on QueryBuilder<SesiModel, SesiModel, QWhereClause> {
  QueryBuilder<SesiModel, SesiModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<SesiModel, SesiModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<SesiModel, SesiModel, QAfterWhereClause> idAkunEqualTo(
      int idAkun) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idAkun',
        value: [idAkun],
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterWhereClause> idAkunNotEqualTo(
      int idAkun) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idAkun',
              lower: [],
              upper: [idAkun],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idAkun',
              lower: [idAkun],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idAkun',
              lower: [idAkun],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idAkun',
              lower: [],
              upper: [idAkun],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterWhereClause> idAkunGreaterThan(
    int idAkun, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idAkun',
        lower: [idAkun],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterWhereClause> idAkunLessThan(
    int idAkun, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idAkun',
        lower: [],
        upper: [idAkun],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterWhereClause> idAkunBetween(
    int lowerIdAkun,
    int upperIdAkun, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idAkun',
        lower: [lowerIdAkun],
        includeLower: includeLower,
        upper: [upperIdAkun],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SesiModelQueryFilter
    on QueryBuilder<SesiModel, SesiModel, QFilterCondition> {
  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      diPerbaruiPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diPerbaruiPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      diPerbaruiPadaGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diPerbaruiPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      diPerbaruiPadaLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diPerbaruiPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      diPerbaruiPadaBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diPerbaruiPada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> dibuatPadaEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dibuatPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
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

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> dibuatPadaLessThan(
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

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> dibuatPadaBetween(
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

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> idAkunEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAkun',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> idAkunGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idAkun',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> idAkunLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idAkun',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> idAkunBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idAkun',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> keluarPadaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'keluarPada',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      keluarPadaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'keluarPada',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> keluarPadaEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keluarPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      keluarPadaGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'keluarPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> keluarPadaLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'keluarPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> keluarPadaBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'keluarPada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      masukTerakhirPadaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'masukTerakhirPada',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      masukTerakhirPadaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'masukTerakhirPada',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      masukTerakhirPadaEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'masukTerakhirPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      masukTerakhirPadaGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'masukTerakhirPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      masukTerakhirPadaLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'masukTerakhirPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      masukTerakhirPadaBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'masukTerakhirPada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> sedangMasukEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sedangMasuk',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> statusEqualTo(
      StatusSesi value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> statusGreaterThan(
    StatusSesi value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> statusLessThan(
    StatusSesi value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> statusBetween(
    StatusSesi lower,
    StatusSesi upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      terakhirAktifPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'terakhirAktifPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      terakhirAktifPadaGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'terakhirAktifPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      terakhirAktifPadaLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'terakhirAktifPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      terakhirAktifPadaBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'terakhirAktifPada',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> tokenAksesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tokenAkses',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenAksesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tokenAkses',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> tokenAksesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenAkses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenAksesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenAkses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> tokenAksesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenAkses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> tokenAksesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenAkses',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenAksesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tokenAkses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> tokenAksesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tokenAkses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> tokenAksesContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tokenAkses',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition> tokenAksesMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tokenAkses',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenAksesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenAkses',
        value: '',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenAksesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tokenAkses',
        value: '',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenAksesAkhirIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tokenAksesAkhir',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenAksesAkhirIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tokenAksesAkhir',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenAksesAkhirEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenAksesAkhir',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenAksesAkhirGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenAksesAkhir',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenAksesAkhirLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenAksesAkhir',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenAksesAkhirBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenAksesAkhir',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tokenPemulihan',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tokenPemulihan',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenPemulihan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenPemulihan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenPemulihan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenPemulihan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tokenPemulihan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tokenPemulihan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tokenPemulihan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tokenPemulihan',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenPemulihan',
        value: '',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tokenPemulihan',
        value: '',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanAkhirIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tokenPemulihanAkhir',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanAkhirIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tokenPemulihanAkhir',
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanAkhirEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tokenPemulihanAkhir',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanAkhirGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tokenPemulihanAkhir',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanAkhirLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tokenPemulihanAkhir',
        value: value,
      ));
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterFilterCondition>
      tokenPemulihanAkhirBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tokenPemulihanAkhir',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SesiModelQueryObject
    on QueryBuilder<SesiModel, SesiModel, QFilterCondition> {}

extension SesiModelQueryLinks
    on QueryBuilder<SesiModel, SesiModel, QFilterCondition> {}

extension SesiModelQuerySortBy on QueryBuilder<SesiModel, SesiModel, QSortBy> {
  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByDiPerbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diPerbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByDiPerbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diPerbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByIdAkunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByKeluarPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keluarPada', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByKeluarPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keluarPada', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByMasukTerakhirPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masukTerakhirPada', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy>
      sortByMasukTerakhirPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masukTerakhirPada', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortBySedangMasuk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sedangMasuk', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortBySedangMasukDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sedangMasuk', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByTerakhirAktifPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terakhirAktifPada', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy>
      sortByTerakhirAktifPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terakhirAktifPada', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByTokenAkses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAkses', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByTokenAksesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAkses', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByTokenAksesAkhir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAksesAkhir', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByTokenAksesAkhirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAksesAkhir', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByTokenPemulihan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenPemulihan', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByTokenPemulihanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenPemulihan', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> sortByTokenPemulihanAkhir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenPemulihanAkhir', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy>
      sortByTokenPemulihanAkhirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenPemulihanAkhir', Sort.desc);
    });
  }
}

extension SesiModelQuerySortThenBy
    on QueryBuilder<SesiModel, SesiModel, QSortThenBy> {
  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByDiPerbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diPerbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByDiPerbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diPerbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByIdAkunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByKeluarPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keluarPada', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByKeluarPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keluarPada', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByMasukTerakhirPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masukTerakhirPada', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy>
      thenByMasukTerakhirPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'masukTerakhirPada', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenBySedangMasuk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sedangMasuk', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenBySedangMasukDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sedangMasuk', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByTerakhirAktifPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terakhirAktifPada', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy>
      thenByTerakhirAktifPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'terakhirAktifPada', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByTokenAkses() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAkses', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByTokenAksesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAkses', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByTokenAksesAkhir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAksesAkhir', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByTokenAksesAkhirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenAksesAkhir', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByTokenPemulihan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenPemulihan', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByTokenPemulihanDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenPemulihan', Sort.desc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy> thenByTokenPemulihanAkhir() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenPemulihanAkhir', Sort.asc);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QAfterSortBy>
      thenByTokenPemulihanAkhirDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tokenPemulihanAkhir', Sort.desc);
    });
  }
}

extension SesiModelQueryWhereDistinct
    on QueryBuilder<SesiModel, SesiModel, QDistinct> {
  QueryBuilder<SesiModel, SesiModel, QDistinct> distinctByDiPerbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diPerbaruiPada');
    });
  }

  QueryBuilder<SesiModel, SesiModel, QDistinct> distinctByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dibuatPada');
    });
  }

  QueryBuilder<SesiModel, SesiModel, QDistinct> distinctByIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idAkun');
    });
  }

  QueryBuilder<SesiModel, SesiModel, QDistinct> distinctByKeluarPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keluarPada');
    });
  }

  QueryBuilder<SesiModel, SesiModel, QDistinct> distinctByMasukTerakhirPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'masukTerakhirPada');
    });
  }

  QueryBuilder<SesiModel, SesiModel, QDistinct> distinctBySedangMasuk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sedangMasuk');
    });
  }

  QueryBuilder<SesiModel, SesiModel, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<SesiModel, SesiModel, QDistinct> distinctByTerakhirAktifPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'terakhirAktifPada');
    });
  }

  QueryBuilder<SesiModel, SesiModel, QDistinct> distinctByTokenAkses(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenAkses', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QDistinct> distinctByTokenAksesAkhir() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenAksesAkhir');
    });
  }

  QueryBuilder<SesiModel, SesiModel, QDistinct> distinctByTokenPemulihan(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenPemulihan',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SesiModel, SesiModel, QDistinct>
      distinctByTokenPemulihanAkhir() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tokenPemulihanAkhir');
    });
  }
}

extension SesiModelQueryProperty
    on QueryBuilder<SesiModel, SesiModel, QQueryProperty> {
  QueryBuilder<SesiModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SesiModel, DateTime, QQueryOperations> diPerbaruiPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diPerbaruiPada');
    });
  }

  QueryBuilder<SesiModel, DateTime, QQueryOperations> dibuatPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dibuatPada');
    });
  }

  QueryBuilder<SesiModel, int, QQueryOperations> idAkunProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAkun');
    });
  }

  QueryBuilder<SesiModel, DateTime?, QQueryOperations> keluarPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keluarPada');
    });
  }

  QueryBuilder<SesiModel, DateTime?, QQueryOperations>
      masukTerakhirPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'masukTerakhirPada');
    });
  }

  QueryBuilder<SesiModel, bool, QQueryOperations> sedangMasukProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sedangMasuk');
    });
  }

  QueryBuilder<SesiModel, StatusSesi, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<SesiModel, DateTime, QQueryOperations>
      terakhirAktifPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'terakhirAktifPada');
    });
  }

  QueryBuilder<SesiModel, String?, QQueryOperations> tokenAksesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenAkses');
    });
  }

  QueryBuilder<SesiModel, DateTime?, QQueryOperations>
      tokenAksesAkhirProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenAksesAkhir');
    });
  }

  QueryBuilder<SesiModel, String?, QQueryOperations> tokenPemulihanProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenPemulihan');
    });
  }

  QueryBuilder<SesiModel, DateTime?, QQueryOperations>
      tokenPemulihanAkhirProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tokenPemulihanAkhir');
    });
  }
}
