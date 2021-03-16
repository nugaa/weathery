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
          await listData('2740636');
          break;
        case CityName.Faro:
          await listData('2268337');
          break;
        case CityName.Leiria:
          await listData('2267094');
          break;
        case CityName.Lisboa:
          await listData('2267056');
          break;
        case CityName.Porto:
          await listData('2735941');
          break;
      }
    });
  }

  void dispose() {
    _eventController.close();
    _getDataController.close();
  }
}
