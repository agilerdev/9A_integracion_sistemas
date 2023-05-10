// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocinero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cocinero _$CocineroFromJson(Map<String, dynamic> json) => Cocinero(
      json['id'] as int,
      json['nombre'] as String,
      (json['sueldoBasico'] as num).toDouble(),
    );

Map<String, dynamic> _$CocineroToJson(Cocinero instance) => <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'sueldoBasico': instance.sueldoBasico,
    };
