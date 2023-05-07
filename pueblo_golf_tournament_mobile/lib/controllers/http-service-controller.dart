import 'package:http/http.dart' as http;
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class IHttpService {
  Future<http.Response> Get(String endpoint);
  Future<http.Response> Post(String endpoint, dynamic body);
  Future<http.Response> Put(String endpoint, dynamic body);
  Future<http.Response> Delete(String endpoint, dynamic body);
}

class HttpServiceController extends GetxController with IHttpService {
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
    var url = Uri.http('localhost:5064', endpoint);
    return await http.post(url, body: body, headers: headers);
  }

  @override
  Future<http.Response> Put(String endpoint, dynamic body) async {
    return await http.put(Uri(host: baseUrl, path: endpoint),
        body: body, headers: headers);
  }
}
