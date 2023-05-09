import 'package:flutter/material.dart';

class CustomCircularIconButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final Icon icon;
  final double radius;
  final double elevation;

  const CustomCircularIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.color = Colors.white,
    this.radius = 40,
    this.elevation = 6.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: radius,
      minWidth: radius,
      elevation: elevation,
      color: color,
      shape: const CircleBorder(),
      onPressed: onPressed as void Function()?,
      child: icon,
    );
  }
}
