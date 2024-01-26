class VehicleModel {
  final int? id;
  final String? mark;
  final String? model;
  final double? zeroTo100;
  final String? ecoClass;
  final int? topSpeed;
  final int? power;
  final String? imageUrl;
  final int? price;
  final int? agencyId;

  const VehicleModel({
    this.id,
    this.mark,
    this.model,
    this.zeroTo100,
    this.ecoClass,
    this.topSpeed,
    this.power,
    this.imageUrl,
    this.price,
    this.agencyId,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      mark: json['mark'],
      model: json['model'],
      zeroTo100: json['zeroto100'],
      ecoClass: json['ecoclass'],
      power: json['power'],
      topSpeed: json['topspeed'],
      imageUrl: json['picture'],
      price: json['price'],
      agencyId: json['agency_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mark': mark,
      'model': model,
      'zeroto100': zeroTo100,
      'ecoclass': ecoClass,
      'power': power,
      'topspeed': topSpeed,
      'picture': imageUrl,
      'price': price,
      'agency_id': agencyId,
    };
  }
}
