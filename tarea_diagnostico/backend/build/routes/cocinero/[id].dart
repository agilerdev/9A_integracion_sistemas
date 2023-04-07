// ignore_for_file: lines_longer_than_80_chars

import 'package:backend/models/cocinero.dart';
import 'package:backend/services/database_service.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  return DatabaseService.startConnection(context, getCocinero(context, id));
}

Future<Response> getCocinero(RequestContext context, String id) async {
  //check if the request is a GET request
  if (context.request.method == HttpMethod.get) {
    //check if query parameter is present
    //return the pizza with the id
    final doc =
        await DatabaseService.cocinerosCollection.findOne(where.eq('id', id));
    if (doc != null && doc.isNotEmpty) {
      final cocinero = Cocinero.fromJson(doc);
      return Response.json(body: {'data': cocinero});
    } else {
      return Response.json(
        statusCode: 404,
        body: {'message': 'Pizza not found'},
      );
    }
  }

  return Response.json(
    statusCode: 404,
    body: {'message': 'Method not allowed'},
  );
}
