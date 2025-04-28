import 'dart:io';

import 'package:flutter/material.dart';

// import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// BaseStatelessWidget provides common utilities and methods for stateless widgets
abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  // Theme Data for accessing the current theme
  ThemeData theme(BuildContext context) => Theme.of(context);

  // MediaQuery for accessing screen size, orientation, etc.
  MediaQueryData mediaQuery(BuildContext context) => MediaQuery.of(context);

  // Localization for accessing localized strings
  AppLocalizations localization(BuildContext context) =>
      AppLocalizations.of(context)!;

  // Access to Navigator for pushing and popping pages
  NavigatorState navigator(BuildContext context) => Navigator.of(context);

  // Access to GoRouter for navigating between pages
  // GoRouter router(BuildContext context) => GoRouter.of(context);

  // Common method to show a SnackBar with a message
  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // Method to handle errors (could be customized based on app requirements)
  void handleError(BuildContext context, Object error, StackTrace stackTrace) {
    showSnackBar(context, "An error occurred: ${error.toString()}");
    // Log errors or send them to an analytics service here if needed
  }

  // Method to check if the platform is iOS
  bool get isIOS => Platform.isIOS;

  // Method to check if the platform is Android
  bool get isAndroid => Platform.isAndroid;

  // Method to check if the app is in dark mode
  bool isDarkMode(BuildContext context) =>
      theme(context).brightness == Brightness.dark;

  // Method to check if the device is in landscape mode
  bool isLandscape(BuildContext context) =>
      mediaQuery(context).orientation == Orientation.landscape;

  // Access to screen width
  double screenWidth(BuildContext context) => mediaQuery(context).size.width;

  // Access to screen height
  double screenHeight(BuildContext context) => mediaQuery(context).size.height;

  //Get custom icon from assets
  // SvgPicture getIcon(String iconPath, {Color? color, double size = 20}) =>
  //     SvgPicture.asset(
  //       iconPath,
  //       width: size,
  //       height: size,
  //       colorFilter: color != null
  //           ? ColorFilter.mode(
  //               color,
  //               BlendMode.srcIn,
  //             )
  //           : null,
  //     );

  // Get bloc object
  // TBloc getBloc<TBloc extends Bloc>(BuildContext context) =>
  //     BlocProvider.of<TBloc>(context);

  @override
  Widget build(BuildContext context);
}
