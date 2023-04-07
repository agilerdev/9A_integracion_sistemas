// ignore_for_file: no_default_cases

import 'package:backend/models/cocinero.dart';
import 'package:backend/models/nuevo_cocinero.dart';
import 'package:backend/services/database_service.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return DatabaseService.startConnection(
    context,
    httpResponse(context),
  );
}

Future<Response> httpResponse(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return get(context);
    case HttpMethod.post:
      return post(context);
    case HttpMethod.put:
      return put(context);
    case HttpMethod.delete:
      return delete(context);
    default:
      return Response.json(
        statusCode: 404,
        body: {'message': 'Method not allowed'},
      );
  }
}

Future<Response> get(RequestContext context) async {
  final docs = await DatabaseService.cocinerosCollection.find().toList();
  final pizzas = docs.map(Cocinero.fromJson).toList();
  return Response.json(body: {'data': pizzas});
}

Future<Response> post(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final nuevoCocinero = NuevoCocinero.fromJson(body);
  final insercion = await DatabaseService.cocinerosCollection.insertOne(
    nuevoCocinero.toJson(),
  );
  if (insercion.isSuccess) {
    return Response();
  } else {
    return Response.json(
      statusCode: 500,
      body: {'message': 'Internal server error'},
    );
  }
}

Future<Response> put(RequestContext context) async {
  return Response(body: 'Welcome to Dart Frog!');
}

Future<Response> delete(RequestContext context) async {
  return Response(body: 'Welcome to Dart Frog!');
}
