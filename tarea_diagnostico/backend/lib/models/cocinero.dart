// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mongo_dart/mongo_dart.dart';
part 'cocinero.freezed.dart';
part 'cocinero.g.dart';

@freezed
class Cocinero with _$Cocinero {
  const factory Cocinero({
    @JsonKey(name: '_id', fromJson: idFromJson, toJson: idToJson)
        required String id,
    required String nombre,
    required double sueldoBasico,
  }) = _Cocinero;
  const Cocinero._();

  factory Cocinero.fromJson(Map<String, dynamic> json) =>
      _$CocineroFromJson(json);
  factory Cocinero.fromMap(Map<String, dynamic> json) =>
      _$CocineroFromJson(json);
  Map<String, dynamic> toMap() => toJson();
}

String idFromJson(ObjectId id) {
  return id.$oid;
}

ObjectId idToJson(String id) => ObjectId.fromHexString(id);
