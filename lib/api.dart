import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:testapp/moduleResponse.dart';

Future<ModuleResponse> fetchModules(http.Client client) async {
  final response = await client.get('http://176.159.24.54:52080/api/module');
  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseModuleResponse, response.body);
}
