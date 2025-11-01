// lib/widgets/glass_card.dart

import 'dart:ui';
import 'package:flutter/material.dart';

// A custom widget to apply the Glassmorphism effect (Frosted Glass)
class GlassCard extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin; // <--- ADDED THIS REQUIRED PARAMETER
  final double? width;
  final double? height;

  const GlassCard({
    super.key,
    required this.child,
    this.blur = 15,
    this.opacity = 0.2,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(20),
    this.margin = EdgeInsets.zero, // <--- DEFAULTED TO ZERO
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin, // <--- USED HERE
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          // The key to the effect: blurring the background content
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              // Semi-transparent white color
              color: Colors.white.withOpacity(opacity),
              borderRadius: BorderRadius.circular(borderRadius),
              // Light border for better definition
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.0,
              ),
            ),
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}