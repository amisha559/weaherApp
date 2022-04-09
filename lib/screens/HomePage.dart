import 'dart:convert';
import 'package:adv_ass7_1/model/WeatherModel.dart';
import 'package:adv_ass7_1/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.blueAccent,
      ),
    );
    String? result = ModalRoute.of(context)!.settings.arguments as String?;

    double height = 420;
    double width = double.infinity;
    double celsius;
    double? kelvin;
    double feels_like_celsius;
    double? feels_like_kelvin;

    DateTime now = DateTime.now();

    var formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(now);

    String weekDay = DateFormat('EEEE').format(now);

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: FutureBuilder(
          future: fetchData(result: result ?? "India"),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error : ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              WeatherModel? data = snapshot.data;
              kelvin = data?.temp;
              celsius = (kelvin! - 273.15);

              feels_like_kelvin = data?.feels_like;
              feels_like_celsius = (feels_like_kelvin! - 273.15);

              return Stack(
                children: [
                  data?.main == "Clouds"
                      ? ClipPath(
                          clipper: MyClipper(),
                          child: Image.network(
                            "https://thumbs.gfycat.com/BrownIllegalChafer-size_restricted.gif",
                            height: height,
                            fit: BoxFit.cover,
                            width: width,
                          ),
                        )
                      : data?.main == "Clear"
                          ? ClipPath(
                              clipper: MyClipper(),
                              child: Image.network(
                                "https://i.gifer.com/XFbw.gif",
                                height: height,
                                fit: BoxFit.cover,
                                width: width,
                              ),
                            )
                          : data?.main == "Smoke"
                              ? ClipPath(
                                  clipper: MyClipper(),
                                  child: Image.network(
                                    "https://media1.giphy.com/media/11qpSAJ94cGuR2/giphy.gif",
                                    height: height,
                                    fit: BoxFit.cover,
                                    width: width,
                                  ),
                                )
                              : data?.main == "Haze"
                                  ? ClipPath(
                                      clipper: MyClipper(),
                                      child: Image.network(
                                        "https://media2.giphy.com/media/hsh2YGGyn7en7TcByc/200.gif",
                                        height: height,
                                        fit: BoxFit.cover,
                                        width: width,
                                      ),
                                    )
                                  : data?.main == "Snow"
                                      ? ClipPath(
                                          clipper: MyClipper(),
                                          child: Image.network(
                                            "http://25.media.tumblr.com/tumblr_md40jnIEBK1rky7juo1_500.gif",
                                            height: height,
                                            fit: BoxFit.cover,
                                            width: width,
                                          ),
                                        )
                                      : ClipPath(
                                          clipper: MyClipper(),
                                          child: Image.network(
                                            "https://c.tenor.com/5sMqxZU0224AAAAC/heavy-rain-rainy-day.gif",
                                            height: height,
                                            fit: BoxFit.cover,
                                            width: width,
                                          ),
                                        ),
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "${data?.main}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontFamily: 'nunito'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 190),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "${data?.temp} \u212A",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontFamily: 'Otoman'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 245),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "${celsius.toStringAsFixed(2)} \u2103",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Otoman'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 450),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: RichText(
                        text: TextSpan(
                            text: data?.name == "Innichen"
                                ? "India"
                                : "${data?.name}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: 'Otoman'),
                            children: [
                              TextSpan(
                                text: " (${data?.country})",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontFamily: 'Otoman'),
                              )
                            ]),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 490),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            formattedDate,
                            style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            " ($weekDay)",
                            style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 525, left: 12, right: 12),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 12, bottom: 12, left: 5, right: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 0.5,
                                ),
                              ),
                              shadowColor: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 20),
                                child: Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.temperatureHigh,
                                      color: Colors.black,
                                      size: 45,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Feels Like',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: 'nunito'),
                                          ),
                                          Text(
                                            '${feels_like_celsius.toStringAsFixed(2)} \u2103',
                                            style: const TextStyle(
                                              color: Colors.black38,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 12, bottom: 12, right: 5, left: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 0.5,
                                ),
                              ),
                              shadowColor: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 20),
                                child: Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.droplet,
                                      color: Colors.black,
                                      size: 45,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Humidity',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: 'nunito'),
                                          ),
                                          Text(
                                            '${data?.humidity} %',
                                            style: const TextStyle(
                                              color: Colors.black38,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 615, left: 12, right: 12),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 12, bottom: 12, left: 5, right: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 0.5,
                                ),
                              ),
                              shadowColor: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 20),
                                child: Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.arrowDownShortWide,
                                      color: Colors.black,
                                      size: 45,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Pressure',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: 'nunito'),
                                          ),
                                          Text(
                                            '${data?.pressure} Pa',
                                            style: const TextStyle(
                                              color: Colors.black38,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 12, bottom: 12, right: 5, left: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 0.5,
                                ),
                              ),
                              shadowColor: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 20),
                                child: Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.cloudscale,
                                      color: Colors.black,
                                      size: 45,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Visibility',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: 'nunito'),
                                          ),
                                          Text(
                                            '${data?.visibility} ',
                                            style: const TextStyle(
                                              color: Colors.black38,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 705, left: 12, right: 12),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Card(
                              margin: const EdgeInsets.only(
                                  top: 12, bottom: 12, left: 5, right: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(
                                  color: Colors.grey.withOpacity(0.2),
                                  width: 0.5,
                                ),
                              ),
                              shadowColor: Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 45, vertical: 20),
                                child: Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.gaugeSimpleHigh,
                                      color: Colors.black,
                                      size: 45,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Wind',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontFamily: 'nunito'),
                                          ),
                                          Text(
                                            '${data?.speed} km/h',
                                            style: const TextStyle(
                                              color: Colors.black38,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      drawer: const Drawer_page(),
    );
  }

  Future<WeatherModel?> fetchData({required String result}) async {
    String API =
        "https://api.openweathermap.org/data/2.5/weather?q=$result&appid=9d0e703773718f2b444bbaf3d9a4d8f1";

    http.Response res = await http.get(Uri.parse(API));

    if (res.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(res.body);
      WeatherModel model = WeatherModel.getData(data);
      return model;
    }
    return null;
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height - 130);
    path.quadraticBezierTo(
        size.width * 0.25, size.height, size.width * 0.5, size.height);
    path.quadraticBezierTo(size.width - (size.width * 0.25), size.height,
        size.width, size.height - 130);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
