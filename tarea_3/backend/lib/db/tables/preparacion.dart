// ignore_for_file: public_member_api_docs
import 'package:backend/db/tables/cocinero.dart';
import 'package:backend/db/tables/receta.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stormberry/stormberry.dart';

part 'preparacion.g.dart';
part 'preparacion.schema.dart';

@JsonSerializable()
@Model()
class Preparacion {
  Preparacion(
    this.id,
    this.fecha,
    this.hora,
    this.cantidadProductosPreparar,
    this.costo,
    this.tiempoEstimado,
    this.cocinero,
    this.receta,
  );

  factory Preparacion.fromJson(Map<String, dynamic> json) =>
      _$PreparacionFromJson(json);
  factory Preparacion.fromMap(Map<String, dynamic> json) =>
      _$PreparacionFromJson(json);
  @PrimaryKey()
  @AutoIncrement()
  final int id;
  final String fecha;
  final String hora;
  final int cantidadProductosPreparar;
  final double costo;
  final String tiempoEstimado;

  final Cocinero cocinero;
  final Receta receta;
}
