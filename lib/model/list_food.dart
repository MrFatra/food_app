class Food {
  final String name;
  final String images;
  final int cookingTime;
  final int prepTime;
  final String description;
  final List<Instruction> instructions;

  Food({
    required this.name,
    required this.images,
    required this.cookingTime,
    required this.prepTime,
    required this.description,
    required this.instructions,
  });

  factory Food.fromJson(dynamic json) {
    return Food(
      name: json['name'] as String,
      images: json['thumbnail_url'] as String,
      cookingTime: json['cook_time_minutes'] as int,
      prepTime: json['prep_time_minutes'] as int,
      description: json['description'] as String,
      instructions: List<Instruction>.from(
          json["instructions"].map((x) => Instruction.fromJson(x))),
    );
  }

  static List<Food> foodFromSnapshot(List snapshot) {
    return snapshot.map((data) => Food.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'Food{name: $name, images: $images, cookingTime: $cookingTime, prepTime: $prepTime, description: $description, instructions: $instructions}';
  }
}

class Instruction {
  final String displayText;

  Instruction({required this.displayText});

  factory Instruction.fromJson(Map<String, dynamic> json) {
    return Instruction(displayText: json['display_text'] as String);
  }
}
