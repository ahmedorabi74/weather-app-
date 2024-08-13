import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubites/grt_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Search a City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (String value) async {
              try {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);

                Navigator.pop(context);
              } catch (e) {
                // Handle the error appropriately
                debugPrint('Error fetching weather: $e');
              }
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              labelText: 'Search',
              hintText: 'Enter City Name',
              suffixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                  color: Theme.of(context)
                      .primaryColor, // Color when the field is focused
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
