import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexStateProvider = StateProvider<int>((ref) => 0);

final toggleListGroupsProvider = StateProvider<bool>((ref) => false);
