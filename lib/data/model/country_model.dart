class CountryModel {
  String? code;
  String? name;
  String? emoji;
  CountryModel({required this.code, required this.emoji, required this.name});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'],
      emoji: json['emoji'],
      name: json['name'],
    );
  }
}
