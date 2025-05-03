import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// BaseState is a reusable class that provides common functionality
/// for other widgets in the app by extending StatefulWidget.
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  // Theme Data for accessing the current theme
  // late GoRouter router;

  // Method to initialize app-wide dependencies (like network requests, etc.)
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // router = GoRouter.of(context);
  }

  ThemeData get theme => Theme.of(context);

  // MediaQuery for accessing screen size, orientation, etc.
  MediaQueryData get mediaQuery => MediaQuery.of(context);

  // Localization for accessing localized strings
  AppLocalizations get localization => AppLocalizations.of(context)!;

  // Access to Navigator for pushing and popping pages
  NavigatorState get navigator => Navigator.of(context);

  // Common method to show a SnackBar with a message
  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  // Common method to handle errors (could be customized based on app requirements)
  void handleError(Object error, StackTrace stackTrace) {
    showSnackBar("An error occurred: ${error.toString()}");
    // You can log errors or send them to an analytics service here
  }

  // Method to check if the platform is iOS
  bool get isIOS => Platform.isIOS;

  // Method to check if the platform is Android
  bool get isAndroid => Platform.isAndroid;

  // Method to check if the app is in dark mode
  bool get isDarkMode => theme.brightness == Brightness.dark;

  // Method to check if the device is in landscape mode
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  // Access to screen width
  double get screenWidth => mediaQuery.size.width;

  // Access to screen height
  double get screenHeight => mediaQuery.size.height;

  // Get custom icon from assets
  // SvgPicture getIcon(String iconPath, {Color? color, double size = 20}) =>
  //     SvgPicture.asset(
  //       iconPath,
  //       width: size,
  //       height: size,
  //       colorFilter: color != null
  //           ? ColorFilter.mode(
  //         color,
  //         BlendMode.srcIn,
  //       )
  //           : null,
  //     );

  // Get bloc object
  TBloc getBloc<TBloc extends Bloc>(BuildContext context) =>
      BlocProvider.of<TBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Container(); // This should be overridden in subclasses
  }
}
