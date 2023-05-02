// ignore_for_file: public_member_api_docs
import 'package:json_annotation/json_annotation.dart';
import 'package:stormberry/stormberry.dart';

part 'user.g.dart';
part 'user.schema.dart';

@JsonSerializable()
@Model()
class User {
  User(this.id, this.nombre, this.apellido);
  factory User.fromMap(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  @PrimaryKey()
  @AutoIncrement()
  final int id;
  final String nombre;
  final String apellido;
}
