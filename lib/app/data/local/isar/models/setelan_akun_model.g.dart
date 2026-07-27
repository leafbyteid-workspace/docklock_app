// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setelan_akun_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSetelanAkunModelCollection on Isar {
  IsarCollection<SetelanAkunModel> get setelanAkunModels => this.collection();
}

const SetelanAkunModelSchema = CollectionSchema(
  name: r'SetelanAkunModel',
  id: -3874280246886757505,
  properties: {
    r'bahasa': PropertySchema(
      id: 0,
      name: r'bahasa',
      type: IsarType.string,
    ),
    r'dibuatPada': PropertySchema(
      id: 1,
      name: r'dibuatPada',
      type: IsarType.dateTime,
    ),
    r'dihapusPada': PropertySchema(
      id: 2,
      name: r'dihapusPada',
      type: IsarType.dateTime,
    ),
    r'diperbaruiPada': PropertySchema(
      id: 3,
      name: r'diperbaruiPada',
      type: IsarType.dateTime,
    ),
    r'idAkun': PropertySchema(
      id: 4,
      name: r'idAkun',
      type: IsarType.long,
    ),
    r'tema': PropertySchema(
      id: 5,
      name: r'tema',
      type: IsarType.byte,
      enumMap: _SetelanAkunModeltemaEnumValueMap,
    )
  },
  estimateSize: _setelanAkunModelEstimateSize,
  serialize: _setelanAkunModelSerialize,
  deserialize: _setelanAkunModelDeserialize,
  deserializeProp: _setelanAkunModelDeserializeProp,
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
  getId: _setelanAkunModelGetId,
  getLinks: _setelanAkunModelGetLinks,
  attach: _setelanAkunModelAttach,
  version: '3.1.0+1',
);

int _setelanAkunModelEstimateSize(
  SetelanAkunModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bahasa.length * 3;
  return bytesCount;
}

void _setelanAkunModelSerialize(
  SetelanAkunModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bahasa);
  writer.writeDateTime(offsets[1], object.dibuatPada);
  writer.writeDateTime(offsets[2], object.dihapusPada);
  writer.writeDateTime(offsets[3], object.diperbaruiPada);
  writer.writeLong(offsets[4], object.idAkun);
  writer.writeByte(offsets[5], object.tema.index);
}

SetelanAkunModel _setelanAkunModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SetelanAkunModel();
  object.bahasa = reader.readString(offsets[0]);
  object.dibuatPada = reader.readDateTime(offsets[1]);
  object.dihapusPada = reader.readDateTimeOrNull(offsets[2]);
  object.diperbaruiPada = reader.readDateTime(offsets[3]);
  object.id = id;
  object.idAkun = reader.readLong(offsets[4]);
  object.tema =
      _SetelanAkunModeltemaValueEnumMap[reader.readByteOrNull(offsets[5])] ??
          TemaAplikasi.sistem;
  return object;
}

P _setelanAkunModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (_SetelanAkunModeltemaValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TemaAplikasi.sistem) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SetelanAkunModeltemaEnumValueMap = {
  'sistem': 0,
  'terang': 1,
  'gelap': 2,
};
const _SetelanAkunModeltemaValueEnumMap = {
  0: TemaAplikasi.sistem,
  1: TemaAplikasi.terang,
  2: TemaAplikasi.gelap,
};

Id _setelanAkunModelGetId(SetelanAkunModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _setelanAkunModelGetLinks(SetelanAkunModel object) {
  return [];
}

void _setelanAkunModelAttach(
    IsarCollection<dynamic> col, Id id, SetelanAkunModel object) {
  object.id = id;
}

extension SetelanAkunModelByIndex on IsarCollection<SetelanAkunModel> {
  Future<SetelanAkunModel?> getByIdAkun(int idAkun) {
    return getByIndex(r'idAkun', [idAkun]);
  }

  SetelanAkunModel? getByIdAkunSync(int idAkun) {
    return getByIndexSync(r'idAkun', [idAkun]);
  }

  Future<bool> deleteByIdAkun(int idAkun) {
    return deleteByIndex(r'idAkun', [idAkun]);
  }

  bool deleteByIdAkunSync(int idAkun) {
    return deleteByIndexSync(r'idAkun', [idAkun]);
  }

  Future<List<SetelanAkunModel?>> getAllByIdAkun(List<int> idAkunValues) {
    final values = idAkunValues.map((e) => [e]).toList();
    return getAllByIndex(r'idAkun', values);
  }

  List<SetelanAkunModel?> getAllByIdAkunSync(List<int> idAkunValues) {
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

  Future<Id> putByIdAkun(SetelanAkunModel object) {
    return putByIndex(r'idAkun', object);
  }

  Id putByIdAkunSync(SetelanAkunModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'idAkun', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdAkun(List<SetelanAkunModel> objects) {
    return putAllByIndex(r'idAkun', objects);
  }

  List<Id> putAllByIdAkunSync(List<SetelanAkunModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'idAkun', objects, saveLinks: saveLinks);
  }
}

extension SetelanAkunModelQueryWhereSort
    on QueryBuilder<SetelanAkunModel, SetelanAkunModel, QWhere> {
  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhere> anyIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'idAkun'),
      );
    });
  }
}

extension SetelanAkunModelQueryWhere
    on QueryBuilder<SetelanAkunModel, SetelanAkunModel, QWhereClause> {
  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhereClause>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhereClause>
      idAkunEqualTo(int idAkun) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'idAkun',
        value: [idAkun],
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhereClause>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhereClause>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhereClause>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterWhereClause>
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

extension SetelanAkunModelQueryFilter
    on QueryBuilder<SetelanAkunModel, SetelanAkunModel, QFilterCondition> {
  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      bahasaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bahasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      bahasaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bahasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      bahasaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bahasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      bahasaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bahasa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      bahasaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bahasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      bahasaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bahasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      bahasaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bahasa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      bahasaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bahasa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      bahasaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bahasa',
        value: '',
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      bahasaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bahasa',
        value: '',
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      dibuatPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dibuatPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      dihapusPadaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dihapusPada',
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      dihapusPadaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dihapusPada',
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      dihapusPadaEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dihapusPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      diperbaruiPadaEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diperbaruiPada',
        value: value,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      idAkunEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'idAkun',
        value: value,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      idAkunGreaterThan(
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      idAkunLessThan(
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      idAkunBetween(
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

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      temaEqualTo(TemaAplikasi value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tema',
        value: value,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      temaGreaterThan(
    TemaAplikasi value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tema',
        value: value,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      temaLessThan(
    TemaAplikasi value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tema',
        value: value,
      ));
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterFilterCondition>
      temaBetween(
    TemaAplikasi lower,
    TemaAplikasi upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tema',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SetelanAkunModelQueryObject
    on QueryBuilder<SetelanAkunModel, SetelanAkunModel, QFilterCondition> {}

extension SetelanAkunModelQueryLinks
    on QueryBuilder<SetelanAkunModel, SetelanAkunModel, QFilterCondition> {}

extension SetelanAkunModelQuerySortBy
    on QueryBuilder<SetelanAkunModel, SetelanAkunModel, QSortBy> {
  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      sortByBahasa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bahasa', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      sortByBahasaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bahasa', Sort.desc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      sortByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      sortByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      sortByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      sortByDihapusPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.desc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      sortByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      sortByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      sortByIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      sortByIdAkunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.desc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy> sortByTema() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tema', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      sortByTemaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tema', Sort.desc);
    });
  }
}

extension SetelanAkunModelQuerySortThenBy
    on QueryBuilder<SetelanAkunModel, SetelanAkunModel, QSortThenBy> {
  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByBahasa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bahasa', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByBahasaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bahasa', Sort.desc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByDibuatPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dibuatPada', Sort.desc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByDihapusPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dihapusPada', Sort.desc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByDiperbaruiPadaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diperbaruiPada', Sort.desc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByIdAkunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'idAkun', Sort.desc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy> thenByTema() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tema', Sort.asc);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QAfterSortBy>
      thenByTemaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tema', Sort.desc);
    });
  }
}

extension SetelanAkunModelQueryWhereDistinct
    on QueryBuilder<SetelanAkunModel, SetelanAkunModel, QDistinct> {
  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QDistinct> distinctByBahasa(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bahasa', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QDistinct>
      distinctByDibuatPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dibuatPada');
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QDistinct>
      distinctByDihapusPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dihapusPada');
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QDistinct>
      distinctByDiperbaruiPada() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diperbaruiPada');
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QDistinct>
      distinctByIdAkun() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'idAkun');
    });
  }

  QueryBuilder<SetelanAkunModel, SetelanAkunModel, QDistinct> distinctByTema() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tema');
    });
  }
}

extension SetelanAkunModelQueryProperty
    on QueryBuilder<SetelanAkunModel, SetelanAkunModel, QQueryProperty> {
  QueryBuilder<SetelanAkunModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SetelanAkunModel, String, QQueryOperations> bahasaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bahasa');
    });
  }

  QueryBuilder<SetelanAkunModel, DateTime, QQueryOperations>
      dibuatPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dibuatPada');
    });
  }

  QueryBuilder<SetelanAkunModel, DateTime?, QQueryOperations>
      dihapusPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dihapusPada');
    });
  }

  QueryBuilder<SetelanAkunModel, DateTime, QQueryOperations>
      diperbaruiPadaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diperbaruiPada');
    });
  }

  QueryBuilder<SetelanAkunModel, int, QQueryOperations> idAkunProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'idAkun');
    });
  }

  QueryBuilder<SetelanAkunModel, TemaAplikasi, QQueryOperations>
      temaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tema');
    });
  }
}
