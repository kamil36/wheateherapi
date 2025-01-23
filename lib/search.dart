import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wheather_api_cubit_bloc/router.dart';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  const SearchPage();

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  // Declare variables to store weather data
  String cityName = '';
  double latitude = 0.0;
  double longitude = 0.0;
  double temperature = 0.0;
  String errorMessage = '';

  Future<void> getWeatherData(String cityName) async {
    final _cityUrl = Uri.parse(
        'https://geocoding-api.open-meteo.com/v1/search?name=$cityName&count=1');

    try {
      final response = await http.get(_cityUrl);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data['results'].isEmpty) {
          setState(() {
            errorMessage = 'City not found';
          });
          return;
        }

        latitude = data['results'][0]['latitude'];
        longitude = data['results'][0]['longitude'];
        final String weatherUrl =
            'https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current_weather=true';
        final weatherResponse = await http.get(Uri.parse(weatherUrl));

        if (weatherResponse.statusCode == 200) {
          var weatherData = jsonDecode(weatherResponse.body);
          temperature = weatherData['current_weather']['temperature'];
        } else {
          setState(() {
            errorMessage = 'Error fetching weather data';
          });
        }
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Search'),
        leading: BackButton(
          onPressed: () {
            context.go(MyRoutes.home);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'City',
                hintText: 'Enter city name',
              ),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 30,
              backgroundColor: Theme.of(context).splashColor,
              child: IconButton(
                color: Theme.of(context).primaryColor,
                iconSize: 40,
                onPressed: () async {
                  final city = _searchController.text.trim();
                  if (city.isNotEmpty) {
                    await getWeatherData(city);

                    context.go(MyRoutes.home, extra: {
                      'cityName': city,
                      'latitude': latitude,
                      'longitude': longitude,
                      'temperature': temperature,
                      'errorMessage': errorMessage,
                    });
                  }
                },
                icon: Icon(Icons.search),
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
      ),
    );
  }
}
