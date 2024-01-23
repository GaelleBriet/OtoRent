class VehicleModel {
  final String brand;
  final String model;
  final double zeroToHundred;
  final String energyClass;
  final int power;
  final int speed;
  final String picture;
  final String location;
  final double price;

  String get description =>
      "Le véhicule est un(e) $brand ($model), il accélère de 0 à 100 km/h en $zeroToHundred secondes, est de classe énergétique $energyClass, a une puissance de $power chevaux, peut atteindre une vitesse de $speed km/h, et est disponible à $location pour $price € par jour.";

  VehicleModel(
      {required this.brand,
      required this.model,
      required this.zeroToHundred,
      required this.energyClass,
      required this.power,
      required this.speed,
      required this.picture,
      required this.location,
      required this.price});

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      brand: json['brand'],
      model: json['model'],
      zeroToHundred: json['zeroToHundred'],
      energyClass: json['energyClass'],
      power: json['power'],
      speed: json['speed'],
      picture: json['picture'],
      location: json['location'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand'] = brand;
    data['model'] = model;
    data['zeroToHundred'] = zeroToHundred;
    data['energyClass'] = energyClass;
    data['power'] = power;
    data['speed'] = speed;
    data['picture'] = picture;
    data['location'] = location;
    data['price'] = price;
    return data;
  }

  VehicleModel copyWith({
    String? brand,
    String? model,
    double? zeroToHundred,
    String? energyClass,
    int? power,
    int? speed,
    String? picture,
    String? location,
    double? price,
  }) {
    return VehicleModel(
      brand: brand ?? this.brand,
      model: model ?? this.model,
      zeroToHundred: zeroToHundred ?? this.zeroToHundred,
      energyClass: energyClass ?? this.energyClass,
      power: power ?? this.power,
      speed: speed ?? this.speed,
      picture: picture ?? this.picture,
      location: location ?? this.location,
      price: price ?? this.price,
    );
  }

  @override
  String toString() {
    return description;
  }
}
