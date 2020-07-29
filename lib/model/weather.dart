class Weather {
  String weather;
  double temp;
  int humidity;
  int visibility;
  double wind;
  int datetime;
  String icon;
  String description;
  String dateText;
  String city;

  Weather({
    this.weather,
    this.temp,
    this.humidity,
    this.visibility,
    this.wind,
    this.datetime,
    this.icon,
    this.description,
    this.dateText,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    weather = json['weather'];
    temp = json['temp'] - 273.15;
    humidity = json['humidity'];
    visibility = json['visibility'];
    wind = json['wind'];
    datetime = json['datetime'];
    icon = 'http://openweathermap.org/img/wn/${json["icon"]}@2x.png';
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weather'] = this.weather;
    data['temp'] = this.temp;
    data['humidity'] = this.humidity;
    data['visibility'] = this.visibility;
    data['wind'] = this.wind;
    data['datetime'] = this.datetime;
    data['icon'] = this.icon;
    data['description'] = this.description;
    return data;
  }
}
