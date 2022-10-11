import 'package:flutter/material.dart';

import 'package:sidebar_bottombar_navigation_playground/responsive/desktop_body.dart';
import 'package:sidebar_bottombar_navigation_playground/responsive/mobile_body.dart';
import 'package:sidebar_bottombar_navigation_playground/responsive/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MyMobileBody(),
        desktopBody: MyDesktopBody(),
      ),
    );
  }
}
