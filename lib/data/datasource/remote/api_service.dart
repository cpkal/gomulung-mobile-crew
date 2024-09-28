// data/datasource/remote/api_service.dart
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static String _baseUrl = 'http://10.0.2.2:3000/api/v1/crews';

  static Future<http.Response> fetchData(String endpoint) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static Future<http.Response> postData(
      String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.post(
      url,
      body: data,
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to post data');
    }
  }

  static Future<http.Response> putData(
      String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.put(
      url,
      body: data,
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to put data');
    }
  }

  static Future<http.Response> deleteData(String endpoint) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to delete data');
    }
  }

  //file uploads
  static Future<http.Response> postFile(
      String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl/$endpoint');
    final request = http.MultipartRequest('POST', url);

    data.forEach((key, value) {
      request.files.add(http.MultipartFile.fromBytes(
        key,
        value,
        filename: key,
      ));
    });

    print(data);

    final response = await request.send();

    print(response);

    if (response.statusCode == 200) {
      return http.Response.fromStream(response);
    } else {
      throw Exception('Failed to post file');
    }
  }
}
