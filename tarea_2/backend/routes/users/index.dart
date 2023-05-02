// ignore_for_file: no_default_cases

import 'package:backend/db/tables/user.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:stormberry/stormberry.dart';

Future<Response> onRequest(RequestContext context) async {
  return httpResponse(context);
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
  final db = context.read<Database>();
  final users = await db.users.queryUsers();
  return Response.json(
    body: {
      'users': users
          .map((e) => {'id': e.id, 'nombre': e.nombre, 'apellido': e.apellido})
          .toList()
    },
  );
}

Future<Response> post(RequestContext context) async {
  final db = context.read<Database>();
  final body = await context.request.json() as Map<String, dynamic>;
  final nombre = body['nombre'] as String;
  final apellido = body['apellido'] as String;

  final insercion = await db.users
      .insertOne(UserInsertRequest(nombre: nombre, apellido: apellido));
  if (insercion == 1) {
    return Response();
  } else {
    return Response.json(
      statusCode: 500,
      body: {'message': 'Internal server error'},
    );
  }
}

Future<Response> put(RequestContext context) async {
  final db = context.read<Database>();
  final body = await context.request.json() as Map<String, dynamic>;
  final id = body['id'] as int;
  final nombre = body['nombre'] as String;
  final apellido = body['apellido'] as String;

  await db.users
      .updateOne(UserUpdateRequest(id: id, nombre: nombre, apellido: apellido));

  return Response();
}

Future<Response> delete(RequestContext context) async {
  final db = context.read<Database>();
  final body = await context.request.json() as Map<String, dynamic>;
  final id = body['id'] as int;

  await db.users.deleteOne(id);

  return Response();
}
