import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  if (context.request.method == HttpMethod.get) {
    return Response(body: 'Welcome to Dart Frog!');
  }
  return Response.json(statusCode: 404, body: 'Method not allowed');
}
