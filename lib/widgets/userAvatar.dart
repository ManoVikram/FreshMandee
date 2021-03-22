import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String imageLocation;

  const UserAvatar({
    Key key,
    this.imageLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 80.0,
      minRadius: 18.0,
      backgroundColor: Colors.deepPurple,
      child: CircleAvatar(
        maxRadius: 72,
        minRadius: 16,
        foregroundImage: AssetImage(imageLocation),
      ),
    );
  }
}
