import 'package:weathery/services/networking.dart';

const String openWeatherUrl = 'http://api.openweathermap.org/data/2.5/weather';
const String apiKey = '8b555328cd72a4d8abeb070e965abfc5';

class CityWeatherData {
  Future<List> getCityById(String cityId) async {
    int temperature;
    String weather;
    int conditionInteger;
    List listData = [];
    try {
      var url =
          '$openWeatherUrl?id=$cityId&&units=metric&lang=pt&APPID=$apiKey';
      Networking _networking = Networking(url: url);
      var weatherData = await _networking.getData();
      if (weatherData != null && weatherData != "") {
        var temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        weather = weatherData['weather'][0]['main'];
        conditionInteger = weatherData['weather'][0]['id'];
      }
      String condition;
      if (conditionInteger > 499 && conditionInteger < 600) {
        condition = 'rain';
      } else if (conditionInteger == 800) {
        condition = 'clearsun';
      } else if (conditionInteger > 800) {
        condition = 'sunclouds';
      }
      listData = ['$temperature°C', weather, condition];
    } on Exception catch (e) {
      print('Something went wrong. Message: $e.');
    }
    return listData;
  }
}
