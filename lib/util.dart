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

class CollapsibleCard extends StatelessWidget {
  final ExpansionTileController controller;
  final Widget child;
  final String heading;
  final Color color;
  final bool initiallyExpanded;

  const CollapsibleCard({required this.heading, required this.child, required this.controller, this.color = Colors.blue, this.initiallyExpanded = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: color,width: 10))
        ),
        child: ExpansionTile(
          controller: controller,
          initiallyExpanded: initiallyExpanded,
          title: Text(heading, style: const TextStyle(fontWeight: FontWeight.bold),),
          dense: true,
          childrenPadding: const EdgeInsets.only(bottom: 8.0),
          children: [child],
        )
      ),
    );
  }
  
  
}


class CheckboxItem extends StatefulWidget {
  final String label;
  final Icon icon;
  final String sublabel;
  /// Creates a CheckboxItem with a label, icon, and optional sublabel

  const CheckboxItem({super.key, required this.label, required this.icon, this.sublabel = ''});

  @override
  State<CheckboxItem> createState() => _CheckboxItemState();
}

class _CheckboxItemState extends State<CheckboxItem> {
  bool _value = false;
  @override
  void initState() {
    super.initState();
    _value = false;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sublabel == '') {
      return CheckboxListTile(
        title: Text(widget.label),
        value: _value,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool? newVal) {
          setState(() {
            _value = newVal ?? false;
          });
        },
        secondary: widget.icon,
      );
    } else {
      return CheckboxListTile(
        title: Text(widget.label),
        value: _value,
        subtitle: Text(widget.sublabel),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool? newVal) {
          setState(() {
            _value = newVal ?? false;
          });
        },
        secondary: widget.icon,
      );
    }
  }
}