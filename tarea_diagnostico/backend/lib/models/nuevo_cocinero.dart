// ignore_for_file: public_member_api_docs

import 'package:freezed_annotation/freezed_annotation.dart';
part 'nuevo_cocinero.freezed.dart';
part 'nuevo_cocinero.g.dart';

@freezed
class NuevoCocinero with _$NuevoCocinero {
  const factory NuevoCocinero({
    required String nombre,
    required double sueldoBasico,
  }) = _NuevoCocinero;
  const NuevoCocinero._();

  factory NuevoCocinero.fromJson(Map<String, dynamic> json) =>
      _$NuevoCocineroFromJson(json);
  factory NuevoCocinero.fromMap(Map<String, dynamic> json) =>
      _$NuevoCocineroFromJson(json);
}
