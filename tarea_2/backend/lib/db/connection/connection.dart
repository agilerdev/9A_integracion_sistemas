import 'package:stormberry/stormberry.dart';

final db = Database(
  host: 'db',
  port: 5432,
  database: 'dart',
  user: 'postgres',
  password: 'admin',
  useSSL: false,
  // allowClearTextPassword: true,
);
