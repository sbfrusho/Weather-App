import 'package:flutter/material.dart';
import 'package:weather_app/model/weathermodel.dart';
import 'package:weather_app/service/api_service.dart';
import 'package:weather_app/ui/components/future_forecast_list_item.dart';
import 'package:weather_app/ui/components/hourly_weather_list.dart';
import 'package:weather_app/ui/components/todays_weather.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = "auto:ip";
  ApiService apiService = ApiService();
  WeatherModel? weatherModel;
  final textFieledController = TextEditingController();
  showTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Search Location"),
            content: TextField(
              controller: textFieledController,
              decoration:
                  InputDecoration(hintText: "search by city, zip, lat, lang"),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cnacel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (textFieledController.text.isEmpty) {
                    return;
                  }
                  Navigator.pop(context, textFieledController.text);
                },
                child: Text("Ok"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Flutter Weather App"),
        actions: [
          IconButton(
            onPressed: () async {
              String text = await showTextInputDialog(context);
              setState(() {
                searchText = text;
              });
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              searchText = "auto:ip";
              setState(() {
                
              });
            },
            icon: Icon(
              Icons.my_location,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              WeatherModel? weatherMOdel = snapshot.data;
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TodaysWeather(
                      weatherModel: weatherMOdel,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Weather by hours",
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          Hour? hour = weatherMOdel
                              ?.forecast?.forecastday?[0].hour?[index];

                          return HourlyListItem(
                            hour: hour,
                          );
                        },
                        itemCount: weatherMOdel
                            ?.forecast?.forecastday?[0].hour?.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Next 5 days weather",
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) {
                        Forecastday? forecastday =
                            weatherMOdel?.forecast?.forecastday?[index];
                        return forecastListItem(
                          forecastday: forecastday,
                        );
                      },
                      itemCount: weatherMOdel?.forecast?.forecastday?.length,
                    ))
                  ],
                ),
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
          future: apiService.getWeatherData(searchText),
        ),
      ),
    );
  }
}
