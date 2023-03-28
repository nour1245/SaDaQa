class HadisModel {
  int? number;
  String? hadith;
  String? description;
  String? searchTerm;

  HadisModel({this.number, this.hadith, this.description, this.searchTerm});

  HadisModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    hadith = json['hadith'];
    description = json['description'];
    searchTerm = json['searchTerm'];
  }
}
