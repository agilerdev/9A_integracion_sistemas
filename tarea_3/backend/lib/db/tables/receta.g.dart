// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Receta _$RecetaFromJson(Map<String, dynamic> json) => Receta(
      json['id'] as int,
      json['nombrePlato'] as String,
      json['ingredientesCantidades'] as String,
    );

Map<String, dynamic> _$RecetaToJson(Receta instance) => <String, dynamic>{
      'id': instance.id,
      'nombrePlato': instance.nombrePlato,
      'ingredientesCantidades': instance.ingredientesCantidades,
    };
