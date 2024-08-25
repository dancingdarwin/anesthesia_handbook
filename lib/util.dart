import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';


class TileButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final Color labelColor;

  final int animDuration;
  final double iconSize;
  
  const TileButton( {
    // Required Parameters
    super.key,
    required this.onPressed,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,

    //Optional Parameters
    this.label = '',
    this.animDuration = 150,
    this.iconSize = 100,
    this.labelColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      duration: Duration(milliseconds: animDuration),
      child: ScaleAnimation(
        child: FadeInAnimation(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              backgroundColor: backgroundColor,
            ),
            onPressed: () {onPressed();},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: iconSize,color: iconColor),
                Text(label, style: TextStyle(color: labelColor)),
              ],
            ),
          )
        ),
      ),
    );
  }
}

void launchURL(targetUrl) async {
   final Uri url = Uri.parse(targetUrl);
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $targetUrl');
    }
}

void goEmergencyPage(BuildContext context, pageTitle) {
  context.pushNamed('emergencypage',pathParameters: {'pageTitle': pageTitle});
}