import 'dart:io';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:http/http.dart' as http;

class ResponseData<T> {
  final int statusCode;
  final String message;
  final T data;

  ResponseData(
      {required this.statusCode, required this.message, required this.data});
}

abstract class IHttpService {
  Future<http.Response> Get(String endpoint);
  Future<http.Response> Post(String endpoint, dynamic body);
  Future<http.Response> Put(String endpoint, dynamic body);
  Future<http.Response> Delete(String endpoint, dynamic body);
}

class HttpService extends IHttpService {
  String baseUrl = "";
  String apimKey = "";
  dynamic headers;

  HttpService() {
    baseUrl = FlavorConfig.instance.variables["baseUrl"];
  }

  @override
  Future<http.Response> Get(String endpoint) async {
    return await http.get(Uri.parse(baseUrl + endpoint), headers: headers);
  }

  @override
  Future<http.Response> Delete(String endpoint, dynamic body) async =>
      await http.delete(Uri(host: baseUrl, path: endpoint),
          body: body, headers: headers);

  @override
  Future<http.Response> Post(String endpoint, dynamic body) async {
    return await http.post(Uri(host: baseUrl, path: endpoint),
        body: body, headers: headers);
  }

  @override
  Future<http.Response> Put(String endpoint, dynamic body) async {
    return await http.put(Uri(host: baseUrl, path: endpoint),
        body: body, headers: headers);
  }
}
