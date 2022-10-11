import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sidebar_bottombar_navigation_playground/components/navigation_index_provider.dart';

class MyNavigationRail extends ConsumerWidget {
  const MyNavigationRail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexStateProvider);
    final toggleListGroups = ref.watch(toggleListGroupsProvider);
    return NavigationRail(
      onDestinationSelected: (int index) {
        ref.read(selectedIndexStateProvider.state).state = index;
      },
      selectedIndex: selectedIndex,
      labelType: NavigationRailLabelType.none,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home_outlined),
          label: Text('Cameras'),
          selectedIcon: Icon(Icons.home),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person_outline),
          label: Text('Account'),
          selectedIcon: Icon(Icons.person),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.settings_outlined),
          label: Text('Settings'),
          selectedIcon: Icon(Icons.settings),
        ),
      ],
      leading: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          IconButton(
            icon: toggleListGroups ? const Icon(Icons.menu_open) : const Icon(Icons.menu),
            onPressed: selectedIndex != 0
                ? null
                : () {
                    ref.read(toggleListGroupsProvider.state).state = !toggleListGroups;
                  },
          ),
        ],
      ),
    );
  }
}
