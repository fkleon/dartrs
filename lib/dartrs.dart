library dartrs;

import 'dart:io';
import 'dart:mirrors';
import 'dart:async';

import 'package:utf/utf.dart' show Utf8DecoderTransformer;
import 'package:logging_handlers/server_logging_handlers.dart';

part 'src/server.dart';
part 'rsmeta.dart';

/**
 * Starts a [RestfulServer] and returns a future.
 */
Future<RestfulServer> startrs({String host: '127.0.0.1', int port: 8080}) {
  return new RestfulServer().listen(host: host, port: port);
}
