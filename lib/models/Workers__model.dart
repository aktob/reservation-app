class Worker {
  final int id;
  final String name;
  final String? workEmail;
  final String? workPhone;
  final String? mobilePhone;
  final int? regionId;
  final String? regionName;
  final String availabilityStatus;
  final double cumulativeRating;
  final List<Skill> skills;
  final bool isDriver;
  final int? housingUnitId;
  final String? housingUnitName;

  Worker({
    required this.id,
    required this.name,
    this.workEmail,
    this.workPhone,
    this.mobilePhone,
    this.regionId,
    this.regionName,
    required this.availabilityStatus,
    required this.cumulativeRating,
    required this.skills,
    required this.isDriver,
    this.housingUnitId,
    this.housingUnitName,
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      id: json['id'],
      name: json['name'],
      workEmail: json['work_email'] == false ? null : json['work_email'],
      workPhone: json['work_phone'] == false ? null : json['work_phone'],
      mobilePhone: json['mobile_phone'] == false ? null : json['mobile_phone'],
      regionId: json['region_id'] == false ? null : json['region_id'],
      regionName: json['region_name'] == false ? null : json['region_name'],
      availabilityStatus: json['availability_status'],
      cumulativeRating: (json['cumulative_rating'] as num).toDouble(),
      skills: (json['skills'] as List)
          .map((skillJson) => Skill.fromJson(skillJson))
          .toList(),
      isDriver: json['is_driver'],
      housingUnitId: json['housing_unit_id'] == false ? null : json['housing_unit_id'],
      housingUnitName: json['housing_unit_name'] == false ? null : json['housing_unit_name'],
    );
  }
}


class Skill {
  final int id;
  final String name;
  final String category;

  Skill({
    required this.id,
    required this.name,
    required this.category,
  });

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      id: json['id'],
      name: json['name'],
      category: json['category'],
    );
  }
}