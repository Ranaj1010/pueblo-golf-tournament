import 'package:pueblo_golf_tournament_mobile/base/base-dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person-dto.g.dart';

@JsonSerializable()
class PersonDto extends BaseDto {
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime birthDate;
  final String contactNumber;
  final String homeAddress;
  final String city;
  final String emailAddress;
  final String country;
  PersonDto({
    required super.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.birthDate,
    required this.contactNumber,
    required this.homeAddress,
    required this.city,
    required this.emailAddress,
    required this.country,
  });

  factory PersonDto.fromJson(Map<String, dynamic> json) =>
      _$PersonDtoFromJson(json);
  Map<String, dynamic> toJson() => _$PersonDtoToJson(this);
}
