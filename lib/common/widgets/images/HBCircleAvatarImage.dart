import 'package:flutter/material.dart';

class HBCircleAvatarImage extends StatelessWidget {
  const HBCircleAvatarImage({
    super.key,
    required this.image,
    required this.radius,
  });

  final String image;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: radius, backgroundImage: AssetImage(image));
  }
}
