import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/tamu_screen.dart';
import 'screens/rsvp_screen.dart';
// import 'screens/settings_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const LoginScreen(),
  '/home': (context) => const HomeScreen(),
  '/tamu': (context) => const TamuScreen(),
  '/rsvp': (context) => const RsvpScreen(),
  // '/settings': (context) => const SettingsScreen(),
};
