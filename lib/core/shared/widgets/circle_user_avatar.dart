import 'package:flutter/material.dart';

class CircleUserAvatar extends StatelessWidget {
  const CircleUserAvatar({
    required this.width,
    required this.height,
    required this.url,
    super.key,
  });
  final double width;
  final double height;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(url)),
      ),
    );
  }
}
