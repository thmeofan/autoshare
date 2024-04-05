class Car {
  final String id;
  final String type;
  final String photoPath;
  final String name;
  final double price;
  final String duration;
  final String gearType;
  final int year;
  final int horsepower;
  final String color;

  Car({
    required this.id,
    required this.type,
    required this.photoPath,
    required this.name,
    required this.price,
    this.duration = '',
    required this.gearType,
    required this.year,
    required this.horsepower,
    required this.color,
  });

  Car copyWith({
    String? id,
    String? type,
    String? photoPath,
    String? name,
    double? price,
    String? duration,
    String? gearType,
    int? year,
    int? horsepower,
    String? color,
  }) {
    return Car(
      id: id ?? this.id,
      type: type ?? this.type,
      photoPath: photoPath ?? this.photoPath,
      name: name ?? this.name,
      price: price ?? this.price,
      duration: duration ?? this.duration,
      gearType: gearType ?? this.gearType,
      year: year ?? this.year,
      horsepower: horsepower ?? this.horsepower,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'photoPath': photoPath,
      'name': name,
      'price': price,
      'duration': duration,
      'gearType': gearType,
      'year': year,
      'horsepower': horsepower,
      'color': color,
    };
  }

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'],
      type: json['type'],
      photoPath: json['photoPath'],
      name: json['name'],
      price: json['price'],
      duration: json['duration'],
      gearType: json['gearType'],
      year: json['year'],
      horsepower: json['horsepower'],
      color: json['color'],
    );
  }
}
