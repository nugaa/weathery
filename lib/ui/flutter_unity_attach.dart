import 'package:flutter/material.dart';
import 'package:flutter_unity/flutter_unity.dart';
import 'package:weathery/services/city_weather_data.dart';

class FlutterUnityAttach extends StatefulWidget {
  FlutterUnityAttach(this.idString);
  final String idString;
  @override
  _FlutterUnityAttachState createState() => _FlutterUnityAttachState();
}

class _FlutterUnityAttachState extends State<FlutterUnityAttach> {
  UnityViewController unityViewController;
  CityWeatherData _cityWeatherData = CityWeatherData();
  var weatherData;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Color(0xff003859),
        body: FutureBuilder(
            future: _cityWeatherData.getCityById(widget.idString),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: Text(
                          'Verifique a sua ligação à Internet...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
              weatherData = snapshot.data;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              weatherData[1],
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              weatherData[0],
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: UnityView(
                      onCreated: onUnityViewCreated,
                      onReattached: onUnityViewReattached,
                      onMessage: onUnityViewMessage,
                    ),
                  ),
                ],
              );
            }));
  }

  void onUnityViewCreated(UnityViewController controller) {
    print('onUnityViewCreated');
    //sunclouds ; rain ; clearsun
    unityViewController = controller;
    controller.send(
        'CameraRotator/Main Camera', 'SetActiveObj', weatherData[2]);
  }

  void onUnityViewReattached(UnityViewController controller) {
    print('onUnityViewReattached');
  }

  void onUnityViewMessage(UnityViewController controller, String message) {
    print('onUnityViewMessage');
    print(message);
  }
}
