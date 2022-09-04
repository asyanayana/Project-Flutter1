import 'package:meta/meta.dart';
import 'dart:convert';

JadwalRequest jadwalRequestFromJson(String str) => JadwalRequest.fromJson(json.decode(str));

String jadwalRequestToJson(JadwalRequest data) => json.encode(data.toJson());

class JadwalRequest {
  JadwalRequest({
    required this.data,
    required this.identity,
    required this.service,
  });

  final DataJadwal data;
  final IdentityJadwal identity;
  final String service;

  factory JadwalRequest.fromJson(Map<String, dynamic> json) => JadwalRequest(
    data: DataJadwal.fromJson(json["data"]),
    identity: IdentityJadwal.fromJson(json["identity"]),
    service: json["service"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "identity": identity.toJson(),
    "service": service,
  };
}

class DataJadwal {
  DataJadwal({
    required this.startDate,
  });

  final String startDate;

  factory DataJadwal.fromJson(Map<String, dynamic> json) => DataJadwal(
    startDate: json["startDate"],
  );

  Map<String, dynamic> toJson() => {
    "startDate": startDate,
  };
}

class IdentityJadwal {
  IdentityJadwal({
    required this.reqDateTime,
    required this.token,
  });

  final DateTime reqDateTime;
  final String token;

  factory IdentityJadwal.fromJson(Map<String, dynamic> json) => IdentityJadwal(
    reqDateTime: DateTime.parse(json["reqDateTime"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "reqDateTime": reqDateTime.toIso8601String(),
    "token": token,
  };
}
