import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final double id;
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime birthDate;
  final String contactNumber;
  final String emailAddress;
  final String country;

  Person(
      {required this.id,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.birthDate,
      required this.contactNumber,
      required this.emailAddress,
      required this.country});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
