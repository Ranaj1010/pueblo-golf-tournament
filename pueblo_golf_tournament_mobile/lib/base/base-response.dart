import 'package:get/get.dart';

abstract class BaseResponse extends Response {
  final String message;

  BaseResponse({
    required this.message,
  });
}
