import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL =
      'https://studentapi20200625220726.azurewebsites.net/';
}

class ApiService {
  static Future<List<dynamic>> getEmployees() async {
    final response = await http.get('${URLS.BASE_URL}');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> addEmployee(body) async {
    final response = await http.post(
      '${URLS.BASE_URL}',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF8',
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
