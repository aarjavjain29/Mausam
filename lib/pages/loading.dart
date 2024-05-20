import 'package:flutter/material.dart';
import 'package:project/worker/data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? temp;
  String? humidity;
  String? airspeed;
  String? description;
  String? main;
  String? icon;
  String? city = "mumbai";

  void startApp(String? city) async {
    Worker instance = Worker("$city");
    await instance.getData();
    temp = instance.temp;
    humidity = instance.humidity;
    airspeed = instance.airspeed;
    description = instance.description;
    main = instance.main;
    icon = instance.icon;
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": humidity,
        "air_value": airspeed,
        "desc_value": description,
        "main_value": main,
        "icon_value": icon,
        "city_value": city,
      });
    });
    if (context.mounted) {}
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map search = ModalRoute.of(context)!.settings.arguments as Map;
    if (search?.isNotEmpty ?? false) {
      city = search["search"];
    }
    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 200,),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/weather.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Weather App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Made by Aarjav",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.lightBlue,
    );
  }
}
