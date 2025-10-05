// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_specillization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorSpecializationModel _$DoctorSpecializationModelFromJson(
  Map<String, dynamic> json,
) => DoctorSpecializationModel(
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => SpecializationData.fromJson(e as Map<String, dynamic>))
      .toList(),
  status: json['status'] as bool,
  code: (json['code'] as num).toInt(),
);

Map<String, dynamic> _$DoctorSpecializationModelToJson(
  DoctorSpecializationModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'data': instance.data.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'code': instance.code,
};

SpecializationData _$SpecializationDataFromJson(Map<String, dynamic> json) =>
    SpecializationData(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationDataToJson(SpecializationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'doctors': instance.doctors.map((e) => e.toJson()).toList(),
    };

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  photo: json['photo'] as String,
  gender: json['gender'] as String,
  address: json['address'] as String,
  description: json['description'] as String,
  degree: json['degree'] as String,
  specialization: Specialization.fromJson(
    json['specialization'] as Map<String, dynamic>,
  ),
  city: City.fromJson(json['city'] as Map<String, dynamic>),
  appointPrice: (json['appoint_price'] as num).toInt(),
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
);

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'photo': instance.photo,
  'gender': instance.gender,
  'address': instance.address,
  'description': instance.description,
  'degree': instance.degree,
  'specialization': instance.specialization.toJson(),
  'city': instance.city.toJson(),
  'appoint_price': instance.appointPrice,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
};

Specialization _$SpecializationFromJson(Map<String, dynamic> json) =>
    Specialization(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$SpecializationToJson(Specialization instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

City _$CityFromJson(Map<String, dynamic> json) => City(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  governrate: Governrate.fromJson(json['governrate'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'governrate': instance.governrate.toJson(),
};

Governrate _$GovernrateFromJson(Map<String, dynamic> json) =>
    Governrate(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$GovernrateToJson(Governrate instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
