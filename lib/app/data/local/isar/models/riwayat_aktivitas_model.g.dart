// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_aktivitas_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRiwayatAktivitasModelCollection on Isar {
  IsarCollection<RiwayatAktivitasModel> get riwayatAktivitasModels =>
      this.collection();
}

const RiwayatAktivitasModelSchema = CollectionSchema(
  name: r'RiwayatAktivitasModel',
  id: -4176313533274328805,
  properties: {
    r'alamatIp': PropertySchema(
      id: 0,
      name: r'alamatIp',
      type: IsarType.string,
    ),
    r'deskripsi': PropertySchema(
      id: 1,
      name: r'deskripsi',
      type: IsarType.string,
    ),
    r'dibuatPada': PropertySchema(
      id: 2,
      name: r'dibuatPada',
      type: IsarType.dateTime,
    ),
    r'idAkun': PropertySchema(
      id: 3,
      name: r'idAkun',
      type: IsarType.long,
    ),
    r'judulAktivitas': PropertySchema(
      id: 4,
      name: r'judulAktivitas',
      type: IsarType.string,
    ),
    r'namaPerangkat': PropertySchema(
      id: 5,
      name: r'namaPerangkat',
      type: IsarType.string,
    ),
    r'statusAktivitas': PropertySchema(
      id: 6,
      name: r'statusAktivitas',
      type: IsarType.byte,
      enumMap: _RiwayatAktivitasModelstatusAktivitasEnumValueMap,
    )
  },
  estimateSize: _riwayatAktivitasModelEstimateSize,
  serialize: _riwayatAktivitasModelSerialize,
  deserialize: _riwayatAktivitasModelDeserialize,
  deserializeProp: _riwayatAktivitasModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'idAkun': IndexSchema(
      id: 1854728754135717249,
      name: r'idAkun',
      unique: false,
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
  getId: _riwayatAktivitasModelGetId,
  getLinks: _riwayatAktivitasModelGetLinks,
  attach: _riwayatAktivitasModelAttach,
  version: '3.1.0+1',
);

int _riwayatAktivitasModelEstimateSize(
  RiwayatAktivitasModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.alamatIp.length * 3;
  bytesCount += 3 + object.deskripsi.length * 3;
  bytesCount += 3 + object.judulAktivitas.length * 3;
  bytesCount += 3 + object.namaPerangkat.length * 3;
  return bytesCount;
}

void _riwayatAktivitasModelSerialize(
  RiwayatAktivitasModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.alamatIp);
  writer.writeString(offsets[1], object.deskripsi);
  writer.writeDateTime(offsets[2], object.dibuatPada);
  writer.writeLong(offsets[3], object.idAkun);
  writer.writeString(offsets[4], object.judulAktivitas);
  writer.writeString(offsets[5], object.namaPerangkat);
  writer.writeByte(offsets[6], object.statusAktivitas.index);
}

RiwayatAktivitasModel _riwayatAktivitasModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RiwayatAktivitasModel();
  object.alamatIp = reader.readString(offsets[0]);
  object.deskripsi = reader.readString(offsets[1]);
  object.dibuatPada = reader.readDateTime(offsets[2]);
  object.id = id;
  object.idAkun = reader.readLong(offsets[3]);
  object.judulAktivitas = reader.readString(offsets[4]);
  object.namaPerangkat = reader.readString(offsets[5]);
  object.statusAktivitas = _RiwayatAktivitasModelstatusAktivitasValueEnumMap[
          reader.readByteOrNull(offsets[6])] ??
      StatusAktivitas.berhasil;
  return object;
}

P _riwayatAktivitasModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (_RiwayatAktivitasModelstatusAktivitasValueEnumMap[
              reader.readByteOrNull(offset)] ??
          StatusAktivitas.berhasil) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RiwayatAktivitasModelstatusAktivitasEnumValueMap = {
  'berhasil': 0,
  'gagal': 1,
};
const _RiwayatAktivitasModelstatusAktivitasValueEnumMap = {
  0: StatusAktivitas.berhasil,
  1: StatusAktivitas.gagal,
};

Id _riwayatAktivitasModelGetId(RiwayatAktivitasModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _riwayatAktivitasModelGetLinks(
    RiwayatAktivitasModel object) {
  return [];
}

void _riwayatAktivitasModelAttach(
    IsarCollection<dynamic> col, Id id, RiwayatAktivitasModel object) {
  object.id = id;
}

extension RiwayatAktivitasModelQueryWhereSort
    on QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QWhere> {
  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhere>
      anyIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idAkun'),
      );
    });
  }
}

extension RiwayatAktivitasModelQueryWhere on QueryBuilder<RiwayatAktivitasModel,
    RiwayatAktivitasModel, QWhereClause> {
  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhereClause>
      idAkunEqualTo(int idAkun) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idAkun',
        value: [idAkun],
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhereClause>
      idAkunNotEqualTo(int idAkun) {
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhereClause>
      idAkunGreaterThan(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhereClause>
      idAkunLessThan(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterWhereClause>
      idAkunBetween(
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

extension RiwayatAktivitasModelQueryFilter on QueryBuilder<
    RiwayatAktivitasModel, RiwayatAktivitasModel, QFilterCondition> {
  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> alamatIpEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alamatIp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> alamatIpGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alamatIp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> alamatIpLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alamatIp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> alamatIpBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alamatIp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> alamatIpStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alamatIp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> alamatIpEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alamatIp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
          QAfterFilterCondition>
      alamatIpContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alamatIp',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
          QAfterFilterCondition>
      alamatIpMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alamatIp',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> alamatIpIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alamatIp',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> alamatIpIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alamatIp',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> deskripsiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deskripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> deskripsiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deskripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> deskripsiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deskripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> deskripsiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deskripsi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> deskripsiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deskripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> deskripsiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deskripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
          QAfterFilterCondition>
      deskripsiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deskripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
          QAfterFilterCondition>
      deskripsiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deskripsi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> deskripsiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deskripsi',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> deskripsiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deskripsi',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> dibuatPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dibuatPada',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> dibuatPadaGreaterThan(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> dibuatPadaLessThan(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> dibuatPadaBetween(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> idAkunEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAkun',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> idAkunGreaterThan(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> idAkunLessThan(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> idAkunBetween(
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

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> judulAktivitasEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'judulAktivitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> judulAktivitasGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'judulAktivitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> judulAktivitasLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'judulAktivitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> judulAktivitasBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'judulAktivitas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> judulAktivitasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'judulAktivitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> judulAktivitasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'judulAktivitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
          QAfterFilterCondition>
      judulAktivitasContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'judulAktivitas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
          QAfterFilterCondition>
      judulAktivitasMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'judulAktivitas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> judulAktivitasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'judulAktivitas',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> judulAktivitasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'judulAktivitas',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> namaPerangkatEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaPerangkat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> namaPerangkatGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namaPerangkat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> namaPerangkatLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namaPerangkat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> namaPerangkatBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namaPerangkat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> namaPerangkatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namaPerangkat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> namaPerangkatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namaPerangkat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
          QAfterFilterCondition>
      namaPerangkatContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namaPerangkat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
          QAfterFilterCondition>
      namaPerangkatMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namaPerangkat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> namaPerangkatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaPerangkat',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> namaPerangkatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namaPerangkat',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> statusAktivitasEqualTo(StatusAktivitas value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusAktivitas',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> statusAktivitasGreaterThan(
    StatusAktivitas value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusAktivitas',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> statusAktivitasLessThan(
    StatusAktivitas value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusAktivitas',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel,
      QAfterFilterCondition> statusAktivitasBetween(
    StatusAktivitas lower,
    StatusAktivitas upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusAktivitas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RiwayatAktivitasModelQueryObject on QueryBuilder<
    RiwayatAktivitasModel, RiwayatAktivitasModel, QFilterCondition> {}

extension RiwayatAktivitasModelQueryLinks on QueryBuilder<RiwayatAktivitasModel,
    RiwayatAktivitasModel, QFilterCondition> {}

extension RiwayatAktivitasModelQuerySortBy
    on QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QSortBy> {
  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByAlamatIp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alamatIp', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByAlamatIpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alamatIp', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByDeskripsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deskripsi', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByDeskripsiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deskripsi', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByIdAkunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByJudulAktivitas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'judulAktivitas', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByJudulAktivitasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'judulAktivitas', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByNamaPerangkat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPerangkat', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByNamaPerangkatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPerangkat', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByStatusAktivitas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusAktivitas', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      sortByStatusAktivitasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusAktivitas', Sort.desc);
    });
  }
}

extension RiwayatAktivitasModelQuerySortThenBy
    on QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QSortThenBy> {
  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByAlamatIp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alamatIp', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByAlamatIpDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alamatIp', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByDeskripsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deskripsi', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByDeskripsiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deskripsi', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByIdAkunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByJudulAktivitas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'judulAktivitas', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByJudulAktivitasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'judulAktivitas', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByNamaPerangkat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPerangkat', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByNamaPerangkatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaPerangkat', Sort.desc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByStatusAktivitas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusAktivitas', Sort.asc);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QAfterSortBy>
      thenByStatusAktivitasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusAktivitas', Sort.desc);
    });
  }
}

extension RiwayatAktivitasModelQueryWhereDistinct
    on QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QDistinct> {
  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QDistinct>
      distinctByAlamatIp({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alamatIp', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QDistinct>
      distinctByDeskripsi({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deskripsi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QDistinct>
      distinctByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dibuatPada');
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QDistinct>
      distinctByIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idAkun');
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QDistinct>
      distinctByJudulAktivitas({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'judulAktivitas',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QDistinct>
      distinctByNamaPerangkat({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namaPerangkat',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RiwayatAktivitasModel, RiwayatAktivitasModel, QDistinct>
      distinctByStatusAktivitas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusAktivitas');
    });
  }
}

extension RiwayatAktivitasModelQueryProperty on QueryBuilder<
    RiwayatAktivitasModel, RiwayatAktivitasModel, QQueryProperty> {
  QueryBuilder<RiwayatAktivitasModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RiwayatAktivitasModel, String, QQueryOperations>
      alamatIpProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alamatIp');
    });
  }

  QueryBuilder<RiwayatAktivitasModel, String, QQueryOperations>
      deskripsiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deskripsi');
    });
  }

  QueryBuilder<RiwayatAktivitasModel, DateTime, QQueryOperations>
      dibuatPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dibuatPada');
    });
  }

  QueryBuilder<RiwayatAktivitasModel, int, QQueryOperations> idAkunProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAkun');
    });
  }

  QueryBuilder<RiwayatAktivitasModel, String, QQueryOperations>
      judulAktivitasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'judulAktivitas');
    });
  }

  QueryBuilder<RiwayatAktivitasModel, String, QQueryOperations>
      namaPerangkatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namaPerangkat');
    });
  }

  QueryBuilder<RiwayatAktivitasModel, StatusAktivitas, QQueryOperations>
      statusAktivitasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusAktivitas');
    });
  }
}
