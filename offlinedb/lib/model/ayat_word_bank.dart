class AyatWordBank {
  int? id;
  int? ayatId;
  int? position;
  int? wId;
  String? nameAr;
  String? nameEn;
  String? nameBn;
  String? translateEn;
  String? translateBn;
  int? rootWordId;
  String? rootWordNameAr;
  String? rootWordNameEn;
  String? rootWordNameBn;
  int? subRootWordId;
  String? subRootWordNameAr;
  String? subRootWordNameEn;
  String? subRootWordNameBn;

  AyatWordBank(
      {this.id,
        this.ayatId,
        this.position,
        this.wId,
        this.nameAr,
        this.nameEn,
        this.nameBn,
        this.translateEn,
        this.translateBn,
        this.rootWordId,
        this.rootWordNameAr,
        this.rootWordNameEn,
        this.rootWordNameBn,
        this.subRootWordId,
        this.subRootWordNameAr,
        this.subRootWordNameEn,
        this.subRootWordNameBn});

  AyatWordBank.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ayatId = json['ayat_id'];
    position = json['position'];
    wId = json['wId'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    translateEn = json['translate_en'];
    translateBn = json['translate_bn'];
    rootWordId = json['rootWordId'];
    rootWordNameAr = json['rootWordNameAr'];
    rootWordNameEn = json['rootWordNameEn'];
    rootWordNameBn = json['rootWordNameBn'];
    subRootWordId = json['subRootWordId'];
    subRootWordNameAr = json['subRootWordNameAr'];
    subRootWordNameEn = json['subRootWordNameEn'];
    subRootWordNameBn = json['subRootWordNameBn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ayat_id'] = this.ayatId;
    data['position'] = this.position;
    data['wId'] = this.wId;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    data['translate_en'] = this.translateEn;
    data['translate_bn'] = this.translateBn;
    data['rootWordId'] = this.rootWordId;
    data['rootWordNameAr'] = this.rootWordNameAr;
    data['rootWordNameEn'] = this.rootWordNameEn;
    data['rootWordNameBn'] = this.rootWordNameBn;
    data['subRootWordId'] = this.subRootWordId;
    data['subRootWordNameAr'] = this.subRootWordNameAr;
    data['subRootWordNameEn'] = this.subRootWordNameEn;
    data['subRootWordNameBn'] = this.subRootWordNameBn;
    return data;
  }
}