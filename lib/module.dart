import 'dart:convert';

import 'moduleData.dart';

class Module {
  final String uuid;
  final String name;
  final String country;
  final String city;
  final String address;
  final ModuleData lastData;
  final bool isActive;
  final String completeAddress;

  Module(
      {this.uuid,
      this.name,
      this.country,
      this.city,
      this.address,
      this.lastData,
      this.isActive,
      this.completeAddress});

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      uuid: json['guid'] as String,
      name: json['name'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      address: json['address'] as String,
      lastData: json['lastData'] != null
          ? ModuleData.fromJson(json['lastData'])
          : null,
      isActive: json['isActive'] as bool,
      completeAddress: json['completeAddress'] as String,
    );
  }
}

// A function that converts a response body into a List<Photo>.
List<Module> parseModules(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Module>((json) => Module.fromJson(json)).toList();
}
