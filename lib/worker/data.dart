import 'dart:convert';

import 'package:http/http.dart';

class Worker {
  String location;
  Worker(this.location) {
    location = this.location;
  }
  String? temp;
  String? humidity;
  String? airspeed;
  String? description;
  String? main;
  String? icon;

  Future<void> getData() async {
    try {
      Response response = await get(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=4e38a7c6594cdf769ea4ada08190ac88');

//getting temp,humidity
      Map data = jsonDecode(response.body);
      Map temp_data = data['main'];
      String gethumidity = temp_data['humidity'].toString();
      double gettemp = temp_data['temp'] - 273.15;

//getting air speed
      Map wind = data['wind'];
      String getair_speed = wind["speed"].toString();

//getting description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getmain_description = weather_main_data['main'];
      String getdescription = weather_main_data['description'];
      String geticon = weather_main_data['icon'].toString();

      temp = gettemp.toString();
      humidity = gethumidity;
      airspeed = getair_speed;
      description = getdescription.toString();
      main = getmain_description.toString();
      icon = geticon;
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      airspeed = "NA";
      description = "No data found";
      main = "NA";
      icon = "09d";
    }
  }
}
