import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathery/ui/flutter_unity_attach.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('dd-MM-yyyy').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      StreamBuilder(
                          stream: Stream.periodic(const Duration(seconds: 1)),
                          builder: (context, snapshot) {
                            return Text(
                              DateFormat('Hms').format(DateTime.now()),
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            );
                          }),
                    ]),
              ),
              Column(
                children: [
                  CityCard(
                    cityName: 'Coimbra',
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FlutterUnityAttach(
                            idString: '2740636',
                            cityName: 'Coimbra',
                          ),
                        ),
                      );
                    },
                  ),
                  CityCard(
                    cityName: 'Faro',
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FlutterUnityAttach(
                            idString: '2268337',
                            cityName: 'Faro',
                          ),
                        ),
                      );
                    },
                  ),
                  CityCard(
                    cityName: 'Leiria',
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FlutterUnityAttach(
                            idString: '2267094',
                            cityName: 'Leiria',
                          ),
                        ),
                      );
                    },
                  ),
                  CityCard(
                    cityName: 'Lisboa',
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FlutterUnityAttach(
                            idString: '2267056',
                            cityName: 'Lisboa',
                          ),
                        ),
                      );
                    },
                  ),
                  CityCard(
                    cityName: 'Porto',
                    onPress: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FlutterUnityAttach(
                              idString: '2735941', cityName: 'Porto'),
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
            color: Color(0xff076598).withOpacity(0.6),
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
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  _cityName,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.search,
                  size: 40.0,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// gradient: LinearGradient(
// begin: Alignment.bottomCenter,
// end: Alignment.topCenter,
// colors: [
// Colors.white24,
// Colors.white54,
// Colors.white60,
// Colors.white70
// ],
// ),
