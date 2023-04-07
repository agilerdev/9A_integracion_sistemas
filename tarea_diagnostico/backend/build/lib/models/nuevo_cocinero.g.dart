// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nuevo_cocinero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NuevoCocinero _$$_NuevoCocineroFromJson(Map<String, dynamic> json) =>
    _$_NuevoCocinero(
      nombre: json['nombre'] as String,
      sueldoBasico: (json['sueldoBasico'] as num).toDouble(),
    );

Map<String, dynamic> _$$_NuevoCocineroToJson(_$_NuevoCocinero instance) =>
    <String, dynamic>{
      'nombre': instance.nombre,
      'sueldoBasico': instance.sueldoBasico,
    };
