// ignore_for_file: no_default_cases

import 'package:backend/db/tables/receta.dart';
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
  final recetas = await db.recetas.queryRecetas();
  return Response.json(
    body: {
      'recetas': recetas
          .map(
            (e) => {
              'id': e.id,
              'nombrePlato': e.nombrePlato,
              'ingredientesCantidades': e.ingredientesCantidades,
            },
          )
          .toList()
    },
  );
}

Future<Response> post(RequestContext context) async {
  final db = context.read<Database>();
  final body = await context.request.json() as Map<String, dynamic>;
  final nombrePlato = body['nombrePlato'] as String;
  final ingredientesCantidades = body['ingredientesCantidades'] as String;

  final insercion = await db.recetas.insertOne(
    RecetaInsertRequest(
      nombrePlato: nombrePlato,
      ingredientesCantidades: ingredientesCantidades,
    ),
  );
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
  final nombrePlato = body['nombrePlato'] as String;
  final ingredientesCantidades = body['ingredientesCantidades'] as String;

  await db.recetas.updateOne(
    RecetaUpdateRequest(
      id: id,
      nombrePlato: nombrePlato,
      ingredientesCantidades: ingredientesCantidades,
    ),
  );

  return Response();
}

Future<Response> delete(RequestContext context) async {
  final db = context.read<Database>();
  final body = await context.request.json() as Map<String, dynamic>;
  final id = body['id'] as int;

  await db.recetas.deleteOne(id);

  return Response();
}
