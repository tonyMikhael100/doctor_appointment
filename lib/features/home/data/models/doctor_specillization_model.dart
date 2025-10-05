import 'package:json_annotation/json_annotation.dart';

part 'doctor_specillization_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DoctorSpecializationModel {
  final String message;
  final List<SpecializationData> data;
  final bool status;
  final int code;

  DoctorSpecializationModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory DoctorSpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorSpecializationModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorSpecializationModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SpecializationData {
  final int id;
  final String name;
  final List<Doctor> doctors;

  SpecializationData({
    required this.id,
    required this.name,
    required this.doctors,
  });

  factory SpecializationData.fromJson(Map<String, dynamic> json) =>
      _$SpecializationDataFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Doctor {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final Specialization specialization;
  final City city;

  @JsonKey(name: 'appoint_price')
  final int appointPrice;

  @JsonKey(name: 'start_time')
  final String startTime;

  @JsonKey(name: 'end_time')
  final String endTime;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}

@JsonSerializable()
class Specialization {
  final int id;
  final String name;

  Specialization({required this.id, required this.name});

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class City {
  final int id;
  final String name;
  final Governrate governrate;

  City({required this.id, required this.name, required this.governrate});

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}

@JsonSerializable()
class Governrate {
  final int id;
  final String name;

  Governrate({required this.id, required this.name});

  factory Governrate.fromJson(Map<String, dynamic> json) =>
      _$GovernrateFromJson(json);

  Map<String, dynamic> toJson() => _$GovernrateToJson(this);
}
