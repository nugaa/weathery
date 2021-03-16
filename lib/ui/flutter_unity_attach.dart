import 'package:flutter/material.dart';
import 'package:flutter_unity/flutter_unity.dart';

import '../api_data_bloc.dart';

class FlutterUnityAttach extends StatefulWidget {
  FlutterUnityAttach({this.condition, this.temperature, this.weather});
  final String condition;
  final String temperature;
  final String weather;
  @override
  _FlutterUnityAttachState createState() => _FlutterUnityAttachState();
}

class _FlutterUnityAttachState extends State<FlutterUnityAttach> {
  UnityViewController unityViewController;
  DataBloc _dataBloc = DataBloc();
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
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          widget.weather,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          widget.temperature,
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
              )),
          Expanded(
            flex: 3,
            child: UnityView(
              onCreated: onUnityViewCreated,
              onReattached: onUnityViewReattached,
              onMessage: onUnityViewMessage,
            ),
          ),
        ],
      ),
    );
  }

  void onUnityViewCreated(UnityViewController controller) {
    print('onUnityViewCreated');
    //sunclouds ; rain ; clearsun
    unityViewController = controller;
    controller.send(
        'CameraRotator/Main Camera', 'SetActiveObj', widget.condition);
  }

  void onUnityViewReattached(UnityViewController controller) {
    print('onUnityViewReattached');
  }

  void onUnityViewMessage(UnityViewController controller, String message) {
    print('onUnityViewMessage');
    print(message);
  }
}
