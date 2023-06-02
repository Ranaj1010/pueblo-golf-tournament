import 'package:json_annotation/json_annotation.dart';

part 'register-person-request-dto.g.dart';

@JsonSerializable()
class ReqisterPersonRequesDto {
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime birthDate;
  final String contactNumber;
  final String homeAddress;
  final String city;
  final String emailAddress;
  final String country;

  ReqisterPersonRequesDto(
      {required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.birthDate,
      required this.contactNumber,
      required this.emailAddress,
      required this.homeAddress,
      required this.city,
      required this.country});
  factory ReqisterPersonRequesDto.fromJson(Map<String, dynamic> json) =>
      _$ReqisterPersonRequesDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ReqisterPersonRequesDtoToJson(this);
}
