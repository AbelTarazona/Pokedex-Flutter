class StatModel {
  final String name;
  final int baseStat;

  StatModel({required this.name, required this.baseStat});

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      name: json['stat']['name'],
      baseStat: json['base_stat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'baseStat': baseStat,
    };
  }
}