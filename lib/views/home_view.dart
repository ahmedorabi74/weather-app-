import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubites/grt_weather_cubit/get_weather_state.dart';
import 'package:weather/views/Search_View.dart';
import 'package:weather/widgets/NoWeather.dart';
import 'package:weather/widgets/weatherInfo.dart';

import '../cubites/grt_weather_cubit/get_weather_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Weather App'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchView();
                      },
                    ),
                  );
                },
                icon: const Icon(
                  Icons.search,
                )),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeather();
            } else if (state is WeatherLoadedState) {
              // ignore: prefer_const_constructors
              return weatherInfo();
            } else {
              return const Text("there is  an error");
            }
          },
        ));
  }
}
