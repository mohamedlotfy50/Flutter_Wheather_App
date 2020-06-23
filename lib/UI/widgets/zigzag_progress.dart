import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ZigZagProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 30,
      child: FlareActor(
        'assets/animation/zigzag.flr',
        alignment: Alignment.topCenter,
        sizeFromArtboard: true,
        animation: 'wave',
        fit: BoxFit.fill,
        color: Colors.red,
      ),
    );
  }
}
