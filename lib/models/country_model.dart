class CountryModel {
  final String name;
  final int population;
  final String flag;
  final double area;
  final String region;
  final String subregion;
  final List<String> timezones;

  CountryModel({
    required this.name,
    required this.population,
    required this.flag,
    required this.area,
    required this.region,
    required this.subregion,
    required this.timezones,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']?['common'] ?? '',
      population: json['population'] ?? 0,
      flag: json['flag'] ?? '',
      area: (json['area'] ?? 0).toDouble(),
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      timezones: List<String>.from(json['timezones'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': {'common': name},
      'population': population,
      'flag': flag,
      'area': area,
      'region': region,
      'subregion': subregion,
      'timezones': timezones,
    };
  }
}
