import 'package:flutter/material.dart';

class BackgroundRecBox extends StatelessWidget {
  final List<Widget> widgetList;

  const BackgroundRecBox({
    this.widgetList,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Container(
      padding: EdgeInsets.all(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widgetList),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Theme.of(context).accentColor,
        border: Border.all(width: 1.0, color: Theme.of(context).dividerColor),
      ),
    ));
  }
}
