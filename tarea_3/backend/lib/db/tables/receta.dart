// ignore_for_file: public_member_api_docs
import 'package:json_annotation/json_annotation.dart';
import 'package:stormberry/stormberry.dart';

part 'receta.g.dart';
part 'receta.schema.dart';

@JsonSerializable()
@Model()
class Receta {
  Receta(this.id, this.nombrePlato, this.ingredientesCantidades);

  factory Receta.fromJson(Map<String, dynamic> json) => _$RecetaFromJson(json);
  factory Receta.fromMap(Map<String, dynamic> json) => _$RecetaFromJson(json);
  @PrimaryKey()
  @AutoIncrement()
  final int id;
  final String nombrePlato;
  final String ingredientesCantidades;
}
