// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';

class MyHome extends StatefulWidget {
  MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Widget getGreetings(int time) {
    switch (time) {
      case >= 5 && < 12:
        return Text(
          'Good Morning',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        );
      case >= 12 && < 18:
        return Text(
          'Good Afternoon',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        );
      case >= 18 && < 23:
        return Text(
          'Good Evening',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        );
      default:
        return Text(
          'Good Night',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
        );
    }
  }

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('images/1.png');
      case >= 300 && < 400:
        return Image.asset('images/2.png');
      case >= 500 && < 600:
        return Image.asset('images/3.png');
      case >= 600 && < 700:
        return Image.asset('images/4.png');
      case >= 700 && < 800:
        return Image.asset('images/5.png');
      case == 800:
        return Image.asset('images/6.png');
      case > 800 && <= 804:
        return Image.asset('images/7.png');
      default:
        return Image.asset('images/7.png');
    }
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
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
                filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherBlocSuccess) {
                    return mainDisplay(context, state);
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox mainDisplay(BuildContext context, WeatherBlocSuccess state) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🚩${state.weather.areaName}',
            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
          ),
          const SizedBox(
            height: 6,
          ),
          getGreetings(state.weather.date!.hour),
          getWeatherIcon(state.weather.weatherConditionCode!),
          Center(
              child: Text(
            '${state.weather.temperature!.celsius!.round()} ℃',
            style: TextStyle(
                color: Colors.white, fontSize: 55, fontWeight: FontWeight.w600),
          )),
          Center(
              child: Text(
            '${state.weather.weatherMain!.toUpperCase()}',
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
          )),
          Center(
              child: Text(
            DateFormat('EEEE dd •').add_jm().format(state.weather.date!),
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
          )),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/11.png',
                    scale: 8,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sunrise',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300)),
                      Text(DateFormat().add_jm().format(state.weather.sunrise!),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'images/12.png',
                    scale: 8,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sunset',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300)),
                      Text(DateFormat().add_jm().format(state.weather.sunset!),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          sun_temp_widget(state),
        ],
      ),
    );
  }

  Row sun_temp_widget(WeatherBlocSuccess state) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'images/13.png',
              scale: 8,
            ),
            SizedBox(
              width: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Temp Max',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300)),
                Text('${state.weather.tempMax!.celsius!.round()} ℃',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              'images/14.png',
              scale: 8,
            ),
            SizedBox(
              width: 7,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Temp Min',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300)),
                Text('${state.weather.tempMin!.celsius!.round()} ℃',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ],
            )
          ],
        )
      ],
    );
  }
}
