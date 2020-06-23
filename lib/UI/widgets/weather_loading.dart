import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class WeatherAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FlareActor(
          'assets/animation/weather loading.flr',
          animation: 'get_cloudy_and_get_sunny',
        ),
      ),
    );
  }
}
