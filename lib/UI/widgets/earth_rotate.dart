import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class EarthRotate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: MediaQuery.of(context).size.width - 50,
      child: FlareActor(
        'assets/animation/earth.flr',
        alignment: Alignment.topCenter,
        sizeFromArtboard: true,
        animation: 'rotate',
        fit: BoxFit.fill,
      ),
    );
  }
}
