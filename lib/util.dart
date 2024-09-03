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

class BlinkingButton extends StatefulWidget {
  /// Creates a Button that continually blinks a specified color
  
  final Widget child;

  /// Starting color of button
  final Color startColor;

  /// The color that the button will blink to
  final Color endColor;

  /// Callback for when button is pressed
  final VoidCallback onPressed;

  const BlinkingButton({
    required this.startColor,
    required this.endColor,
    required this.onPressed,
    required this.child,
    super.key
  });

  @override
  State<BlinkingButton> createState() => _BlinkingButtonState();
}

class _BlinkingButtonState extends State<BlinkingButton> with SingleTickerProviderStateMixin{
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animation<Color?> animation = ColorTween(
      begin: widget.startColor,
      end: widget.endColor,
    ).animate(_animationController)..addListener(
      () {setState(() { });}
    );

    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: animation.value),
      child: widget.child);
  }

}