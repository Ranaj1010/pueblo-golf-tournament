import 'package:json_annotation/json_annotation.dart';
import 'package:pueblo_golf_tournament_mobile/models/base-model.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';
part 'person-dto.g.dart';

@JsonSerializable()
class PersonDto extends BaseModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime birthDate;
  final String contactNumber;
  final String emailAddress;
  final String country;

  factory PersonDto.fromJson(Map<String, dynamic> json) =>
      _$PersonDtoFromJson(json);

  PersonDto(
      {required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.birthDate,
      required this.contactNumber,
      required this.emailAddress,
      required this.country,
      required super.id});
  Map<String, dynamic> toJson() => _$PersonDtoToJson(this);
}
