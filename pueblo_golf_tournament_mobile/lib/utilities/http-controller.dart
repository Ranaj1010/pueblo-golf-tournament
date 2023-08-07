import 'dart:io';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

mixin HttpServiceMixin {
  // do some stuff
  Future<http.Response> get(String endpoint);
  Future<http.Response> post(String endpoint, dynamic body);
  Future<http.Response> put(String endpoint, dynamic body);
  Future<http.Response> delete(String endpoint, dynamic body);
  Future<http.StreamedResponse> upload(
      String endpoint, String fileField, File file, Map<String, String> fields);
  Future<http.StreamedResponse> uploadFromByes(
      String endpoint,
      String fileField,
      List<int> file,
      String fileName,
      Map<String, String> fields);
}

class HttpController extends GetxController with HttpServiceMixin {
  String baseUrl = "";
  String apimKey = "";
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  HttpController() {
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

  @override
  Future<http.StreamedResponse> upload(String endpoint, String fileField,
      File file, Map<String, String> fields) async {
    var filePath = await http.MultipartFile.fromPath(fileField, file.path);
    var request = http.MultipartRequest("POST", Uri.http(baseUrl, endpoint));

    fields.forEach((key, value) {
      request.fields[key] = value;
    });

    request.files.add(filePath);
    var response = await request.send();
    return response;
  }

  @override
  Future<http.StreamedResponse> uploadFromByes(
      String endpoint,
      String fileField,
      List<int> file,
      String fileName,
      Map<String, String> fields) async {
    var filePath =
        http.MultipartFile.fromBytes(fileField, file, filename: fileName);
    var request = http.MultipartRequest("POST", Uri.http(baseUrl, endpoint));

    fields.forEach((key, value) {
      request.fields[key] = value;
    });

    request.files.add(filePath);
    var response = await request.send();
    return response;
  }
}
