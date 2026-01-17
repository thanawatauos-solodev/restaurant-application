import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomTabIndexProvider = StateProvider<int>((ref) => 0);

class TabbarLayout extends ConsumerWidget {
  const TabbarLayout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(height: 84, decoration: BoxDecoration(color: Colors.red));
  }
}
