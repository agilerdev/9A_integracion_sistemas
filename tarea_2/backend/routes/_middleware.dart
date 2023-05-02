import 'package:backend/db/connection/connection.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:stormberry/stormberry.dart';

Handler middleware(Handler handler) {
  return handler.use(provider<Database>((context) => db));
}
