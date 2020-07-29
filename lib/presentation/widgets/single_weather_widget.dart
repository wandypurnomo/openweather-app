import 'package:flutter/material.dart';
import 'package:openweather/model/weather.dart';

import 'current_city_weather_widget.dart';

class SingleWeatherWidget extends StatelessWidget {
  final Weather weather;

  const SingleWeatherWidget({Key key, @required this.weather})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    shape: BoxShape.circle),
                child: Image(
                  image: NetworkImage(
                    weather.icon,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: <Widget>[
                    KeyValuePairWidget(
                      label: 'Tanggal',
                      value: '${weather.dateText}',
                    ),
                    KeyValuePairWidget(
                      label: 'Cuaca',
                      value: '${weather.weather}, ${weather.description}',
                    ),
                    KeyValuePairWidget(
                      label: 'Temperatur',
                      value: '${weather.temp.toStringAsFixed(2)} C',
                    ),
                    KeyValuePairWidget(
                      label: 'Kelembapan',
                      value: '${weather.humidity}%',
                      withBorder: false,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
