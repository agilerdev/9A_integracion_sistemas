// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preparacion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preparacion _$PreparacionFromJson(Map<String, dynamic> json) => Preparacion(
      json['id'] as int,
      json['fecha'] as String,
      json['hora'] as String,
      json['cantidadProductosPreparar'] as int,
      (json['costo'] as num).toDouble(),
      json['tiempoEstimado'] as String,
      Cocinero.fromJson(json['cocinero'] as Map<String, dynamic>),
      Receta.fromJson(json['receta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreparacionToJson(Preparacion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fecha': instance.fecha,
      'hora': instance.hora,
      'cantidadProductosPreparar': instance.cantidadProductosPreparar,
      'costo': instance.costo,
      'tiempoEstimado': instance.tiempoEstimado,
      'cocinero': instance.cocinero,
      'receta': instance.receta,
    };
