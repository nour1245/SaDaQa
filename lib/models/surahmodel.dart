class SurahInfo {
  late List<Chapters> chapters;

  SurahInfo({required this.chapters});

  SurahInfo.fromJson(Map<String, dynamic> json) {
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters.add(Chapters.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chapters'] = chapters.map((v) => v.toJson()).toList();
    return data;
  }
}

class Chapters {
  int? id;
  String? revelationPlace;
  int? revelationOrder;
  bool? bismillahPre;
  String? nameSimple;
  String? nameComplex;
  String? nameArabic;
  int? versesCount;
  List<int>? pages;

  Chapters({
    this.id,
    this.revelationPlace,
    this.revelationOrder,
    this.bismillahPre,
    this.nameSimple,
    this.nameComplex,
    this.nameArabic,
    this.versesCount,
    this.pages,
  });

  Chapters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    revelationPlace = json['revelation_place'];
    revelationOrder = json['revelation_order'];
    bismillahPre = json['bismillah_pre'];
    nameSimple = json['name_simple'];
    nameComplex = json['name_complex'];
    nameArabic = json['name_arabic'];
    versesCount = json['verses_count'];
    pages = json['pages'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['revelation_place'] = revelationPlace;
    data['revelation_order'] = revelationOrder;
    data['bismillah_pre'] = bismillahPre;
    data['name_simple'] = nameSimple;
    data['name_complex'] = nameComplex;
    data['name_arabic'] = nameArabic;
    data['verses_count'] = versesCount;
    data['pages'] = pages;
    return data;
  }
}
