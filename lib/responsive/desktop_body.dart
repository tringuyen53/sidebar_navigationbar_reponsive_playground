import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sidebar_bottombar_navigation_playground/components/account_screen.dart';
import 'package:sidebar_bottombar_navigation_playground/components/camera_view_screen.dart';
import 'package:sidebar_bottombar_navigation_playground/components/list_group_view.dart';
import 'package:sidebar_bottombar_navigation_playground/components/navigation_index_provider.dart';
import 'package:sidebar_bottombar_navigation_playground/components/navigation_rail.dart';
import 'package:sidebar_bottombar_navigation_playground/components/settings_screen.dart';

class MyDesktopBody extends ConsumerWidget {
  const MyDesktopBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexStateProvider);
    final toggleListGroups = ref.watch(toggleListGroupsProvider);
    List<Widget> screens = [
      const CameraViewScreen(),
      const AccountScreen(),
      const SettingsScreen(),
    ];
    return Scaffold(
      body: Row(
        children: [
          const MyNavigationRail(),
          if (selectedIndex == 0 && toggleListGroups == true)
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.redAccent,
                child: const ListGroupView(),
              ),
            ),
          Expanded(flex: 7, child: screens[selectedIndex]),
        ],
      ),
    );
  }
}
