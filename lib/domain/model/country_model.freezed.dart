// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CountryModel {

 String get code; String get emoji; String get name;
/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryModelCopyWith<CountryModel> get copyWith => _$CountryModelCopyWithImpl<CountryModel>(this as CountryModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountryModel&&(identical(other.code, code) || other.code == code)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,code,emoji,name);

@override
String toString() {
  return 'CountryModel(code: $code, emoji: $emoji, name: $name)';
}


}

/// @nodoc
abstract mixin class $CountryModelCopyWith<$Res>  {
  factory $CountryModelCopyWith(CountryModel value, $Res Function(CountryModel) _then) = _$CountryModelCopyWithImpl;
@useResult
$Res call({
 String code, String emoji, String name
});




}
/// @nodoc
class _$CountryModelCopyWithImpl<$Res>
    implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._self, this._then);

  final CountryModel _self;
  final $Res Function(CountryModel) _then;

/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? emoji = null,Object? name = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _CountryModel implements CountryModel {
  const _CountryModel({required this.code, required this.emoji, required this.name});
  

@override final  String code;
@override final  String emoji;
@override final  String name;

/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryModelCopyWith<_CountryModel> get copyWith => __$CountryModelCopyWithImpl<_CountryModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountryModel&&(identical(other.code, code) || other.code == code)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,code,emoji,name);

@override
String toString() {
  return 'CountryModel(code: $code, emoji: $emoji, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CountryModelCopyWith<$Res> implements $CountryModelCopyWith<$Res> {
  factory _$CountryModelCopyWith(_CountryModel value, $Res Function(_CountryModel) _then) = __$CountryModelCopyWithImpl;
@override @useResult
$Res call({
 String code, String emoji, String name
});




}
/// @nodoc
class __$CountryModelCopyWithImpl<$Res>
    implements _$CountryModelCopyWith<$Res> {
  __$CountryModelCopyWithImpl(this._self, this._then);

  final _CountryModel _self;
  final $Res Function(_CountryModel) _then;

/// Create a copy of CountryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? emoji = null,Object? name = null,}) {
  return _then(_CountryModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
