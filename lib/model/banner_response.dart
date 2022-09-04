class BannerResponse {
  BannerStatus? status;
  Identity? identity;
  List<BannerResponseData>? data;
  String? service;

  BannerResponse({
    this.status,
    this.identity,
    this.data,
    this.service,
  });

  BannerResponse.fromJson(Map<String, dynamic> json) {
    status = (json['status'] as Map<String,dynamic>?) != null ? BannerStatus.fromJson(json['status'] as Map<String,dynamic>) : null;
    identity = (json['identity'] as Map<String,dynamic>?) != null ? Identity.fromJson(json['identity'] as Map<String,dynamic>) : null;
    data = (json['data'] as List?)?.map((dynamic e) => BannerResponseData.fromJson(e as Map<String,dynamic>)).toList();
    service = json['service'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status?.toJson();
    json['identity'] = identity?.toJson();
    json['data'] = data?.map((e) => e.toJson()).toList();
    json['service'] = service;
    return json;
  }
}

class BannerStatus {
  String? responseCode;
  String? responseDesc;
  String? responseMessage;
  String? stacktrace;

  BannerStatus({
    this.responseCode,
    this.responseDesc,
    this.responseMessage,
    this.stacktrace,
  });

  BannerStatus.fromJson(Map<String, dynamic> json) {
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

class Identity {
  String? reqDateTime;
  String? token;

  Identity({
    this.reqDateTime,
    this.token,
  });

  Identity.fromJson(Map<String, dynamic> json) {
    reqDateTime = json['reqDateTime'] as String?;
    token = json['token'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['reqDateTime'] = reqDateTime;
    json['token'] = token;
    return json;
  }
}

class BannerResponseData {
  String? bannerCode;
  String? bannerName;
  String? imageName;
  String? path;
  String? description;
  String? active;
  String? imageCode;

  BannerResponseData({
    this.bannerCode,
    this.bannerName,
    this.imageName,
    this.path,
    this.description,
    this.active,
    this.imageCode,
  });

  BannerResponseData.fromJson(Map<String, dynamic> json) {
    bannerCode = json['bannerCode'] as String?;
    bannerName = json['bannerName'] as String?;
    imageName = json['imageName'] as String?;
    path = json['path'] as String?;
    description = json['description'] as String?;
    active = json['active'] as String?;
    imageCode = json['imageCode'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['bannerCode'] = bannerCode;
    json['bannerName'] = bannerName;
    json['imageName'] = imageName;
    json['path'] = path;
    json['description'] = description;
    json['active'] = active;
    json['imageCode'] = imageCode;
    return json;
  }
}