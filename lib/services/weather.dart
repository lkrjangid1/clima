import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '2748c665b94afd589e59b71cd9bd8747';
const openWeaherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityname) async {
    NetworkHelper networkHelper = NetworkHelper('$openWeaherMapUrl?q=$cityname&appid=$apiKey&units=metric');
    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationweather() async{
    Location locations = Location();
    await locations.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$openWeaherMapUrl?lat=${locations.latitude}&lon=${locations.logitude}&appid=$apiKey&units=metric');

    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
