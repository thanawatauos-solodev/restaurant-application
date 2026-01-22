import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_application/core/theme/app_colors.dart';
import 'package:restaurant_application/features/account/presentation/widgets/account_widgets.dart';
import 'package:restaurant_application/navigation/route/constants/app_paths.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.softWhite,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + kToolbarHeight,
          left: 16,
          right: 16,
        ),
        child: Column(
          crossAxisAlignment: .stretch,
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              spacing: 10,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.champagneGold,
                    shape: BoxShape.circle,
                    border: BoxBorder.all(width: 1, color: Colors.white),
                  ),
                  child: Icon(Icons.person_outline, size: 32),
                ),

                Text(
                  "John Doe",
                  textAlign: .center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Staff",
                  textAlign: .center,
                  style: Theme.of(context).textTheme.labelSmall,
                ),

                AccountBox(
                  title: 'Manage Account',
                  icon: Icon(
                    Icons.account_circle_outlined,
                    color: AppColors.emeraldGreen,
                  ),
                  onTap: () {},
                ),
                AccountBox(
                  title: "Settings",
                  icon: Icon(Icons.settings_outlined, color: Colors.brown),
                  onTap: () {},
                ),

                AccountBox(
                  title: "Log Out",
                  icon: Icon(Icons.logout, color: Colors.red),
                  onTap: () {
                    context.go(AppPaths.login);
                  },
                ),
              ],
            ),

            // Text(
            //   "version ${AppConfig.instance.config.environmentName}",
            //   textAlign: .center,
            // ),
          ],
        ),
      ),
    );
  }
}
