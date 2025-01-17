import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paracels/pages/dashboard_page.dart';
import 'package:paracels/themes/para_colors.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ParaApp(),
    ),
  );
}

class ParaApp extends StatelessWidget {
  const ParaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paracels Dashboard',
      theme: ThemeData(
        fontFamily: 'NunitoSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: ParaColors.background,
      ),
      home: ResponsiveBreakpoints.builder(
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        child: const DashboardPage(),
      ),
    );
  }
}
