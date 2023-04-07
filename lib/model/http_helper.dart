import 'package:weather/model/player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?lat=28.4595&lon=77.0266&appid=e77e558e80f3b53249ddb36c055b14f9
  //https://api.openweathermap.org/data/2.5/weather?q=Gurgaon&appid=e77e558e80f3b53249ddb36c055b14f9
  final String authority = 'api.cricapi.com';
  final String playerPath = 'v1/players';
  final String apiKey = '';

  Future<Player> getPlayerInfo(String location) async {
    Map<String, dynamic> parameter = {
      // 'lat': latitude,
      // 'lon': longitude,
      'apikey': apiKey,
      'offset': '0',
      'search': location
    };

    Uri uri = Uri.https(authority, playerPath, parameter);
    http.Response result = await http.get(uri);
    // print(result.body);
    Map<String, dynamic> data = json.decode(result.body);
    Player cricketData = Player.fromJson(data);
    // print(result.body);
    //return result.body;
    // print(data);
    return cricketData;
  }

  Future<Player> getMatchListInfo() async {
    Map<String, dynamic> parameter = {
      // 'lat': latitude,
      // 'lon': longitude,
      'apikey': apiKey,
      'offset': '0',
    };

    Uri uri = Uri.https(authority, playerPath, parameter);
    http.Response result = await http.get(uri);
    // print(result.body);
    Map<String, dynamic> data = json.decode(result.body);
    Player cricketData = Player.fromJson(data);
    // print(result.body);
    //return result.body;
    // print(data);
    return cricketData;
  }

  Future<Player> getMatchInfo(String id) async {
    Map<String, dynamic> parameter = {
      // 'lat': latitude,
      // 'lon': longitude,
      'apikey': apiKey,
      'offset': '0',
      'id': id
    };

    Uri uri = Uri.https(authority, playerPath, parameter);
    http.Response result = await http.get(uri);
    // print(result.body);
    Map<String, dynamic> data = json.decode(result.body);
    Player cricketData = Player.fromJson(data);
    // print(result.body);
    //return result.body;
    // print(data);
    return cricketData;
  }
}
