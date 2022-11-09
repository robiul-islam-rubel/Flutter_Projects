  class modifiedAyat {
  int? id;
  String? nameAr;
  String? nameEn;
  String? nameBn;
  int? ayaNumber;
  String? verseKey;
  String? sanenojul;
  String? tafsir;
  int? sajda;
  int? sajdaNumber;
  int? ruku;
  int? rukuNumber;
  int? suraId;
  String? suraNameAr;
  String? suraNameEn;
  String? suraNameBn;
  int? paraId;
  String? paraNameAr;
  String? paraNameEn;
  String? paraNameBn;


  modifiedAyat(
      {
        this.id,
        this.nameAr,
        this.nameEn,
        this.nameBn,
        this.ayaNumber,
        this.verseKey,
        this.sanenojul,
        this.tafsir,
        this.sajda,
        this.sajdaNumber,
        this.ruku,
        this.rukuNumber,
        this.suraId,
        this.suraNameAr,
        this.suraNameEn,
        this.suraNameBn,
        this.paraId,
        this.paraNameAr,
        this.paraNameEn,
        this.paraNameBn,
         });

  modifiedAyat.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];
    ayaNumber = json['aya_number'];
    verseKey = json['verse_key'];
    sanenojul = json['sanenojul'];
    tafsir = json['tafsir'];
    sajda = json['sajda'];
    sajdaNumber = json['sajda_number'];
    ruku = json['ruku'];
    rukuNumber = json['ruku_number'];
    suraId = json['suraId'];
    suraNameAr = json['suraNameAr'];
    suraNameEn = json['suraNameEn'];
    suraNameBn = json['suraNameBn'];
    paraId = json['paraId'];
    paraNameAr = json['paraNameAr'];
    paraNameEn = json['paraNameEn'];
    paraNameBn = json['paraNameBn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    data['aya_number'] = this.ayaNumber;
    data['verse_key'] = this.verseKey;
    data['sanenojul'] = this.sanenojul;
    data['tafsir'] = this.tafsir;
    data['sajda'] = this.sajda;
    data['sajda_number'] = this.sajdaNumber;
    data['ruku'] = this.ruku;
    data['ruku_number'] = this.rukuNumber;
    data['suraId'] = this.suraId;
    data['suraNameAr'] = this.suraNameAr;
    data['suraNameEn'] = this.suraNameEn;
    data['suraNameBn'] = this.suraNameBn;
    data['paraId'] = this.paraId;
    data['paraNameAr'] = this.paraNameAr;
    data['paraNameEn'] = this.paraNameEn;
    data['paraNameBn'] = this.paraNameBn;

    return data;
  }
}