// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nuevo_cocinero.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NuevoCocinero _$NuevoCocineroFromJson(Map<String, dynamic> json) {
  return _NuevoCocinero.fromJson(json);
}

/// @nodoc
mixin _$NuevoCocinero {
  String get nombre => throw _privateConstructorUsedError;
  double get sueldoBasico => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NuevoCocineroCopyWith<NuevoCocinero> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NuevoCocineroCopyWith<$Res> {
  factory $NuevoCocineroCopyWith(
          NuevoCocinero value, $Res Function(NuevoCocinero) then) =
      _$NuevoCocineroCopyWithImpl<$Res, NuevoCocinero>;
  @useResult
  $Res call({String nombre, double sueldoBasico});
}

/// @nodoc
class _$NuevoCocineroCopyWithImpl<$Res, $Val extends NuevoCocinero>
    implements $NuevoCocineroCopyWith<$Res> {
  _$NuevoCocineroCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nombre = null,
    Object? sueldoBasico = null,
  }) {
    return _then(_value.copyWith(
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
abstract class _$$_NuevoCocineroCopyWith<$Res>
    implements $NuevoCocineroCopyWith<$Res> {
  factory _$$_NuevoCocineroCopyWith(
          _$_NuevoCocinero value, $Res Function(_$_NuevoCocinero) then) =
      __$$_NuevoCocineroCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nombre, double sueldoBasico});
}

/// @nodoc
class __$$_NuevoCocineroCopyWithImpl<$Res>
    extends _$NuevoCocineroCopyWithImpl<$Res, _$_NuevoCocinero>
    implements _$$_NuevoCocineroCopyWith<$Res> {
  __$$_NuevoCocineroCopyWithImpl(
      _$_NuevoCocinero _value, $Res Function(_$_NuevoCocinero) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nombre = null,
    Object? sueldoBasico = null,
  }) {
    return _then(_$_NuevoCocinero(
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
class _$_NuevoCocinero extends _NuevoCocinero {
  const _$_NuevoCocinero({required this.nombre, required this.sueldoBasico})
      : super._();

  factory _$_NuevoCocinero.fromJson(Map<String, dynamic> json) =>
      _$$_NuevoCocineroFromJson(json);

  @override
  final String nombre;
  @override
  final double sueldoBasico;

  @override
  String toString() {
    return 'NuevoCocinero(nombre: $nombre, sueldoBasico: $sueldoBasico)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NuevoCocinero &&
            (identical(other.nombre, nombre) || other.nombre == nombre) &&
            (identical(other.sueldoBasico, sueldoBasico) ||
                other.sueldoBasico == sueldoBasico));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nombre, sueldoBasico);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NuevoCocineroCopyWith<_$_NuevoCocinero> get copyWith =>
      __$$_NuevoCocineroCopyWithImpl<_$_NuevoCocinero>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NuevoCocineroToJson(
      this,
    );
  }
}

abstract class _NuevoCocinero extends NuevoCocinero {
  const factory _NuevoCocinero(
      {required final String nombre,
      required final double sueldoBasico}) = _$_NuevoCocinero;
  const _NuevoCocinero._() : super._();

  factory _NuevoCocinero.fromJson(Map<String, dynamic> json) =
      _$_NuevoCocinero.fromJson;

  @override
  String get nombre;
  @override
  double get sueldoBasico;
  @override
  @JsonKey(ignore: true)
  _$$_NuevoCocineroCopyWith<_$_NuevoCocinero> get copyWith =>
      throw _privateConstructorUsedError;
}
