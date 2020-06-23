import 'package:flutter/material.dart';

class WeatherIconData extends StatelessWidget {
  final String image;
  final String text;
  final double size;
  final Widget child;

  const WeatherIconData({
    Key key,
    this.image,
    this.child,
    this.size,
    this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          FittedBox(
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.left,
                ),
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
