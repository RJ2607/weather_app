import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: _determinePosition(),
            builder: (context, snap) {
              if (snap.hasData) {
                return BlocProvider<WeatherBlocBloc>(
                  create: (context) => WeatherBlocBloc()
                    ..add(Fetchweather(snap.data as Position)),
                  child: MyHome(),
                );
              } else {
                return Scaffold(
                    backgroundColor: Colors.black,
                    extendBodyBehindAppBar: true,
                    // appBar: AppBar(
                    //   backgroundColor: Color.fromARGB(0, 255, 255, 255),
                    //   elevation: 8,
                    //   systemOverlayStyle: const SystemUiOverlayStyle(
                    //     statusBarBrightness: Brightness.dark,
                    //   ),
                    // ),
                    body: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            40, 1.2 * kToolbarHeight, 40, 20),
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Stack(children: [
                              Align(
                                alignment: const AlignmentDirectional(3, -0.2),
                                child: Container(
                                  height: 300,
                                  width: 600,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 111, 52, 212),
                                      shape: BoxShape.rectangle),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0, -1.2),
                                child: Container(
                                  height: 250,
                                  width: 600,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 245, 192, 57),
                                      shape: BoxShape.rectangle),
                                ),
                              ),
                              BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.transparent),
                                ),
                              ),
                              Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              ))
                            ]))));
              }
            }));
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
