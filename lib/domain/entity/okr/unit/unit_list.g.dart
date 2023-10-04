// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UnitList _$$_UnitListFromJson(Map<String, dynamic> json) => _$_UnitList(
      unitList: (json['unitList'] as List<dynamic>?)
          ?.map((e) => Unit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UnitListToJson(_$_UnitList instance) =>
    <String, dynamic>{
      'unitList': instance.unitList,
    };
