import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weathermodel.dart';

class TodaysWeather extends StatelessWidget {
  final WeatherModel? weatherModel;

  const TodaysWeather({Key? key, this.weatherModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(
          weatherType: WeatherType.sunny,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .35,
        ),
        SizedBox(
          
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .1,
          child: Column(
            children: [
              Text(
                weatherModel?.location?.name ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              Text(
                DateFormat.yMMMMEEEEd().format(DateTime.parse(weatherModel?.current?.lastUpdated?.toString()??"")), 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
