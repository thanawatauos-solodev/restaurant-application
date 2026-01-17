import 'package:flutter/material.dart';
import 'package:restaurant_application/core/config/app_config.dart';
import 'package:restaurant_application/core/theme/app_colors.dart';
import 'package:restaurant_application/features/account/presentation/widgets/account_widgets.dart';

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

                AccountBox(),
                const SizedBox(height: 10),
                AccountBox(),
                const SizedBox(height: 10),

                AccountBox(),
                const SizedBox(height: 10),
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
