import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openweather/application/home/blocs/weather/weather_bloc.dart';
import 'package:openweather/model/weather.dart';
import 'package:openweather/presentation/widgets/current_city_weather_widget.dart';
import 'package:openweather/presentation/widgets/single_weather_widget.dart';
import 'package:throttling/throttling.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = false;
  Debouncing _debouncing = Debouncing(duration: Duration(seconds: 1));
  WeatherBloc _bloc = WeatherBloc();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _bloc.add(GetInitialWeather());
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            TextFormField(
              controller: _controller,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Ketik kota anda...',
                suffix: Visibility(
                  visible: _loading,
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
              onChanged: (v) async {
                await _debouncing.debounce(() {
                  if (v.isNotEmpty && v != '' && v.length > 3)
                    _bloc.add(GetWeatherByCity(v));
                });
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: BlocConsumer(
                cubit: _bloc,
                listener: (context, state) {
                  if (state is WeatherLoaded) {
                    setState(() => _controller.text = state.lastSearch);
                  }
                  if (state is WeatherLoading) {
                    setState(() => _loading = true);
                  } else {
                    setState(() => _loading = false);
                  }
                },
                builder: (context, state) {
                  if (state is WeatherLoading) return loading();
                  if (state is WeatherError) return noData();
                  if (state is WeatherLoaded)
                    return loaded(state.currentWeather, state.forecast);

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget noData() {
    return Center(child: Text('Tidak ada data cuaca'));
  }

  Widget loading() {
    return Center(child: Text('Memuat....'));
  }

  Widget loaded(Weather weather, List<Weather> forecasts) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10),
          CurrentCityWeatherWidget(weather: weather),
          SizedBox(height: 20),
          Text(
            'Forecast',
            style: TextStyle(fontSize: 30),
          ),
          Divider(thickness: 5),
          ...forecasts
              .map<Widget>((e) => SingleWeatherWidget(weather: e))
              .toList(),
        ],
      ),
    );
  }
}
