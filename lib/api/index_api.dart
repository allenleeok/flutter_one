import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class IndexApi {
  var jsonData = Map();
  Future<OneData> getSpeakers(http.Client client) async {
    await _requestOneList();
    return OneData.fromJson(jsonData);
  }

  _requestOneList() async {
    var response = await http.read("http://v3.wufazhuce.com:8000/api/channel/one/0/%E5%8C%97%E4%BA%AC%E5%B8%82?platform=ios&sign=eabeae5443aec1ad61371b35131a00fb&user_id=1239999&uuid=3026868B-C067-49AB-BE99-E958D650E267&version=v4.5.5");
    jsonData = json.decode(response).data;
  }
}

class OneData {
  final int res;
  final Map data;

  OneData({this.res, this.data});

  factory OneData.fromJson(Map<String, dynamic> json) {
    return OneData(
      res: json['res'] as int,
      data: json['data'] as Map,
    );
  }
}