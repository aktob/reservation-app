// ✅ customers_model.dart
class Customer {
  final int id;
  final String name;
  final String? email;
  final String? phone;
  final String? mobile;
  final String? street;
  final String? city;
  final String? zip;
  final int? countryId;
  final String? countryName;
  final String gpsCoordinates;
  final String contractType;
  final double cumulativeRating;

  Customer({
    required this.id,
    required this.name,
    this.email,
    this.phone,
    this.mobile,
    this.street,
    this.city,
    this.zip,
    this.countryId,
    this.countryName,
    required this.gpsCoordinates,
    required this.contractType,
    required this.cumulativeRating,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      name: json['name'],
      email: json['email'] == false ? null : json['email'],
      phone: json['phone'] == false ? null : json['phone'],
      mobile: json['mobile'] == false ? null : json['mobile'],
      street: json['street'] == false ? null : json['street'],
      city: json['city'] == false ? null : json['city'],
      zip: json['zip'] == false ? null : json['zip'],
      countryId: json['country_id'] == false ? null : json['country_id'],
      countryName: json['country_name'] == false ? null : json['country_name'],
      gpsCoordinates: json['gps_coordinates'],
      contractType: json['contract_type'],
      cumulativeRating: (json['cumulative_rating'] as num).toDouble(),
    );
  }
}