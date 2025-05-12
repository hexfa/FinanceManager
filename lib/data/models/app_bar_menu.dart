import 'package:flutter/material.dart';

class AppBarMenu {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  AppBarMenu({required this.title, required this.icon, required this.onTap});
}