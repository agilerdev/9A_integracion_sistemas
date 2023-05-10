// ignore_for_file: no_default_cases

import 'package:backend/db/tables/preparacion.dart';
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
  final isTesting = context.read<bool>();
  if (isTesting) {
    return Response.json(
      body: {
        'preparaciones': [
          {
            'id': 1,
            'fecha': '2021-10-10',
            'hora': '10:00',
            'cantidadProductosPreparar': 10,
            'costo': 100.0,
            'tiempoEstimado': '10:00',
            'cocineroId': 1,
            'recetaId': 1,
          },
          {
            'id': 2,
            'fecha': '2022-10-10',
            'hora': '11:00',
            'cantidadProductosPreparar': 12,
            'costo': 100.0,
            'tiempoEstimado': '10:00',
            'cocineroId': 1,
            'recetaId': 1,
          },
        ]
      },
    );
  }
  final db = context.read<Database>();

  final preparaciones = await db.preparacions.queryPreparacions();

  return Response.json(
    body: {
      'preparaciones': preparaciones
          .map(
            (e) => {
              'id': e.id,
              'fecha': e.fecha,
              'hora': e.hora,
              'cantidadProductosPreparar': e.cantidadProductosPreparar,
              'costo': e.costo,
              'tiempoEstimado': e.tiempoEstimado,
              'cocineroId': e.cocinero.id,
              'recetaId': e.receta.id,
            },
          )
          .toList()
    },
  );
}

Future<Response> post(RequestContext context) async {
  final isTesting = context.read<bool>();
  if (isTesting) {
    return Response(
      body: 'Preparacion agregada',
    );
  }
  final db = context.read<Database>();
  final body = await context.request.json() as Map<String, dynamic>;
  final fecha = body['fecha'] as String;
  final hora = body['hora'] as String;
  final cantidadProductosPreparar = body['cantidadProductosPreparar'] as int;
  final costo = body['costo'] as double;
  final tiempoEstimado = body['tiempoEstimado'] as String;
  final cocineroId = body['cocineroId'] as int;
  final recetaId = body['recetaId'] as int;

  final insercion = await db.preparacions.insertOne(
    PreparacionInsertRequest(
      fecha: fecha,
      hora: hora,
      cantidadProductosPreparar: cantidadProductosPreparar,
      costo: costo,
      tiempoEstimado: tiempoEstimado,
      cocineroId: cocineroId,
      recetaId: recetaId,
    ),
  );
  if (insercion == 1) {
    return Response(body: 'Preparacion agregada');
  } else {
    return Response.json(
      statusCode: 500,
      body: {'message': 'Internal server error'},
    );
  }
}

Future<Response> put(RequestContext context) async {
  final isTesting = context.read<bool>();
  if (isTesting) {
    return Response(
      body: 'Preparacion actualizada',
    );
  }
  final db = context.read<Database>();
  final body = await context.request.json() as Map<String, dynamic>;
  final id = body['id'] as int;
  final fecha = body['fecha'] as String;
  final hora = body['hora'] as String;
  final cantidadProductosPreparar = body['cantidadProductosPreparar'] as int;
  final costo = body['costo'] as double;
  final tiempoEstimado = body['tiempoEstimado'] as String;
  final cocineroId = body['cocineroId'] as int;
  final recetaId = body['recetaId'] as int;

  await db.preparacions.updateOne(
    PreparacionUpdateRequest(
      id: id,
      fecha: fecha,
      hora: hora,
      cantidadProductosPreparar: cantidadProductosPreparar,
      costo: costo,
      tiempoEstimado: tiempoEstimado,
      cocineroId: cocineroId,
      recetaId: recetaId,
    ),
  );

  return Response();
}

Future<Response> delete(RequestContext context) async {
  final isTesting = context.read<bool>();
  if (isTesting) {
    return Response(
      body: 'Preparacion eliminada',
    );
  }
  final db = context.read<Database>();

  final body = await context.request.json() as Map<String, dynamic>;
  final id = body['id'] as int;

  await db.preparacions.deleteOne(id);

  return Response();
}
