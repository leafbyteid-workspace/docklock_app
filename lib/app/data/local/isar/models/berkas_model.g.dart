// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berkas_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBerkasModelCollection on Isar {
  IsarCollection<BerkasModel> get berkasModels => this.collection();
}

const BerkasModelSchema = CollectionSchema(
  name: r'BerkasModel',
  id: 2061523422204050597,
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
    r'ekstensiBerkas': PropertySchema(
      id: 3,
      name: r'ekstensiBerkas',
      type: IsarType.string,
    ),
    r'idPengguna': PropertySchema(
      id: 4,
      name: r'idPengguna',
      type: IsarType.long,
    ),
    r'kodeUnik': PropertySchema(
      id: 5,
      name: r'kodeUnik',
      type: IsarType.string,
    ),
    r'lokasiBerkas': PropertySchema(
      id: 6,
      name: r'lokasiBerkas',
      type: IsarType.string,
    ),
    r'namaBerkasAsli': PropertySchema(
      id: 7,
      name: r'namaBerkasAsli',
      type: IsarType.string,
    ),
    r'namaBerkasEnkripsi': PropertySchema(
      id: 8,
      name: r'namaBerkasEnkripsi',
      type: IsarType.string,
    ),
    r'statusBerkas': PropertySchema(
      id: 9,
      name: r'statusBerkas',
      type: IsarType.byte,
      enumMap: _BerkasModelstatusBerkasEnumValueMap,
    ),
    r'ukuranBerkas': PropertySchema(
      id: 10,
      name: r'ukuranBerkas',
      type: IsarType.long,
    ),
    r'waktuTerbuka': PropertySchema(
      id: 11,
      name: r'waktuTerbuka',
      type: IsarType.dateTime,
    ),
    r'waktuTerkunci': PropertySchema(
      id: 12,
      name: r'waktuTerkunci',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _berkasModelEstimateSize,
  serialize: _berkasModelSerialize,
  deserialize: _berkasModelDeserialize,
  deserializeProp: _berkasModelDeserializeProp,
  idName: r'id',
  indexes: {
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
    ),
    r'kodeUnik': IndexSchema(
      id: -9156412923431130314,
      name: r'kodeUnik',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'kodeUnik',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _berkasModelGetId,
  getLinks: _berkasModelGetLinks,
  attach: _berkasModelAttach,
  version: '3.1.0+1',
);

int _berkasModelEstimateSize(
  BerkasModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.ekstensiBerkas.length * 3;
  bytesCount += 3 + object.kodeUnik.length * 3;
  bytesCount += 3 + object.lokasiBerkas.length * 3;
  bytesCount += 3 + object.namaBerkasAsli.length * 3;
  bytesCount += 3 + object.namaBerkasEnkripsi.length * 3;
  return bytesCount;
}

void _berkasModelSerialize(
  BerkasModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.dibuatPada);
  writer.writeDateTime(offsets[1], object.dihapusPada);
  writer.writeDateTime(offsets[2], object.diperbaruiPada);
  writer.writeString(offsets[3], object.ekstensiBerkas);
  writer.writeLong(offsets[4], object.idPengguna);
  writer.writeString(offsets[5], object.kodeUnik);
  writer.writeString(offsets[6], object.lokasiBerkas);
  writer.writeString(offsets[7], object.namaBerkasAsli);
  writer.writeString(offsets[8], object.namaBerkasEnkripsi);
  writer.writeByte(offsets[9], object.statusBerkas.index);
  writer.writeLong(offsets[10], object.ukuranBerkas);
  writer.writeDateTime(offsets[11], object.waktuTerbuka);
  writer.writeDateTime(offsets[12], object.waktuTerkunci);
}

BerkasModel _berkasModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BerkasModel();
  object.dibuatPada = reader.readDateTime(offsets[0]);
  object.dihapusPada = reader.readDateTimeOrNull(offsets[1]);
  object.diperbaruiPada = reader.readDateTime(offsets[2]);
  object.ekstensiBerkas = reader.readString(offsets[3]);
  object.id = id;
  object.idPengguna = reader.readLong(offsets[4]);
  object.kodeUnik = reader.readString(offsets[5]);
  object.lokasiBerkas = reader.readString(offsets[6]);
  object.namaBerkasAsli = reader.readString(offsets[7]);
  object.namaBerkasEnkripsi = reader.readString(offsets[8]);
  object.statusBerkas =
      _BerkasModelstatusBerkasValueEnumMap[reader.readByteOrNull(offsets[9])] ??
          StatusBerkas.terkunci;
  object.ukuranBerkas = reader.readLong(offsets[10]);
  object.waktuTerbuka = reader.readDateTimeOrNull(offsets[11]);
  object.waktuTerkunci = reader.readDateTimeOrNull(offsets[12]);
  return object;
}

P _berkasModelDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (_BerkasModelstatusBerkasValueEnumMap[
              reader.readByteOrNull(offset)] ??
          StatusBerkas.terkunci) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BerkasModelstatusBerkasEnumValueMap = {
  'terkunci': 0,
  'terbuka': 1,
};
const _BerkasModelstatusBerkasValueEnumMap = {
  0: StatusBerkas.terkunci,
  1: StatusBerkas.terbuka,
};

Id _berkasModelGetId(BerkasModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _berkasModelGetLinks(BerkasModel object) {
  return [];
}

void _berkasModelAttach(
    IsarCollection<dynamic> col, Id id, BerkasModel object) {
  object.id = id;
}

extension BerkasModelByIndex on IsarCollection<BerkasModel> {
  Future<BerkasModel?> getByKodeUnik(String kodeUnik) {
    return getByIndex(r'kodeUnik', [kodeUnik]);
  }

  BerkasModel? getByKodeUnikSync(String kodeUnik) {
    return getByIndexSync(r'kodeUnik', [kodeUnik]);
  }

  Future<bool> deleteByKodeUnik(String kodeUnik) {
    return deleteByIndex(r'kodeUnik', [kodeUnik]);
  }

  bool deleteByKodeUnikSync(String kodeUnik) {
    return deleteByIndexSync(r'kodeUnik', [kodeUnik]);
  }

  Future<List<BerkasModel?>> getAllByKodeUnik(List<String> kodeUnikValues) {
    final values = kodeUnikValues.map((e) => [e]).toList();
    return getAllByIndex(r'kodeUnik', values);
  }

  List<BerkasModel?> getAllByKodeUnikSync(List<String> kodeUnikValues) {
    final values = kodeUnikValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'kodeUnik', values);
  }

  Future<int> deleteAllByKodeUnik(List<String> kodeUnikValues) {
    final values = kodeUnikValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'kodeUnik', values);
  }

  int deleteAllByKodeUnikSync(List<String> kodeUnikValues) {
    final values = kodeUnikValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'kodeUnik', values);
  }

  Future<Id> putByKodeUnik(BerkasModel object) {
    return putByIndex(r'kodeUnik', object);
  }

  Id putByKodeUnikSync(BerkasModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'kodeUnik', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByKodeUnik(List<BerkasModel> objects) {
    return putAllByIndex(r'kodeUnik', objects);
  }

  List<Id> putAllByKodeUnikSync(List<BerkasModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'kodeUnik', objects, saveLinks: saveLinks);
  }
}

extension BerkasModelQueryWhereSort
    on QueryBuilder<BerkasModel, BerkasModel, QWhere> {
  QueryBuilder<BerkasModel, BerkasModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhere> anyIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idPengguna'),
      );
    });
  }
}

extension BerkasModelQueryWhere
    on QueryBuilder<BerkasModel, BerkasModel, QWhereClause> {
  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause> idPenggunaEqualTo(
      int idPengguna) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idPengguna',
        value: [idPengguna],
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause> idPenggunaLessThan(
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause> idPenggunaBetween(
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause> kodeUnikEqualTo(
      String kodeUnik) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'kodeUnik',
        value: [kodeUnik],
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterWhereClause> kodeUnikNotEqualTo(
      String kodeUnik) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kodeUnik',
              lower: [],
              upper: [kodeUnik],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kodeUnik',
              lower: [kodeUnik],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kodeUnik',
              lower: [kodeUnik],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'kodeUnik',
              lower: [],
              upper: [kodeUnik],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BerkasModelQueryFilter
    on QueryBuilder<BerkasModel, BerkasModel, QFilterCondition> {
  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      dibuatPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dibuatPada',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      dihapusPadaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dihapusPada',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      dihapusPadaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dihapusPada',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      dihapusPadaEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dihapusPada',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      diperbaruiPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diperbaruiPada',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ekstensiBerkasEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ekstensiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ekstensiBerkasGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ekstensiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ekstensiBerkasLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ekstensiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ekstensiBerkasBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ekstensiBerkas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ekstensiBerkasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ekstensiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ekstensiBerkasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ekstensiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ekstensiBerkasContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ekstensiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ekstensiBerkasMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ekstensiBerkas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ekstensiBerkasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ekstensiBerkas',
        value: '',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ekstensiBerkasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ekstensiBerkas',
        value: '',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      idPenggunaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idPengguna',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
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

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition> kodeUnikEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kodeUnik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      kodeUnikGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'kodeUnik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      kodeUnikLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'kodeUnik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition> kodeUnikBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'kodeUnik',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      kodeUnikStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'kodeUnik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      kodeUnikEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'kodeUnik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      kodeUnikContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'kodeUnik',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition> kodeUnikMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'kodeUnik',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      kodeUnikIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'kodeUnik',
        value: '',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      kodeUnikIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'kodeUnik',
        value: '',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      lokasiBerkasEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lokasiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      lokasiBerkasGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lokasiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      lokasiBerkasLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lokasiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      lokasiBerkasBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lokasiBerkas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      lokasiBerkasStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lokasiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      lokasiBerkasEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lokasiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      lokasiBerkasContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lokasiBerkas',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      lokasiBerkasMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lokasiBerkas',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      lokasiBerkasIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lokasiBerkas',
        value: '',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      lokasiBerkasIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lokasiBerkas',
        value: '',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasAsliEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaBerkasAsli',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasAsliGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namaBerkasAsli',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasAsliLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namaBerkasAsli',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasAsliBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namaBerkasAsli',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasAsliStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namaBerkasAsli',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasAsliEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namaBerkasAsli',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasAsliContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namaBerkasAsli',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasAsliMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namaBerkasAsli',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasAsliIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaBerkasAsli',
        value: '',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasAsliIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namaBerkasAsli',
        value: '',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasEnkripsiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaBerkasEnkripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasEnkripsiGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namaBerkasEnkripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasEnkripsiLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namaBerkasEnkripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasEnkripsiBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namaBerkasEnkripsi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasEnkripsiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namaBerkasEnkripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasEnkripsiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namaBerkasEnkripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasEnkripsiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namaBerkasEnkripsi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasEnkripsiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namaBerkasEnkripsi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasEnkripsiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namaBerkasEnkripsi',
        value: '',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      namaBerkasEnkripsiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namaBerkasEnkripsi',
        value: '',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      statusBerkasEqualTo(StatusBerkas value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      statusBerkasGreaterThan(
    StatusBerkas value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      statusBerkasLessThan(
    StatusBerkas value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      statusBerkasBetween(
    StatusBerkas lower,
    StatusBerkas upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusBerkas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ukuranBerkasEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ukuranBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ukuranBerkasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ukuranBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ukuranBerkasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ukuranBerkas',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      ukuranBerkasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ukuranBerkas',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerbukaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'waktuTerbuka',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerbukaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'waktuTerbuka',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerbukaEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waktuTerbuka',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerbukaGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waktuTerbuka',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerbukaLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waktuTerbuka',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerbukaBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waktuTerbuka',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerkunciIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'waktuTerkunci',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerkunciIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'waktuTerkunci',
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerkunciEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waktuTerkunci',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerkunciGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waktuTerkunci',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerkunciLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waktuTerkunci',
        value: value,
      ));
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterFilterCondition>
      waktuTerkunciBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waktuTerkunci',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BerkasModelQueryObject
    on QueryBuilder<BerkasModel, BerkasModel, QFilterCondition> {}

extension BerkasModelQueryLinks
    on QueryBuilder<BerkasModel, BerkasModel, QFilterCondition> {}

extension BerkasModelQuerySortBy
    on QueryBuilder<BerkasModel, BerkasModel, QSortBy> {
  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByDihapusPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      sortByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByEkstensiBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ekstensiBerkas', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      sortByEkstensiBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ekstensiBerkas', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByIdPenggunaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByKodeUnik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kodeUnik', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByKodeUnikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kodeUnik', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByLokasiBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lokasiBerkas', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      sortByLokasiBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lokasiBerkas', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByNamaBerkasAsli() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaBerkasAsli', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      sortByNamaBerkasAsliDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaBerkasAsli', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      sortByNamaBerkasEnkripsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaBerkasEnkripsi', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      sortByNamaBerkasEnkripsiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaBerkasEnkripsi', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByStatusBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusBerkas', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      sortByStatusBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusBerkas', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByUkuranBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ukuranBerkas', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      sortByUkuranBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ukuranBerkas', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByWaktuTerbuka() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waktuTerbuka', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      sortByWaktuTerbukaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waktuTerbuka', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> sortByWaktuTerkunci() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waktuTerkunci', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      sortByWaktuTerkunciDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waktuTerkunci', Sort.desc);
    });
  }
}

extension BerkasModelQuerySortThenBy
    on QueryBuilder<BerkasModel, BerkasModel, QSortThenBy> {
  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByDihapusPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      thenByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByEkstensiBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ekstensiBerkas', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      thenByEkstensiBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ekstensiBerkas', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByIdPenggunaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idPengguna', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByKodeUnik() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kodeUnik', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByKodeUnikDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'kodeUnik', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByLokasiBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lokasiBerkas', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      thenByLokasiBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lokasiBerkas', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByNamaBerkasAsli() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaBerkasAsli', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      thenByNamaBerkasAsliDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaBerkasAsli', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      thenByNamaBerkasEnkripsi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaBerkasEnkripsi', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      thenByNamaBerkasEnkripsiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namaBerkasEnkripsi', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByStatusBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusBerkas', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      thenByStatusBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusBerkas', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByUkuranBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ukuranBerkas', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      thenByUkuranBerkasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ukuranBerkas', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByWaktuTerbuka() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waktuTerbuka', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      thenByWaktuTerbukaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waktuTerbuka', Sort.desc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy> thenByWaktuTerkunci() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waktuTerkunci', Sort.asc);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QAfterSortBy>
      thenByWaktuTerkunciDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waktuTerkunci', Sort.desc);
    });
  }
}

extension BerkasModelQueryWhereDistinct
    on QueryBuilder<BerkasModel, BerkasModel, QDistinct> {
  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dibuatPada');
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dihapusPada');
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diperbaruiPada');
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByEkstensiBerkas(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ekstensiBerkas',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByIdPengguna() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idPengguna');
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByKodeUnik(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'kodeUnik', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByLokasiBerkas(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lokasiBerkas', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByNamaBerkasAsli(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namaBerkasAsli',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct>
      distinctByNamaBerkasEnkripsi({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namaBerkasEnkripsi',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByStatusBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusBerkas');
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByUkuranBerkas() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ukuranBerkas');
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByWaktuTerbuka() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waktuTerbuka');
    });
  }

  QueryBuilder<BerkasModel, BerkasModel, QDistinct> distinctByWaktuTerkunci() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waktuTerkunci');
    });
  }
}

extension BerkasModelQueryProperty
    on QueryBuilder<BerkasModel, BerkasModel, QQueryProperty> {
  QueryBuilder<BerkasModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BerkasModel, DateTime, QQueryOperations> dibuatPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dibuatPada');
    });
  }

  QueryBuilder<BerkasModel, DateTime?, QQueryOperations> dihapusPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dihapusPada');
    });
  }

  QueryBuilder<BerkasModel, DateTime, QQueryOperations>
      diperbaruiPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diperbaruiPada');
    });
  }

  QueryBuilder<BerkasModel, String, QQueryOperations> ekstensiBerkasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ekstensiBerkas');
    });
  }

  QueryBuilder<BerkasModel, int, QQueryOperations> idPenggunaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idPengguna');
    });
  }

  QueryBuilder<BerkasModel, String, QQueryOperations> kodeUnikProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'kodeUnik');
    });
  }

  QueryBuilder<BerkasModel, String, QQueryOperations> lokasiBerkasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lokasiBerkas');
    });
  }

  QueryBuilder<BerkasModel, String, QQueryOperations> namaBerkasAsliProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namaBerkasAsli');
    });
  }

  QueryBuilder<BerkasModel, String, QQueryOperations>
      namaBerkasEnkripsiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namaBerkasEnkripsi');
    });
  }

  QueryBuilder<BerkasModel, StatusBerkas, QQueryOperations>
      statusBerkasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusBerkas');
    });
  }

  QueryBuilder<BerkasModel, int, QQueryOperations> ukuranBerkasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ukuranBerkas');
    });
  }

  QueryBuilder<BerkasModel, DateTime?, QQueryOperations>
      waktuTerbukaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waktuTerbuka');
    });
  }

  QueryBuilder<BerkasModel, DateTime?, QQueryOperations>
      waktuTerkunciProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waktuTerkunci');
    });
  }
}
