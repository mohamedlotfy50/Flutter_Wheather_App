import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SunLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlareActor(
        'assets/animation/sun loading.flr',
        alignment: Alignment.topCenter,
        sizeFromArtboard: true,
        animation: '01d',
        fit: BoxFit.fill,
      ),
    );
  }
}
