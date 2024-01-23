// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model_@.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VehicleModelCWProxy {
  VehicleModel brand(String brand);

  VehicleModel model(String model);

  VehicleModel zeroToHundred(double zeroToHundred);

  VehicleModel energyClass(String energyClass);

  VehicleModel power(int power);

  VehicleModel speed(int speed);

  VehicleModel picture(String picture);

  VehicleModel location(String location);

  VehicleModel price(double price);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VehicleModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VehicleModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VehicleModel call({
    String? brand,
    String? model,
    double? zeroToHundred,
    String? energyClass,
    int? power,
    int? speed,
    String? picture,
    String? location,
    double? price,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVehicleModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVehicleModel.copyWith.fieldName(...)`
class _$VehicleModelCWProxyImpl implements _$VehicleModelCWProxy {
  const _$VehicleModelCWProxyImpl(this._value);

  final VehicleModel _value;

  @override
  VehicleModel brand(String brand) => this(brand: brand);

  @override
  VehicleModel model(String model) => this(model: model);

  @override
  VehicleModel zeroToHundred(double zeroToHundred) =>
      this(zeroToHundred: zeroToHundred);

  @override
  VehicleModel energyClass(String energyClass) =>
      this(energyClass: energyClass);

  @override
  VehicleModel power(int power) => this(power: power);

  @override
  VehicleModel speed(int speed) => this(speed: speed);

  @override
  VehicleModel picture(String picture) => this(picture: picture);

  @override
  VehicleModel location(String location) => this(location: location);

  @override
  VehicleModel price(double price) => this(price: price);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VehicleModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VehicleModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VehicleModel call({
    Object? brand = const $CopyWithPlaceholder(),
    Object? model = const $CopyWithPlaceholder(),
    Object? zeroToHundred = const $CopyWithPlaceholder(),
    Object? energyClass = const $CopyWithPlaceholder(),
    Object? power = const $CopyWithPlaceholder(),
    Object? speed = const $CopyWithPlaceholder(),
    Object? picture = const $CopyWithPlaceholder(),
    Object? location = const $CopyWithPlaceholder(),
    Object? price = const $CopyWithPlaceholder(),
  }) {
    return VehicleModel(
      brand: brand == const $CopyWithPlaceholder() || brand == null
          ? _value.brand
          // ignore: cast_nullable_to_non_nullable
          : brand as String,
      model: model == const $CopyWithPlaceholder() || model == null
          ? _value.model
          // ignore: cast_nullable_to_non_nullable
          : model as String,
      zeroToHundred:
          zeroToHundred == const $CopyWithPlaceholder() || zeroToHundred == null
              ? _value.zeroToHundred
              // ignore: cast_nullable_to_non_nullable
              : zeroToHundred as double,
      energyClass:
          energyClass == const $CopyWithPlaceholder() || energyClass == null
              ? _value.energyClass
              // ignore: cast_nullable_to_non_nullable
              : energyClass as String,
      power: power == const $CopyWithPlaceholder() || power == null
          ? _value.power
          // ignore: cast_nullable_to_non_nullable
          : power as int,
      speed: speed == const $CopyWithPlaceholder() || speed == null
          ? _value.speed
          // ignore: cast_nullable_to_non_nullable
          : speed as int,
      picture: picture == const $CopyWithPlaceholder() || picture == null
          ? _value.picture
          // ignore: cast_nullable_to_non_nullable
          : picture as String,
      location: location == const $CopyWithPlaceholder() || location == null
          ? _value.location
          // ignore: cast_nullable_to_non_nullable
          : location as String,
      price: price == const $CopyWithPlaceholder() || price == null
          ? _value.price
          // ignore: cast_nullable_to_non_nullable
          : price as double,
    );
  }
}

extension $VehicleModelCopyWith on VehicleModel {
  /// Returns a callable class that can be used as follows: `instanceOfVehicleModel.copyWith(...)` or like so:`instanceOfVehicleModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VehicleModelCWProxy get copyWith => _$VehicleModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      brand: json['brand'] as String,
      model: json['model'] as String,
      zeroToHundred: (json['zeroToHundred'] as num).toDouble(),
      energyClass: json['energyClass'] as String,
      power: json['power'] as int,
      speed: json['speed'] as int,
      picture: json['picture'] as String,
      location: json['location'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
      'zeroToHundred': instance.zeroToHundred,
      'energyClass': instance.energyClass,
      'power': instance.power,
      'speed': instance.speed,
      'picture': instance.picture,
      'location': instance.location,
      'price': instance.price,
    };
