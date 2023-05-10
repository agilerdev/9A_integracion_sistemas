import 'dart:convert';
import 'dart:io';

import 'package:mocktail/mocktail.dart';
import 'package:stormberry/stormberry.dart';
import 'package:test/test.dart';

import '../../../routes/preparaciones/index.dart' as route;
import '../../mocks/preparacion.dart';

void main() {
  final db = Database(
    host: 'localhost',
    port: 5432,
    database: 'dart',
    user: 'postgres',
    password: 'admin',
    useSSL: false,
    // allowClearTextPassword: true,
  );

  group('GET /preparaciones', () {
    test(
      'responds with a 200 and list of preparaciones.',
      () async {
        final context = MockRequestGetPreparaciones();
        when(() => context.read<Database>()).thenReturn(db);
        when(() => context.read<bool>()).thenReturn(true);
        final response = await route.onRequest(context);
        final body = jsonDecode(await response.body()) as Map<String, dynamic>;
        expect(response.statusCode, equals(HttpStatus.ok));
        expect(
          body,
          equals(
            {
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
          ),
        );
      },
    );
  });
  group('DELETE /preparaciones', () {
    test(
      'responds with a 200 and Preparacion eliminada.',
      () async {
        final context = MockRequestDeletePreparaciones();
        when(() => context.read<Database>()).thenReturn(db);
        when(() => context.read<bool>()).thenReturn(true);
        final response = await route.onRequest(context);
        expect(response.statusCode, equals(HttpStatus.ok));
        expect(
          response.body(),
          completion(
            equals(
              'Preparacion eliminada',
            ),
          ),
        );
      },
    );
  });
}
