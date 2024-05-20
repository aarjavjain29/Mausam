import 'package:flutter/material.dart';
// import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String temp = ((info["temp_value"]).toString());
    if (temp == "NA") {
      // print("NA");
    } else {
      temp = temp.substring(0, 4);
    }
    String icon = info["icon_value"];
    String desc = info["desc_value"];
    String city = info["city_value"];
    String hum = info["hum_value"];
    String air = info["air_value"];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.blue,
          )
          // ,
          ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.blue,
                Colors.lightBlue,
              ])),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (searchController.text.replaceAll(" ", "") == "") {
                          // print("invalid search");
                        } else {
                          Navigator.pushReplacementNamed(context, '/loading',
                              arguments: {
                                "search": searchController.text,
                              });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(3, 0, 7, 0),
                        child: const Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "search any city name",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: [
                          Image.network(
                              "https://openweathermap.org/img/wn/$icon@2x.png"),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                "$desc",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$city",
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(WeatherIcons.wiThermometer),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$temp",
                                style: const TextStyle(
                                  fontSize: 90,
                                ),
                              ),
                              const Text(
                                "C",
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [Icon(WeatherIcons.wiDayWindy)],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "$hum",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("km/hr"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14)),
                      padding: const EdgeInsets.all(30),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [Icon(WeatherIcons.wiHumidity)],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "$air",
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text("percent"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Made by Aarjav",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
