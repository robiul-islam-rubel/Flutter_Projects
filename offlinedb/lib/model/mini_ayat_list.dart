class miniAyat {

  int? id;
  String? nameAr;
  String? nameEn;
  String? nameBn;

  miniAyat({this.id,this.nameAr,this.nameEn,this.nameBn});



  miniAyat.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    nameBn = json['name_bn'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['name_bn'] = this.nameBn;
    return data;
  }
}

