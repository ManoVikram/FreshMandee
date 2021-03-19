import 'package:flutter/material.dart';

class PreviousPageIconButton extends StatelessWidget {
  final Color color;

  const PreviousPageIconButton({
    Key key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 6.0,
        ),
        child: IconButton(
          icon: Icon(
            Icons.west_sharp,
            color: color,
            size: 36.0,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
