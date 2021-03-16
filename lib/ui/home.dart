import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathery/api_data_bloc.dart';
import 'package:weathery/ui/flutter_unity_attach.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final DataBloc _dataBloc = DataBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff003859),
                Color(0xff02466d),
                Color(0xff055582),
                Color(0xff076598),
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder(
                stream: Stream.periodic(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat('dd-MM-yyyy').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          DateFormat('Hms').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  CityCard(
                    cityName: 'Coimbra',
                    onPress: () async {
                      _dataBloc.eventSink.add(CityName.Coimbra);
                      var weatherData = _dataBloc.receiveData;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlutterUnityAttach(
                            temperature: weatherData[0],
                            weather: weatherData[1],
                            condition: weatherData[2],
                          ),
                        ),
                      );
                    },
                  ),
                  CityCard(
                    cityName: 'Faro',
                    onPress: () {
                      _dataBloc.eventSink.add(CityName.Faro);
                      var weatherData = _dataBloc.receiveData;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlutterUnityAttach(
                            temperature: weatherData[0],
                            weather: weatherData[1],
                            condition: weatherData[2],
                          ),
                        ),
                      );
                    },
                  ),
                  CityCard(
                    cityName: 'Leiria',
                    onPress: () {
                      _dataBloc.eventSink.add(CityName.Leiria);
                      var weatherData = _dataBloc.receiveData;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlutterUnityAttach(
                            temperature: weatherData[0],
                            weather: weatherData[1],
                            condition: weatherData[2],
                          ),
                        ),
                      );
                    },
                  ),
                  CityCard(
                    cityName: 'Lisboa',
                    onPress: () {
                      _dataBloc.eventSink.add(CityName.Lisboa);
                      var weatherData = _dataBloc.receiveData;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlutterUnityAttach(
                            temperature: weatherData[0],
                            weather: weatherData[1],
                            condition: weatherData[2],
                          ),
                        ),
                      );
                    },
                  ),
                  CityCard(
                    cityName: 'Porto',
                    onPress: () async {
                      _dataBloc.eventSink.add(CityName.Porto);
                      var weatherData = _dataBloc.receiveData;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FlutterUnityAttach(
                            temperature: weatherData[0],
                            weather: weatherData[1],
                            condition: weatherData[2],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  const CityCard({
    Key key,
    String cityName,
    Function onPress,
  })  : _cityName = cityName,
        _onPress = onPress,
        super(key: key);

  final String _cityName;
  final Function _onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.only(left: 12.0),
          alignment: Alignment.centerLeft,
          height: 60.0,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white24,
                Colors.white54,
                Colors.white60,
                Colors.white70
              ],
            ),
            shadows: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 2.0,
                blurRadius: 4.0,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _cityName,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.search,
                  size: 40.0,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
