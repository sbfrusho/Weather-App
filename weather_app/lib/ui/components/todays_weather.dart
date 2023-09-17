import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weathermodel.dart';

class TodaysWeather extends StatelessWidget {
  final WeatherModel? weatherModel;

  const TodaysWeather({Key? key, this.weatherModel}) : super(key: key);
  WeatherType getWeatherType(Current? current) {
    if(current?.isDay == 1){
      if(current?.condition?.text == "Patchy rain possible"|| current?.condition?.text == "Light rain"){
        return WeatherType.lightRainy;
      }
      else if(current?.condition?.text == "Sunny"){
        return WeatherType.sunny;
      }
      else if(current?.condition?.text == "Partly cloudy"){
        return WeatherType.cloudyNight;
      }
      else if(current?.condition?.text == "Mist"){
        return WeatherType.foggy;
      }
      else if(current?.condition?.text == "Clear"){
        return WeatherType.sunny;
      }
      else if(current?.condition?.text == "Moderate rain"){
        return WeatherType.middleRainy;
      }
      else if(current?.condition?.text == "Heavy rain"){
        return WeatherType.heavyRainy;
      }
      else if(current?.condition?.text == "Overcast"){
        return WeatherType.overcast;
      }
      else if(current?.condition?.text == "Patchy light rain with thunder"){
        return WeatherType.thunder;
      }
      else if(current?.condition?.text == "Fog"){
        return WeatherType.foggy;
      }
      else if(current?.condition?.text == "Moderate or heavy rain shower"){
        return WeatherType.heavyRainy;
      }
    }else{
      if(current?.condition?.text == "Patchy rain possible" || current?.condition?.text == "Light rain"){
        return WeatherType.lightRainy;
      }
      else if(current?.condition?.text == "Mist"){
        return WeatherType.foggy;
      }
      else if(current?.condition?.text == "Clear"){
        return WeatherType.sunnyNight;
      }
      else if(current?.condition?.text == "Partly cloudy"){
        return WeatherType.cloudyNight;
      }
      else if(current?.condition?.text == "Moderate rain"){
        return WeatherType.middleRainy;
      }
      else if(current?.condition?.text == "Heavy rain"){
        return WeatherType.heavyRainy;
      }
      else if(current?.condition?.text == "Patchy light rain with thunder"){
        return WeatherType.thunder;
      }

    }
    return WeatherType.hazy;
  }

  @override
  Widget build(BuildContext context) {
    // String text = weatherModel?.current?.condition?.text?.toString();
    return Stack(
      children: [
        WeatherBg(
          // weatherType: WeatherType.
          weatherType: getWeatherType(weatherModel?.current),
          width: MediaQuery.of(context).size.width,
          height: 300,
        ),
        SizedBox(
          width: double.infinity,
          height: 300,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white30,
                ),
                child: Column(
                  children: [
                    Text(
                      weatherModel?.location?.name ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(
                        DateTime.parse(
                          weatherModel?.current?.lastUpdated?.toString() ?? "",
                        ),
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color.fromARGB(77, 113, 102, 102),
                        ),
                        child: Image.network(
                          "https:${weatherModel?.current?.condition?.icon ?? ""}",
                        ),
                      ),
                      Text(
                        weatherModel?.current?.condition?.text ?? "",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weatherModel?.current?.tempC
                                        ?.round()
                                        .toString() ??
                                    "",
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80),
                              ),
                              const Text(
                                "o",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
