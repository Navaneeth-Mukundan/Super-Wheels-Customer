import 'package:flutter/material.dart';

class ScreenGradientWidget extends StatelessWidget {
  final Widget child;
  const ScreenGradientWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 251, 215, 96),
            Color.fromARGB(255, 255, 249, 228),
            Color.fromARGB(255, 254, 255, 251),
            Color.fromARGB(255, 254, 255, 251),
            Color(0XFFFFFFFF),
          ],
        ),
      ),
      child: child,
    );
  }
}
