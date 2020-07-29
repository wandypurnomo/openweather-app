import 'package:flutter/material.dart';
import 'package:openweather/model/weather.dart';

class CurrentCityWeatherWidget extends StatelessWidget {
  final Weather weather;

  const CurrentCityWeatherWidget({Key key, @required this.weather})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
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
              KeyValuePairWidget(
                label: 'Kota',
                value: '${weather.city}',
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
              ),
              KeyValuePairWidget(
                label: 'Jarak Pandang',
                value: '${weather.visibility}m',
              ),
              KeyValuePairWidget(
                label: 'Angin',
                value: '${weather.wind} m/s',
                withBorder: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KeyValuePairWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool withBorder;

  const KeyValuePairWidget(
      {Key key, this.label, this.value, this.withBorder: true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                child: Text(
                  label,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text(
                value,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Visibility(
            visible: withBorder,
            child: Divider(
              height: 10,
              thickness: 0.3,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }
}
