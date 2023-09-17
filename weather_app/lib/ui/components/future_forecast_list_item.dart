import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weathermodel.dart';

class forecastListItem extends StatelessWidget {
  final Forecastday? forecastday;

  const forecastListItem({Key? key, this.forecastday}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.all(8),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            "https:${forecastday?.day?.condition?.icon ?? ""}",
          ),
          Text(
            DateFormat.MMMEd().format(
              DateTime.parse(forecastday?.date.toString() ?? ","),
            ),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Text(
            forecastday?.day?.condition?.text ?? "",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "^${forecastday?.day?.maxtempC?.round()}/${forecastday?.day?.mintempC?.round()}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Text(
                'o',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
