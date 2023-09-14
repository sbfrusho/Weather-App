import 'package:flutter/material.dart';
import 'package:weather_app/model/weathermodel.dart';
import 'package:weather_app/service/api_service.dart';
import 'package:weather_app/ui/components/todays_weather.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Weather App"),
      ),
      body: SafeArea(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherMOdel = snapshot.data;
              return TodaysWeather(
                weatherModel: weatherMOdel,
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error has occured"),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          future: apiService.getWeatherData("Dhaka"),
        ),
      ),
    );
  }
}
