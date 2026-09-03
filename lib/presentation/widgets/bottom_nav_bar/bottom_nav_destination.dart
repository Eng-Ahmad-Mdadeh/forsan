import 'package:flutter/material.dart';

@immutable
class BottomNavDestination {
  const BottomNavDestination({
    required this.label,
    required this.icon,
    this.isPrimary = false,
  });

  final String label;
  final IconData icon;
  final bool isPrimary;
}
