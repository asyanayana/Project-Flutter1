class KlasementResponse {
  Status? status;
  List<KlasemenResult>? result;

  KlasementResponse({
    this.status,
    this.result,
  });

  KlasementResponse.fromJson(Map<String, dynamic> json) {
    status = (json['status'] as Map<String,dynamic>?) != null ? Status.fromJson(json['status'] as Map<String,dynamic>) : null;
    result = (json['result'] as List?)?.map((dynamic e) => KlasemenResult.fromJson(e as Map<String,dynamic>)).toList();
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

class KlasemenResult {
  String? nAMAPERTANDINGAN;
  String? iDBABAK;
  String? nAMABABAK;
  String? iDWILAYAH;
  String? iDKLUB;
  String? nAMATIM;
  String? mAIN;
  String? mENANG;
  String? sERI;
  String? kALAH;
  String? gOLMASUK;
  String? gOLKEMASUKAN;
  String? nILAI;
  String? nOURUT;

  KlasemenResult({
    this.nAMAPERTANDINGAN,
    this.iDBABAK,
    this.nAMABABAK,
    this.iDWILAYAH,
    this.iDKLUB,
    this.nAMATIM,
    this.mAIN,
    this.mENANG,
    this.sERI,
    this.kALAH,
    this.gOLMASUK,
    this.gOLKEMASUKAN,
    this.nILAI,
    this.nOURUT,
  });

  KlasemenResult.fromJson(Map<String, dynamic> json) {
    nAMAPERTANDINGAN = json['NAMA_PERTANDINGAN'] as String?;
    iDBABAK = json['ID_BABAK'] as String?;
    nAMABABAK = json['NAMA_BABAK'] as String?;
    iDWILAYAH = json['ID_WILAYAH'] as String?;
    iDKLUB = json['ID_KLUB'] as String?;
    nAMATIM = json['NAMATIM'] as String?;
    mAIN = json['MAIN'] as String?;
    mENANG = json['MENANG'] as String?;
    sERI = json['SERI'] as String?;
    kALAH = json['KALAH'] as String?;
    gOLMASUK = json['GOL_MASUK'] as String?;
    gOLKEMASUKAN = json['GOL_KEMASUKAN'] as String?;
    nILAI = json['NILAI'] as String?;
    nOURUT = json['NOURUT'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['NAMA_PERTANDINGAN'] = nAMAPERTANDINGAN;
    json['ID_BABAK'] = iDBABAK;
    json['NAMA_BABAK'] = nAMABABAK;
    json['ID_WILAYAH'] = iDWILAYAH;
    json['ID_KLUB'] = iDKLUB;
    json['NAMATIM'] = nAMATIM;
    json['MAIN'] = mAIN;
    json['MENANG'] = mENANG;
    json['SERI'] = sERI;
    json['KALAH'] = kALAH;
    json['GOL_MASUK'] = gOLMASUK;
    json['GOL_KEMASUKAN'] = gOLKEMASUKAN;
    json['NILAI'] = nILAI;
    json['NOURUT'] = nOURUT;
    return json;
  }
}