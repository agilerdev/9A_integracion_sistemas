// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cocinero.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cocinero _$CocineroFromJson(Map<String, dynamic> json) {
  return _Cocinero.fromJson(json);
}

/// @nodoc
mixin _$Cocinero {
  @JsonKey(name: '_id', fromJson: idFromJson, toJson: idToJson)
  String get id => throw _privateConstructorUsedError;
  String get nombre => throw _privateConstructorUsedError;
  double get sueldoBasico => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CocineroCopyWith<Cocinero> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CocineroCopyWith<$Res> {
  factory $CocineroCopyWith(Cocinero value, $Res Function(Cocinero) then) =
      _$CocineroCopyWithImpl<$Res, Cocinero>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id', fromJson: idFromJson, toJson: idToJson) String id,
      String nombre,
      double sueldoBasico});
}

/// @nodoc
class _$CocineroCopyWithImpl<$Res, $Val extends Cocinero>
    implements $CocineroCopyWith<$Res> {
  _$CocineroCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? sueldoBasico = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      sueldoBasico: null == sueldoBasico
          ? _value.sueldoBasico
          : sueldoBasico // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CocineroCopyWith<$Res> implements $CocineroCopyWith<$Res> {
  factory _$$_CocineroCopyWith(
          _$_Cocinero value, $Res Function(_$_Cocinero) then) =
      __$$_CocineroCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id', fromJson: idFromJson, toJson: idToJson) String id,
      String nombre,
      double sueldoBasico});
}

/// @nodoc
class __$$_CocineroCopyWithImpl<$Res>
    extends _$CocineroCopyWithImpl<$Res, _$_Cocinero>
    implements _$$_CocineroCopyWith<$Res> {
  __$$_CocineroCopyWithImpl(
      _$_Cocinero _value, $Res Function(_$_Cocinero) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nombre = null,
    Object? sueldoBasico = null,
  }) {
    return _then(_$_Cocinero(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nombre: null == nombre
          ? _value.nombre
          : nombre // ignore: cast_nullable_to_non_nullable
              as String,
      sueldoBasico: null == sueldoBasico
          ? _value.sueldoBasico
          : sueldoBasico // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cocinero extends _Cocinero {
  const _$_Cocinero(
      {@JsonKey(name: '_id', fromJson: idFromJson, toJson: idToJson)
          required this.id,
      required this.nombre,
      required this.sueldoBasico})
      : super._();

  factory _$_Cocinero.fromJson(Map<String, dynamic> json) =>
      _$$_CocineroFromJson(json);

  @override
  @JsonKey(name: '_id', fromJson: idFromJson, toJson: idToJson)
  final String id;
  @override
  final String nombre;
  @override
  final double sueldoBasico;

  @override
  String toString() {
    return 'Cocinero(id: $id, nombre: $nombre, sueldoBasico: $sueldoBasico)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cocinero &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.sueldoBasico, sueldoBasico) ||
                other.sueldoBasico == sueldoBasico));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nombre, sueldoBasico);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CocineroCopyWith<_$_Cocinero> get copyWith =>
      __$$_CocineroCopyWithImpl<_$_Cocinero>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CocineroToJson(
      this,
    );
  }
}

abstract class _Cocinero extends Cocinero {
  const factory _Cocinero(
      {@JsonKey(name: '_id', fromJson: idFromJson, toJson: idToJson)
          required final String id,
      required final String nombre,
      required final double sueldoBasico}) = _$_Cocinero;
  const _Cocinero._() : super._();

  factory _Cocinero.fromJson(Map<String, dynamic> json) = _$_Cocinero.fromJson;

  @override
  @JsonKey(name: '_id', fromJson: idFromJson, toJson: idToJson)
  String get id;
  @override
  String get nombre;
  @override
  double get sueldoBasico;
  @override
  @JsonKey(ignore: true)
  _$$_CocineroCopyWith<_$_Cocinero> get copyWith =>
      throw _privateConstructorUsedError;
}
