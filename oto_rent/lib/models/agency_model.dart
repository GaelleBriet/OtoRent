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
}