// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riwayat_berkas_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRiwayatBerkasModelCollection on Isar {
  IsarCollection<RiwayatBerkasModel> get riwayatBerkasModels =>
      this.collection();
}

const RiwayatBerkasModelSchema = CollectionSchema(
  name: r'RiwayatBerkasModel',
  id: 901033151380610056,
  properties: {
    r'dibuatPada': PropertySchema(
      id: 0,
      name: r'dibuatPada',
      type: IsarType.dateTime,
    ),
    r'diperbaruiPada': PropertySchema(
      id: 1,
      name: r'diperbaruiPada',
      type: IsarType.dateTime,
    ),
    r'idBerkas': PropertySchema(
      id: 2,
      name: r'idBerkas',
      type: IsarType.long,
    ),
    r'idPengguna': PropertySchema(
      id: 3,
      name: r'idPengguna',
      type: IsarType.long,
    ),
    r'judul': PropertySchema(
      id: 4,
      name: r'judul',
      type: IsarType.string,
    ),
    r'keterangan': PropertySchema(
      id: 5,
      name: r'keterangan',
      type: IsarType.string,
    ),
    r'statusRiwayatBerkas': PropertySchema(
      id: 6,
      name: r'statusRiwayatBerkas',
      type: IsarType.byte,
      enumMap: _RiwayatBerkasModelstatusRiwayatBerkasEnumValueMap,
    )
  },
  estimateSize: _riwayatBerkasModelEstimateSize,
  serialize: _riwayatBerkasModelSerialize,
  deserialize: _riwayatBerkasModelDeserialize,
  deserializeProp: _riwayatBerkasModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'idBerkas': IndexSchema(
      id: 8832393020762395072,
      name: r'idBerkas',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idBerkas',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'idPengguna': IndexSchema(
      id: -1092966039149577079,
      name: r'idPengguna',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'idPengguna',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _riwayatBerkasModelGetId,
  getLinks: _riwayatBerkasModelGetLinks,
  attach: _riwayatBerkasModelAttach,
  version: '3.1.0+1',
);

int _riwayatBerkasModelEstimateSize(
  RiwayatBerkasModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.judul.length * 3;
  bytesCount += 3 + object.keterangan.length * 3;
  return bytesCount;
}

void _riwayatBerkasModelSerialize(
  RiwayatBerkasModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dibuatPada);
  writer.writeDateTime(offsets[1], object.diperbaruiPada);
  writer.writeLong(offsets[2], object.idBerkas);
  writer.writeLong(offsets[3], object.idPengguna);
  writer.writeString(offsets[4], object.judul);
  writer.writeString(offsets[5], object.keterangan);
  writer.writeByte(offsets[6], object.statusRiwayatBerkas.index);
}

RiwayatBerkasModel _riwayatBerkasModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RiwayatBerkasModel();
  object.dibuatPada = reader.readDateTime(offsets[0]);
  object.diperbaruiPada = reader.readDateTime(offsets[1]);
  object.id = id;
  object.idBerkas = reader.readLong(offsets[2]);
  object.idPengguna = reader.readLong(offsets[3]);
  object.judul = reader.readString(offsets[4]);
  object.keterangan = reader.readString(offsets[5]);
  object.statusRiwayatBerkas =
      _RiwayatBerkasModelstatusRiwayatBerkasValueEnumMap[
              reader.readByteOrNull(offsets[6])] ??
          StatusRiwayatBerkas.terkunci;
  return object;
}

P _riwayatBerkasModelDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (_RiwayatBerkasModelstatusRiwayatBerkasValueEnumMap[
              reader.readByteOrNull(offset)] ??
          StatusRiwayatBerkas.terkunci) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RiwayatBerkasModelstatusRiwayatBerkasEnumValueMap = {
  'terkunci': 0,
  'terbuka': 1,
};
const _RiwayatBerkasModelstatusRiwayatBerkasValueEnumMap = {
  0: StatusRiwayatBerkas.terkunci,
  1: StatusRiwayatBerkas.terbuka,
};

Id _riwayatBerkasModelGetId(RiwayatBerkasModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _riwayatBerkasModelGetLinks(
    RiwayatBerkasModel object) {
  return [];
}

void _riwayatBerkasModelAttach(
    IsarCollection<dynamic> col, Id id, RiwayatBerkasModel object) {
  object.id = id;
}

extension RiwayatBerkasModelQueryWhereSort
    on QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QWhere> {
  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhere>
      anyIdBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idBerkas'),
      );
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhere>
      anyIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idPengguna'),
      );
    });
  }
}

extension RiwayatBerkasModelQueryWhere
    on QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QWhereClause> {
  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idBerkasEqualTo(int idBerkas) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idBerkas',
        value: [idBerkas],
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idBerkasNotEqualTo(int idBerkas) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBerkas',
              lower: [],
              upper: [idBerkas],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBerkas',
              lower: [idBerkas],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBerkas',
              lower: [idBerkas],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'idBerkas',
              lower: [],
              upper: [idBerkas],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idBerkasGreaterThan(
    int idBerkas, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idBerkas',
        lower: [idBerkas],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idBerkasLessThan(
    int idBerkas, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idBerkas',
        lower: [],
        upper: [idBerkas],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idBerkasBetween(
    int lowerIdBerkas,
    int upperIdBerkas, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'idBerkas',
        lower: [lowerIdBerkas],
        includeLower: includeLower,
        upper: [upperIdBerkas],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idPenggunaEqualTo(int idPengguna) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idPengguna',
        value: [idPengguna],
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idPenggunaNotEqualTo(int idPengguna) {
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idPenggunaGreaterThan(
    int idPengguna, {
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idPenggunaLessThan(
    int idPengguna, {
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterWhereClause>
      idPenggunaBetween(
    int lowerIdPengguna,
    int upperIdPengguna, {
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
}

extension RiwayatBerkasModelQueryFilter
    on QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QFilterCondition> {
  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      dibuatPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dibuatPada',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      diperbaruiPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diperbaruiPada',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      idBerkasEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      idBerkasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'idBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      idBerkasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'idBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      idBerkasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'idBerkas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      idPenggunaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idPengguna',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      idPenggunaGreaterThan(
    int value, {
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      idPenggunaLessThan(
    int value, {
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      idPenggunaBetween(
    int lower,
    int upper, {
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

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      judulEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'judul',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      judulGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'judul',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      judulLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'judul',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      judulBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'judul',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      judulStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'judul',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      judulEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'judul',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      judulContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'judul',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      judulMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'judul',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      judulIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'judul',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      judulIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'judul',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      keteranganEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      keteranganGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      keteranganLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      keteranganBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'keterangan',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      keteranganStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      keteranganEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      keteranganContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'keterangan',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      keteranganMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'keterangan',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      keteranganIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keterangan',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      keteranganIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'keterangan',
        value: '',
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      statusRiwayatBerkasEqualTo(StatusRiwayatBerkas value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusRiwayatBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      statusRiwayatBerkasGreaterThan(
    StatusRiwayatBerkas value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusRiwayatBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      statusRiwayatBerkasLessThan(
    StatusRiwayatBerkas value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusRiwayatBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterFilterCondition>
      statusRiwayatBerkasBetween(
    StatusRiwayatBerkas lower,
    StatusRiwayatBerkas upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusRiwayatBerkas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RiwayatBerkasModelQueryObject
    on QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QFilterCondition> {}

extension RiwayatBerkasModelQueryLinks
    on QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QFilterCondition> {}

extension RiwayatBerkasModelQuerySortBy
    on QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QSortBy> {
  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByIdBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBerkas', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByIdBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBerkas', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByIdPenggunaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByJudul() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'judul', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByJudulDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'judul', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByKeterangan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByKeteranganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByStatusRiwayatBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusRiwayatBerkas', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      sortByStatusRiwayatBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusRiwayatBerkas', Sort.desc);
    });
  }
}

extension RiwayatBerkasModelQuerySortThenBy
    on QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QSortThenBy> {
  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByIdBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBerkas', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByIdBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idBerkas', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByIdPenggunaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByJudul() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'judul', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByJudulDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'judul', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByKeterangan() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByKeteranganDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keterangan', Sort.desc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByStatusRiwayatBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusRiwayatBerkas', Sort.asc);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QAfterSortBy>
      thenByStatusRiwayatBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusRiwayatBerkas', Sort.desc);
    });
  }
}

extension RiwayatBerkasModelQueryWhereDistinct
    on QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QDistinct> {
  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QDistinct>
      distinctByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dibuatPada');
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QDistinct>
      distinctByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diperbaruiPada');
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QDistinct>
      distinctByIdBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idBerkas');
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QDistinct>
      distinctByIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idPengguna');
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QDistinct>
      distinctByJudul({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'judul', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QDistinct>
      distinctByKeterangan({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keterangan', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QDistinct>
      distinctByStatusRiwayatBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusRiwayatBerkas');
    });
  }
}

extension RiwayatBerkasModelQueryProperty
    on QueryBuilder<RiwayatBerkasModel, RiwayatBerkasModel, QQueryProperty> {
  QueryBuilder<RiwayatBerkasModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RiwayatBerkasModel, DateTime, QQueryOperations>
      dibuatPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dibuatPada');
    });
  }

  QueryBuilder<RiwayatBerkasModel, DateTime, QQueryOperations>
      diperbaruiPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diperbaruiPada');
    });
  }

  QueryBuilder<RiwayatBerkasModel, int, QQueryOperations> idBerkasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idBerkas');
    });
  }

  QueryBuilder<RiwayatBerkasModel, int, QQueryOperations> idPenggunaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idPengguna');
    });
  }

  QueryBuilder<RiwayatBerkasModel, String, QQueryOperations> judulProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'judul');
    });
  }

  QueryBuilder<RiwayatBerkasModel, String, QQueryOperations>
      keteranganProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keterangan');
    });
  }

  QueryBuilder<RiwayatBerkasModel, StatusRiwayatBerkas, QQueryOperations>
      statusRiwayatBerkasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusRiwayatBerkas');
    });
  }
}
