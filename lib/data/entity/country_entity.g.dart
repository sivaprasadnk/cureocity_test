// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryEntity _$CountryEntityFromJson(Map<String, dynamic> json) =>
    CountryEntity(
      code: json['code'] as String,
      emoji: json['emoji'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CountryEntityToJson(CountryEntity instance) =>
    <String, dynamic>{
      'code': instance.code,
      'emoji': instance.emoji,
      'name': instance.name,
    };
