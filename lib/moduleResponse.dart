import 'dart:convert';

import 'package:testapp/module.dart';

class ModuleResponse {
  final int pageIndex;
  final int totalPages;
  final bool hasPreviousPage;
  final bool hasNextPage;
  final int totalCount;
  final List<Module> result;

  ModuleResponse(
      {this.pageIndex,
      this.totalPages,
      this.totalCount,
      this.hasNextPage,
      this.hasPreviousPage,
      this.result});

  factory ModuleResponse.fromJson(Map<String, dynamic> json) {
    List<Module> result;
    if (json["result"] != null) {
      var list = json['result'] as List;
      print(list.runtimeType); //returns List<dynamic>
      result = list.map((i) => Module.fromJson(i)).toList();
    }

    return ModuleResponse(
      pageIndex: json['pageIndex'] as int,
      totalPages: json['totalPages'] as int,
      totalCount: json['totalCount'] as int,
      hasNextPage: json['hasNextPage'] as bool,
      hasPreviousPage: json['hasPreviousPage'] as bool,
      result: result,
    );
  }

  @override
  String toString() {
    return 'ModuleResponse{pageIndex: $pageIndex, totalPages: $totalPages, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage, totalCount: $totalCount, result: $result}';
  }
}

// A function that converts a response body into a List<Photo>.
ModuleResponse parseModuleResponse(String responseBody) {
  final parsed = json.decode(responseBody);
//TODO parser dans des objets
  return ModuleResponse.fromJson(parsed);
//return parsed;
}
