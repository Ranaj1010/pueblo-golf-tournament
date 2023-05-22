import 'dart:io';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

mixin HttpServiceMixin {
  // do some stuff
  Future<http.Response> get(String endpoint);
  Future<http.Response> post(String endpoint, dynamic body);
  Future<http.Response> put(String endpoint, dynamic body);
  Future<http.Response> delete(String endpoint, dynamic body);
}

class HttpServiceController extends GetxController with HttpServiceMixin {
  String baseUrl = "";
  String apimKey = "";
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  HttpServiceController() {
    baseUrl =
        FlavorConfig.instance.variables["baseUrl"] ?? dotenv.env["BASE_URL"];
  }

  @override
  Future<http.Response> get(String endpoint) async {
    return await http
        .get(Uri.parse(baseUrl + endpoint), headers: headers)
        .timeout(const Duration(minutes: 3));
  }

  @override
  Future<http.Response> delete(String endpoint, dynamic body) async =>
      await http
          .delete(Uri(host: baseUrl, path: endpoint),
              body: body, headers: headers)
          .timeout(const Duration(minutes: 3));

  @override
  Future<http.Response> post(String endpoint, dynamic body) async {
    var url = Uri.http(baseUrl, endpoint);
    print(url);
    return await http
        .post(url, body: body, headers: headers)
        .timeout(const Duration(minutes: 3));
  }

  @override
  Future<http.Response> put(String endpoint, dynamic body) async {
    return await http
        .put(Uri(host: baseUrl, path: endpoint), body: body, headers: headers)
        .timeout(const Duration(minutes: 3));
  }
}
