import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/views/home_view.dart';

import 'cubites/grt_weather_cubit/get_weather_cubit.dart';
import 'cubites/grt_weather_cubit/get_weather_state.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primaryColor: getWeatherColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherState,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String? dayCondition) {
  if (dayCondition == null) {
    return Colors.blue;
  }
  switch (dayCondition.toLowerCase()) {
    case "sunny":
    case "clear":
      return Colors.yellow;

    case "partly cloudy":
    case "cloudy":
    case "overcast":
      return Colors.grey;

    case "mist":
    case "fog":
    case "freezing fog":
      return Colors.blueGrey;

    case "patchy rain possible":
    case "light rain":
    case "moderate rain":
    case "heavy rain":
    case "light rain shower":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
      return Colors.blue;

    case "patchy snow possible":
    case "light snow":
    case "moderate snow":
    case "heavy snow":
    case "light snow showers":
    case "moderate or heavy snow showers":
      return Colors.lightBlue;

    case "patchy sleet possible":
    case "light sleet":
    case "moderate or heavy sleet":
    case "light sleet showers":
    case "moderate or heavy sleet showers":
      return Colors.cyan;

    case "patchy freezing drizzle possible":
    case "freezing drizzle":
    case "heavy freezing drizzle":
      return Colors.indigo;

    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return Colors.purple;

    case "blowing snow":
    case "blizzard":
      return Colors.grey;

    default:
      return Colors.blue;
  }
}
