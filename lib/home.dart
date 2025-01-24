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

    final String summer =
        "https://cdn-icons-png.flaticon.com/512/4814/4814268.png";

    final String winter =
        "https://cdn-icons-png.flaticon.com/512/642/642000.png";

    final Map<String, dynamic> dataMap = data ?? {};

    final cityName = dataMap['name'] ?? 'Search City Name';
    final latitude = dataMap['latitude'] ?? 0.0;
    final longitude = dataMap['longitude'] ?? 0.0;
    final temperature = dataMap['temperature'] ?? 0.0;
    final countryname = dataMap['country'] ?? 'Search City Name';
    final statename = dataMap['admin1'] ?? 'Search City Name';

    final windspeed = dataMap['windspeed'] ?? 0.0;
    final DateTime time = DateTime.now();

    final errorMessage = dataMap['errorMessage'] ?? '';
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
              "Updated: $time",
              style: TextStyle(fontSize: 20, color: Color(0xffBBC7FF)),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  rainimg,
                  height: 100,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "$temperature°C",
                  style: TextStyle(fontSize: 20, color: Color(0xffBBC7FF)),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "$windspeed",
                  style: TextStyle(fontSize: 20, color: Color(0xffBBC7FF)),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "$countryname",
                  style: TextStyle(fontSize: 20, color: Color(0xffBBC7FF)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${rainimg.isNotEmpty ? "Shower" : "Winter"}",
              style: TextStyle(fontSize: 20, color: Color(0xffBBC7FF)),
            ),
          ],
        ),
      ),
    );
  }
}
