import 'package:meta/meta.dart';
import 'dart:convert';

BannerRequest bannerRequestFromJson(String str) => BannerRequest.fromJson(json.decode(str));

String bannerRequestToJson(BannerRequest data) => json.encode(data.toJson());

class BannerRequest {
  BannerRequest({
    required this.identity,
    required this.service,
  });

  final IdentityBanner identity;
  final String service;

  factory BannerRequest.fromJson(Map<String, dynamic> json) => BannerRequest(
    identity: IdentityBanner.fromJson(json["identity"]),
    service: json["service"],
  );

  Map<String, dynamic> toJson() => {
    "identity": identity.toJson(),
    "service": service,
  };
}

class IdentityBanner {
  IdentityBanner({
    required this.reqDateTime,
    required this.token,
  });

  final DateTime reqDateTime;
  final String token;

  factory IdentityBanner.fromJson(Map<String, dynamic> json) => IdentityBanner(
    reqDateTime: DateTime.parse(json["reqDateTime"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "reqDateTime": reqDateTime.toIso8601String(),
    "token": token,
  };
}
