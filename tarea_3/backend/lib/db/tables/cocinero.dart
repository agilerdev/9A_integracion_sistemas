// ignore_for_file: public_member_api_docs
import 'package:json_annotation/json_annotation.dart';
import 'package:stormberry/stormberry.dart';

part 'cocinero.g.dart';
part 'cocinero.schema.dart';

@JsonSerializable()
@Model()
class Cocinero {
  Cocinero(this.id, this.nombre, this.sueldoBasico);

  factory Cocinero.fromJson(Map<String, dynamic> json) =>
      _$CocineroFromJson(json);
  factory Cocinero.fromMap(Map<String, dynamic> json) =>
      _$CocineroFromJson(json);
  @PrimaryKey()
  @AutoIncrement()
  final int id;
  final String nombre;
  final double sueldoBasico;
}
