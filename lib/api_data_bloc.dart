import 'dart:async';

import 'package:flutter_unity/flutter_unity.dart';
import 'package:weathery/services/city_weather_data.dart';

enum CityName {
  Coimbra,
  Faro,
  Leiria,
  Lisboa,
  Porto,
}

class DataBloc {
  CityWeatherData _cityWeatherData = CityWeatherData();
  StreamController _eventController = StreamController();
  StreamSink get eventSink => _eventController.sink;
  Stream get eventStream => _eventController.stream;

  StreamController _getDataController = StreamController.broadcast();
  StreamSink get getDataSink => _getDataController.sink;
  Stream get getDataStream => _getDataController.stream;

  UnityViewController unityViewController;
  String condition;
  List listOfData = [];
  List _receiveData = [];
  List get receiveData => _receiveData;
  Future listData(String id) async {
    _receiveData = await _cityWeatherData.getCityById(id);
  }

  DataBloc() {
    eventStream.listen((event) async {
      switch (event) {
        case CityName.Coimbra:
          var getWeather = await listData('2740636');
          print('GETWEATHER: $getWeather\n'
              'LISTOFDATA: $listOfData');
          break;
        case CityName.Faro:
          var getWeather = await listData('2268337');
          print('GETWEATHER: $getWeather\n'
              'LISTOFDATA: $listOfData');
          break;
        case CityName.Leiria:
          var getWeather = await listData('2267094');
          print('GETWEATHER: $getWeather\n'
              'LISTOFDATA: $listOfData');
          break;
        case CityName.Lisboa:
          var getWeather = await listData('2267056');
          print('GETWEATHER: $getWeather\n'
              'LISTOFDATA: $listOfData');
          break;
        case CityName.Porto:
          var getWeather = await listData('2735941');
          print('GETWEATHER: $getWeather\n'
              'LISTOFDATA: $listOfData');
          break;
      }
    });
  }

  void dispose() {
    _eventController.close();
    _getDataController.close();
  }
}
