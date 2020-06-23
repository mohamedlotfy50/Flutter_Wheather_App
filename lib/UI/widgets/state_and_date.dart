import 'package:flutter/material.dart';

class StateDate extends StatelessWidget {
  final Widget date;
  final Widget weatherIcon;

  const StateDate({Key key, this.date, this.weatherIcon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            child: weatherIcon,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Today',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.left,
              ),
              date,
            ],
          ),
        ],
      ),
    );
  }
}
