import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wheather_api_cubit_bloc/router.dart';

class HomePage extends StatelessWidget {
  final Map<String, dynamic>? data;

  const HomePage({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    final String rainimg =
        "https://cdn-icons-png.flaticon.com/512/4724/4724094.png";

    final String summerimg =
        "https://cdn-icons-png.flaticon.com/512/4814/4814268.png";

    final String winterimg =
        "https://cdn-icons-png.flaticon.com/512/642/642000.png";

    final Map<String, dynamic> dataMap = data ?? {};

    final cityName = dataMap['name'] ?? '';
    final temperature = dataMap['temperature'] ?? "".toString();
    double parsedTemperature = double.tryParse(temperature.toString()) ?? 0.0;

    final countryname = dataMap['country'] ?? '';
    final statename = dataMap['admin1'] ?? '';

    final windspeed = dataMap['windspeed'] ?? "".toString();
    final DateTime time = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: const Color(0xff576EF7),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.go(MyRoutes.setting);
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              context.go(MyRoutes.searching);
            },
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xff314099),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$cityName",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${cityName == null ? time.toLocal() : ""}",
              style: TextStyle(fontSize: 20, color: Color(0xffBBC7FF)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  (cityName != null)
                      ? (parsedTemperature < 10
                          ? winterimg
                          : (parsedTemperature < 25 ? rainimg : summerimg))
                      : winterimg,
                  height: 100,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "${(cityName != null) ? ("${temperature}°C") : ""}",
                  style: TextStyle(fontSize: 20, color: Color(0xffBBC7FF)),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "$windspeed",
                  style: TextStyle(fontSize: 20, color: Color(0xffBBC7FF)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "$countryname",
              style: TextStyle(fontSize: 20, color: Color(0xffBBC7FF)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "$statename",
              style: TextStyle(fontSize: 20, color: Color(0xffBBC7FF)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${(cityName != null) ? (temperature == 25 ? "Shower" : "Summer") : ""}",
              style: TextStyle(fontSize: 20, color: Color(0xffBBC7FF)),
            ),
          ],
        ),
      ),
    );
  }
}
