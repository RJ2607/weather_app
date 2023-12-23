import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

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
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '🚩XYZ EHEHE',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, color: Colors.white),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'Good Morning',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 25),
                        ),
                        Image.asset(
                          'images/1.png',
                        ),
                        const Center(
                            child: Text(
                          '21°c',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 55,
                              fontWeight: FontWeight.w600),
                        )),
                        const Center(
                            child: Text(
                          'Thunderstorm',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        )),
                        const Center(
                            child: Text(
                          'Friday, 19 • 7:30',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        sunState(),
                        SizedBox(
                          height: 20,
                        ),
                        tempState(),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Row tempState() {
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
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Temp Max.',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300)),
                Text('12 ℃',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Image.asset(
              'images/14.png',
              scale: 8,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Temp',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300)),
                Text('8 ℃',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ],
            )
          ],
        )
      ],
    );
  }

  Row sunState() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              'images/11.png',
              scale: 8,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sunrise',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300)),
                Text('6:00 am',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
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
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sunset',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300)),
                Text('7:00 pm',
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
