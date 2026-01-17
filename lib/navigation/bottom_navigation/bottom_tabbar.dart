import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_application/core/theme/app_colors.dart';
import 'package:restaurant_application/navigation/bottom_navigation/tabbar_layout.dart';
import 'package:restaurant_application/features/menu/presentation/views/menu_screen.dart';
import 'package:restaurant_application/features/table/presentation/views/table_screen.dart';
import 'package:restaurant_application/features/order/presentation/views/order_screen.dart';
import 'package:restaurant_application/features/account/presentation/views/account_screen.dart';

class BottomTabbar extends ConsumerWidget {
  const BottomTabbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomTabIndexProvider);

    final List<Widget> tabs = const [
      TableScreen(),
      MenuScreen(),
      OrderScreen(),
      AccountScreen(),
    ];

    void onTabItem(int index) {
      ref.read(bottomTabIndexProvider.notifier).state = index;
    }

    return Scaffold(
      body: tabs[index],
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          backgroundColor: AppColors.amberCleaning,
          shape: const CircleBorder(),
          onPressed: () {},
          child: Text(
            "+",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: .bold,
              color: AppColors.softWhite,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: AppColors.champagneGold,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            _TabItem(
              icon: index == 0 ? Icons.table_bar : Icons.table_bar_outlined,
              label: 'Table',
              onTap: () {
                onTabItem(0);
              },
            ),
            _TabItem(
              icon: index == 1 ? Icons.fastfood : Icons.fastfood_outlined,
              label: 'Menu',
              onTap: () {
                onTabItem(1);
              },
            ),
            _TabItem(
              icon: index == 2
                  ? Icons.shopping_bag
                  : Icons.shopping_bag_outlined,
              label: 'Order',
              onTap: () {
                onTabItem(2);
              },
            ),
            _TabItem(
              icon: index == 3 ? Icons.person : Icons.person_outline,
              label: 'Profile',
              onTap: () {
                onTabItem(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _TabItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<_TabItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.8,
      upperBound: 1.0,
    );
    _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.reverse().then((_) {
      _controller.forward();
      widget.onTap();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _controller,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon, color: Colors.black),
              Expanded(
                child: Text(
                  widget.label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
