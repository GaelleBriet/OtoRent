class AgencyModel {
  final int? id;
  final String? name;
  final String? address;
  final String? email;
  final String? phone;
  final double? latitude;
  final double? longitude;

  const AgencyModel({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
    required this.latitude,
    required this.longitude,
  });

  factory AgencyModel.fromJson(Map<String, dynamic> json) {
    return AgencyModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      email: json['email'],
      phone: json['phone'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  AgencyModel copyWith({
    int? id,
    String? name,
    String? address,
    String? email,
    String? phone,
    double? latitude,
    double? longitude,
  }) {
    return AgencyModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}