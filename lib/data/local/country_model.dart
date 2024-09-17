class CountryModel {
  final String name;
  final List<String> regions;

  CountryModel({required this.name, required this.regions});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json.keys.first,
      regions: List<String>.from(json.values.first),
    );
  }
}
