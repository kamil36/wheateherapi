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
    final Map<String, dynamic> dataMap = data ?? {};

    final cityName = dataMap['cityName'] ?? 'Search City Name';
    final latitude = dataMap['latitude'] ?? 0.0;
    final longitude = dataMap['longitude'] ?? 0.0;
    final temperature = dataMap['temperature'] ?? 0.0;
    final errorMessage = dataMap['errorMessage'] ?? '';
    return Scaffold(
      backgroundColor: const Color(0xff314099),
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: const Color(0xff576FF6),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Text(
                    "City Name: ${cityName}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Latitude: ${latitude}".toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Longitude: ${longitude}".toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Temperature: ${temperature}°C".toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 26,
                    ),
                  ),
                  if (errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Error: $errorMessage',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
