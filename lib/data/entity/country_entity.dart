import 'package:country_app/domain/model/country_model.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_entity.g.dart';

@JsonSerializable()
class CountryEntity extends HiveObject {
  final String code;
  final String emoji;
  final String name;

  CountryEntity({required this.code, required this.emoji, required this.name});

  // ✅ JSON serialization methods
  factory CountryEntity.fromJson(Map<String, dynamic> json) =>
      _$CountryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CountryEntityToJson(this);

  // ✅ Convert to Freezed Model
  CountryModel toModel() => CountryModel(code: code, emoji: emoji, name: name);

  // ✅ Convert from Freezed Model
  factory CountryEntity.fromModel(CountryModel model) {
    return CountryEntity(
      code: model.code,
      emoji: model.emoji,
      name: model.name,
    );
  }
}
