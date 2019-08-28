import 'dart:convert';

class ModuleData {
  final String uuid;
  final double longitude;
  final double latitude;
  final double temperature;
  final double pression;
  final DateTime dateTime;
  final double voltage;
  final String moduleGuid;
  final String positionMode;

  ModuleData(
      {this.uuid,
      this.longitude,
      this.latitude,
      this.temperature,
      this.pression,
      this.dateTime,
      this.voltage,
      this.moduleGuid,
      this.positionMode});

  factory ModuleData.fromJson(Map<String, dynamic> json) {
    print(json);
    return ModuleData(
        uuid: json["guid"] as String,
        latitude: json['latitude'] as double,
        longitude: json['longitude'] as double,
        temperature: json['temperature'] as double,
        pression: json['pression'] as double,
        dateTime: DateTime.parse(json['dateTime']),
        voltage: json['voltage'] as double,
        moduleGuid: json['moduleGuid'] as String,
        positionMode: json['positionMode'] as String);
  }
}

// A function that converts a response body into a List<Photo>.
List<ModuleData> parseModuleData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed((json) => ModuleData.fromJson(json));
}
