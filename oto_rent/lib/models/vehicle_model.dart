class VehicleModel {
  final String? brand;
  final String? model;
  final double? zeroTo100;
  final String? energyClass;
  final int? power;
  final int? topSpeed;
  final String? imageUrl;
  final String? location;
  final double? price;

  const VehicleModel({
    this.brand,
    this.model,
    this.zeroTo100,
    this.energyClass,
    this.power,
    this.topSpeed,
    this.imageUrl,
    this.location,
    this.price,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      brand: json['mark'],
      model: json['model'],
      zeroTo100: json['zeroto100'],
      energyClass: json['energyClass'],
      power: json['power'],
      topSpeed: json['topspeed'],
      imageUrl: json['pic'],
      location: json['location'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mark': brand,
      'model': model,
      'zeroto100': zeroTo100,
      'energyClass': energyClass,
      'power': power,
      'topspeed': topSpeed,
      'pic': imageUrl,
      'location': location,
      'price': price,
    };
  }

  @override
  String toString() {
    return 'VehicleModel(brand: $brand, model: $model, location: $location, price: $price)';
  }

  VehicleModel copyWith({
    String? brand,
    String? model,
    double? zeroTo100,
    String? energyClass,
    int? power,
    int? topSpeed,
    String? imageUrl,
    String? location,
    double? price,
  }) {
    return VehicleModel(
      brand: brand ?? this.brand,
      model: model ?? this.model,
      zeroTo100: zeroTo100 ?? this.zeroTo100,
      energyClass: energyClass ?? this.energyClass,
      power: power ?? this.power,
      topSpeed: topSpeed ?? this.topSpeed,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      price: price ?? this.price,
    );
  }
}
