import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weathermodel.dart';

class HourlyListItem extends StatelessWidget {
  final Hour? hour;

  const HourlyListItem({Key? key, this.hour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  hour?.tempC?.round().toString() ?? "",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'o',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.teal,
            ),
            child: Image.network("https:${hour?.condition?.icon ?? ""}"),
          ),
          
          Text(
            DateFormat.j().format(
              DateTime.parse(
                hour?.time?.toString() ?? "",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
