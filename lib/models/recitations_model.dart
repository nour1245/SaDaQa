class Recitation {
  List<Recitations>? recitations;

  Recitation({required this.recitations});

  Recitation.fromJson(Map<String, dynamic> json) {
    if (json['recitations'] != null) {
      recitations = <Recitations>[];
      json['recitations'].forEach((v) {
        recitations?.add(Recitations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recitations != null) {
      data['recitations'] = recitations?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Recitations {
  int? id;
  String? reciterName;
  String? style;
  TranslatedName? translatedName;

  Recitations({this.id, this.reciterName, this.style, this.translatedName});

  Recitations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reciterName = json['reciter_name'];
    style = json['style'];
    translatedName = json['translated_name'] != null
        ? TranslatedName.fromJson(json['translated_name'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['reciter_name'] = reciterName;
    data['style'] = style;
    if (translatedName != null) {
      data['translated_name'] = translatedName?.toJson();
    }
    return data;
  }
}

class TranslatedName {
  String? name;
  String? languageName;

  TranslatedName({this.name, this.languageName});

  TranslatedName.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    languageName = json['language_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['language_name'] = languageName;
    return data;
  }
}
