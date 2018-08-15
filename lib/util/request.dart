import 'dart:async';
import 'package:http/http.dart' as http;

class Request {
  static Future<String> get(String url) async {
    http.Response res = await http.get(url);
    return res.body;
  }
}