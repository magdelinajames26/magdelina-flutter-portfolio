// lib/widgets/animated_section.dart

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

// A custom widget that triggers an animation when it scrolls into view.
class AnimatedSection extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final double fractionToTrigger; // How much of the widget must be visible to trigger

  const AnimatedSection({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 100),
    this.fractionToTrigger = 0.25,
  });

  @override
  _AnimatedSectionState createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700), // Animation duration
    );
    // Animation for sliding up from below
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2), // Starts slightly below
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    // Animation for fading in
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    // Check if enough of the widget is visible AND it hasn't animated yet
    if (info.visibleFraction >= widget.fractionToTrigger && !_hasAnimated) {
      _hasAnimated = true;
      Future.delayed(widget.delay, () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.child.hashCode),
      onVisibilityChanged: _onVisibilityChanged,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: widget.child,
        ),
      ),
    );
  }
}
