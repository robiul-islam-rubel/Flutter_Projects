
class AyatTafsir {
  int? id;
  int? ayatId;
  String? tafsirEn;
  String? tafsirBn;
  int? authorId;
  String? authorName;

  AyatTafsir(
      {this.id,
        this.ayatId,
        this.tafsirEn,
        this.tafsirBn,
        this.authorId,
        this.authorName});

  AyatTafsir.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ayatId = json['ayat_id'];
    tafsirEn = json['tafsir_en'];
    tafsirBn = json['tafsir_bn'];
    authorId = json['authorId'];
    authorName = json['authorName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ayat_id'] = this.ayatId;
    data['tafsir_en'] = this.tafsirEn;
    data['tafsir_bn'] = this.tafsirBn;
    data['authorId'] = this.authorId;
    data['authorName'] = this.authorName;
    return data;
  }
}