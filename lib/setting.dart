import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wheather_api_cubit_bloc/router.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings Page'),
          leading: BackButton(
            onPressed: () {
              context.go(MyRoutes.home);
            },
          ),
        ),
        body: Column(
          children: [
            SwitchListTile(
              title: Text(
                'Temperature Units',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Use metric measurements for'),
                  Text('temperature units.'),
                ],
              ),
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ],
        ));
  }
}
