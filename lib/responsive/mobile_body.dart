import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sidebar_bottombar_navigation_playground/components/account_screen.dart';
import 'package:sidebar_bottombar_navigation_playground/components/bottom_navigation_bar.dart';
import 'package:sidebar_bottombar_navigation_playground/components/camera_view_screen.dart';
import 'package:sidebar_bottombar_navigation_playground/components/list_group_view.dart';
import 'package:sidebar_bottombar_navigation_playground/components/navigation_index_provider.dart';
import 'package:sidebar_bottombar_navigation_playground/components/settings_screen.dart';

class MyMobileBody extends ConsumerWidget {
  const MyMobileBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final selectedIndex = ref.watch(selectedIndexStateProvider);
    List<Widget> screens = [
      const CameraViewScreen(),
      const AccountScreen(),
      const SettingsScreen(),
    ];
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: selectedIndex != 0
              ? null
              : () {
                  scaffoldKey.currentState?.openDrawer();
                },
          icon: Icon(
            Icons.menu,
            color: selectedIndex != 0 ? Colors.grey : Colors.black,
          ),
        ),
      ),
      drawer: Drawer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Region',
              style: TextStyle(fontSize: 20),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.menu_open,
                color: Colors.black,
              ),
            ),
          ),
          body: const ListGroupView(),
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: Row(
        children: [
          Expanded(child: screens[selectedIndex]),
        ],
      ),
    );
  }
}
