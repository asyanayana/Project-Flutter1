class NewsResponse {
  Status? status;
  List<NewsResult>? result;

  NewsResponse({
    this.status,
    this.result,
  });

  NewsResponse.fromJson(Map<String, dynamic> json) {
    status = (json['status'] as Map<String,dynamic>?) != null ? Status.fromJson(json['status'] as Map<String,dynamic>) : null;
    result = (json['result'] as List?)?.map((dynamic e) => NewsResult.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['status'] = status?.toJson();
    json['result'] = result?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Status {
  String? messageCode;
  String? message;
  String? service;

  Status({
    this.messageCode,
    this.message,
    this.service,
  });

  Status.fromJson(Map<String, dynamic> json) {
    messageCode = json['messageCode'] as String?;
    message = json['message'] as String?;
    service = json['service'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['messageCode'] = messageCode;
    json['message'] = message;
    json['service'] = service;
    return json;
  }
}

class NewsResult {
  String? nAMAPERTANDINGAN;
  String? tITLE;
  String? dESC;
  String? iMAGE;
  String? pUBLISHDATE;

  NewsResult({
    this.nAMAPERTANDINGAN,
    this.tITLE,
    this.dESC,
    this.iMAGE,
    this.pUBLISHDATE,
  });

  NewsResult.fromJson(Map<String, dynamic> json) {
    nAMAPERTANDINGAN = json['NAMA_PERTANDINGAN'] as String?;
    tITLE = json['TITLE'] as String?;
    dESC = json['DESC'] as String?;
    iMAGE = json['IMAGE'] as String?;
    pUBLISHDATE = json['PUBLISH_DATE'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['NAMA_PERTANDINGAN'] = nAMAPERTANDINGAN;
    json['TITLE'] = tITLE;
    json['DESC'] = dESC;
    json['IMAGE'] = iMAGE;
    json['PUBLISH_DATE'] = pUBLISHDATE;
    return json;
  }
}