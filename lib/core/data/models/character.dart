class Character {
  final int charId;
  final bool isAlive;
  final String name;
  final String species;
  final String gender;
  final String? imageUrl;
  final String cityName;

  Character({
    required this.name,
    required this.imageUrl,
    required this.gender,
    required this.charId,
    required this.species,
    required this.cityName,
    required this.isAlive,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      imageUrl: json['image'],
      gender: json['Male'],
      charId: json['id'],
      species: json['species'],
      cityName: json['location']['name'],
      isAlive: json['status'],
    );
  }
}
