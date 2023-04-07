// ignore_for_file: public_member_api_docs

import 'package:mongo_dart/mongo_dart.dart';

String idFromJson(Map<String, dynamic> json) {
  final id = json['_id'] as ObjectId;
  return id.$oid;
}

ObjectId idToJson(String id) => ObjectId.fromHexString(id);
