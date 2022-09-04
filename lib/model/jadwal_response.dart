class JadwalResponse {
  JadwalStatus? status;
  dynamic identity;
  List<JadwalResponseData>? data;
  String? service;

  JadwalResponse({
    this.status,
    this.identity,
    this.data,
    this.service,
  });

  JadwalResponse.fromJson(Map<String, dynamic> json) {
    status = (json['status'] as Map<String,dynamic>?) != null ? JadwalStatus.fromJson(json['status'] as Map<String,dynamic>) : null;
    identity = json['identity'];
    data = (json['data'] as List?)?.map((dynamic e) => JadwalResponseData.fromJson(e as Map<String,dynamic>)).toList();
    service = json['service'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status?.toJson();
    json['identity'] = identity;
    json['data'] = data?.map((e) => e.toJson()).toList();
    json['service'] = service;
    return json;
  }
}

class JadwalStatus {
  String? responseCode;
  String? responseDesc;
  String? responseMessage;
  String? stacktrace;

  JadwalStatus({
    this.responseCode,
    this.responseDesc,
    this.responseMessage,
    this.stacktrace,
  });

  JadwalStatus.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'] as String?;
    responseDesc = json['responseDesc'] as String?;
    responseMessage = json['responseMessage'] as String?;
    stacktrace = json['stacktrace'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['responseCode'] = responseCode;
    json['responseDesc'] = responseDesc;
    json['responseMessage'] = responseMessage;
    json['stacktrace'] = stacktrace;
    return json;
  }
}

class JadwalResponseData {
  String? home;
  String? away;
  String? date;
  String? homeIcon;
  String? awayIcon;
  String? location;
  String? widgetUrl;

  JadwalResponseData({
    this.home,
    this.away,
    this.date,
    this.homeIcon,
    this.awayIcon,
    this.location,
    this.widgetUrl,
  });

  JadwalResponseData.fromJson(Map<String, dynamic> json) {
    home = json['home'] as String?;
    away = json['away'] as String?;
    date = json['date'] as String?;
    homeIcon = json['homeIcon'] as String?;
    awayIcon = json['awayIcon'] as String?;
    location = json['location'] as String?;
    widgetUrl = json['widgetUrl'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['home'] = home;
    json['away'] = away;
    json['date'] = date;
    json['homeIcon'] = homeIcon;
    json['awayIcon'] = awayIcon;
    json['location'] = location;
    json['widgetUrl'] = widgetUrl;
    return json;
  }
}