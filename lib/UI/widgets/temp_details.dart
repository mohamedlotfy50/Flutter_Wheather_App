import 'package:flutter/material.dart';

class TempDetails extends StatelessWidget {
  final String temp;
  final String place;
  final String sunRise;
  final String sunSet;

  const TempDetails({this.temp, this.place, this.sunRise, this.sunSet});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                temp,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.left,
              ),
              Text(
                '℃',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          Text(
            place,
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TxtDetails(
                text: 'Sunrise',
                data: sunRise,
              ),
              SizedBox(
                width: 20,
              ),
              TxtDetails(
                text: 'Sunset',
                data: sunSet,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TxtDetails extends StatelessWidget {
  final String text;
  final String data;

  const TxtDetails({Key key, this.text, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          text,
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          data,
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
