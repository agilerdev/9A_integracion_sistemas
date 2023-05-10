import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';

class MockRequestGetPreparaciones extends Mock implements RequestContext {
  @override
  Request get request => Request.get(Uri.http('localhost', '/preparaciones'));
}

class MockRequestDeletePreparaciones extends Mock implements RequestContext {
  @override
  Request get request => Request.delete(
        Uri.http('localhost', '/preparaciones'),
        body: jsonEncode({'id': 1}),
      );
}
