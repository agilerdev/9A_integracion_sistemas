// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocinero.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cocinero _$$_CocineroFromJson(Map<String, dynamic> json) => _$_Cocinero(
      id: idFromJson(json['_id'] as ObjectId),
      nombre: json['nombre'] as String,
      sueldoBasico: (json['sueldoBasico'] as num).toDouble(),
    );

Map<String, dynamic> _$$_CocineroToJson(_$_Cocinero instance) =>
    <String, dynamic>{
      '_id': idToJson(instance.id),
      'nombre': instance.nombre,
      'sueldoBasico': instance.sueldoBasico,
    };
