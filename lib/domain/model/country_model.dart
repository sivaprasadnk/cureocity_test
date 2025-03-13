import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.freezed.dart';

@Freezed()
abstract class CountryModel with _$CountryModel {
  const factory CountryModel({
    required String code,
    required String emoji,
    required String name,
  }) = _CountryModel;
}
