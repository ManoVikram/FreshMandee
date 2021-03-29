import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:url_launcher/url_launcher.dart';

import './titleAndContact.dart';

class ContactUsButton extends StatelessWidget {
  const ContactUsButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NeumorphicButton(
        onPressed: () async {
          const String url = "mailto:support@kisanmandee.com";

          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw "Error while launching URL";
          }
        },
        style: NeumorphicStyle(
          shadowDarkColor: Colors.grey[100],
          shadowLightColor: Colors.white,
          color: Colors.greenAccent.withOpacity(0.5),
          depth: 20.0,
          // shape: NeumorphicShape.convex,
        ),
        minDistance: -10,
        child: TitleAndContact(
          title: "MAIL US",
          contact: "support@kisanmandee.com",
        ),
      ),
    );
  }
}
