library dartrs_example;

import 'dart:mirrors';
import 'dart:convert' show JSON;
import 'package:dartrs/dartrs.dart';


/**
* Sample Restful server to demonstrate how a command-pattern implementation
* could be simply written
*
* This is pretty dangerous, as this lets anybody execute arbitrary functions
* on the server's vm
*/
void main() {
  RestfulServer.bind().then((RestfulServer server) {
    server
    ..onPost("/cmd/{command}", (request, uriParams, body) {
      var parsed = JSON.decode(body);
      var result = currentMirrorSystem().findLibrary(new Symbol("dartrs_example")).first.invoke(new Symbol(uriParams["command"]), [parsed]);
      request.response.write(result.reflectee);
    });
  });
}

avg(Map body) {
  var sum =  body["numbers"].reduce((value, element) => value + element);
  return sum / body["numbers"].length;
}