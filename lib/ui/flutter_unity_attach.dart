import 'package:flutter/material.dart';
import 'package:flutter_unity/flutter_unity.dart';
import 'package:weathery/services/city_weather_data.dart';

class FlutterUnityAttach extends StatefulWidget {
  FlutterUnityAttach({this.idString, this.cityName});
  final String idString;
  final String cityName;
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
        title: Text('Weather in ${widget.cityName}'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xff003859),
      body: FutureBuilder(
        future: _cityWeatherData.getCityById(widget.idString),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return _OnWaiting();
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
              Flexible(
                child: UnityView(
                  onCreated: onUnityViewCreated,
                  onReattached: onUnityViewReattached,
                  onMessage: onUnityViewMessage,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void onUnityViewCreated(UnityViewController controller) {
    print('onUnityViewCreated');
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

class _OnWaiting extends StatelessWidget {
  const _OnWaiting({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80.0,
            color: Colors.blueGrey.withOpacity(0.9),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Text(
              'Something went wrong...',
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
}
