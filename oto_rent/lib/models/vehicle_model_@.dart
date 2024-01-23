// Ce fichier illustre l'utilisation des packages json_annotation et json_serializable, ainsi que du package copy_with_extension.
// Use `dart run build_runner build -d` to generate the vehicle_model_@.g.dart file.

// ⚠️ N'utilisez et n'importez qu'un seul des VehicleModel au sein du projet.

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model_@.g.dart';

@CopyWith()
@JsonSerializable()
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


  String get description =>
      "Le véhicule est un(e) $brand ($model), il accélère de 0 à 100 km/h en $zeroToHundred secondes, est de classe énergétique $energyClass, a une puissance de $power chevaux, peut atteindre une vitesse de $speed km/h, et est disponible à $location pour $price € par jour.";

  factory VehicleModel.fromJson(Map<String, dynamic> json) => _$VehicleModelFromJson(json);

  @override
  String toString() {
    return description;
  }
}
