import 'package:json_annotation/json_annotation.dart';

import 'base-model.dart';
part 'person.g.dart';

@JsonSerializable()
class Person extends BaseModel {
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime birthDate;
  final String contactNumber;
  final String emailAddress;
  final String country;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Person(
      {required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.birthDate,
      required this.contactNumber,
      required this.emailAddress,
      required this.country,
      required super.id});
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
