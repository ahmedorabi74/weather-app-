import 'package:flutter/material.dart';
import 'package:weather/views/Search_View.dart';
import 'package:weather/widgets/NoWeather.dart';
import 'package:weather/widgets/weatherInfo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
              )),
        ],
      ),
      body: const weatherInfo(),
    );
  }
}
