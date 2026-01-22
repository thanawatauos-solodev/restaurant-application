import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_application/core/theme/app_colors.dart';
import 'package:restaurant_application/navigation/route/constants/app_paths.dart';
import 'package:restaurant_application/shared/widgets/base/input/input_field.dart';
import 'package:restaurant_application/features/account/presentation/providers/login_provider.dart';
import 'package:restaurant_application/features/account/presentation/view_models/login_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final LoginViewModel _viewmodel;

  @override
  void initState() {
    super.initState();
    _viewmodel = ref.read(loginViewModelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _viewmodel.init();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titles = ["Log in", "Register"];
    final tabCount = titles.length;
    final currentIndex =
        ref.watch(loginViewModelProvider.select((state) => state.currentTab)) ??
        0;
    return Scaffold(
      backgroundColor: AppColors.softWhite,
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.fromLTRB(
          20,
          kToolbarHeight + MediaQuery.of(context).padding.top + 50,
          20,
          0,
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: .center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
              ),
              child: Icon(Icons.login, size: 32),
            ),
            Text('Savor Staff', style: Theme.of(context).textTheme.titleLarge),
            Text("Enterprise Restaurant Management"),

            Form(
              child: Column(
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.softWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        AnimatedAlign(
                          alignment: Alignment(
                            tabCount > 1
                                ? -1.0 + (currentIndex / (tabCount - 1)) * 2.0
                                : 0.0,
                            0,
                          ),
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear,
                          child: FractionallySizedBox(
                            widthFactor: 1 / tabCount,
                            heightFactor: 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.emeraldGreen,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),

                        _buildTabs(ref, currentIndex, titles),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                    alignment: Alignment.topCenter,
                    child: currentIndex == 1
                        ? Column(
                            children: [
                              InputField(
                                label: "FULL NAME",
                                hintText: 'Thanawat Launakorn',
                                prefixIcon: Icon(Icons.person_outlined),
                              ),
                              const SizedBox(height: 10),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                  InputField(
                    label: "EMAIL",
                    hintText: 'Example@gmail.com',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),

                  const SizedBox(height: 10),
                  InputField(
                    label: "PASSWORD",
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outlined),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.emeraldGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(6),
                        ),
                      ),
                      onPressed: () {
                        context.go(AppPaths.home);
                      },
                      child: Text(
                        'Sign In >',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: AppColors.softWhite),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs(WidgetRef ref, int currentIndex, List<String> titles) {
    return Row(
      children: List.generate(
        titles.length,
        (idx) => Expanded(
          child: _buildTabItem(
            titles[idx],
            currentIndex == idx,
            idx,
            ref,
            titles,
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(
    String title,
    bool isSelected,
    int index,
    WidgetRef ref,
    List<String> titles,
  ) {
    final isLastIndex = titles[titles.length - 1] == title;
    return GestureDetector(
      onTap: () {
        ref.read(loginViewModelProvider.notifier).onChangeTab(index);
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isLastIndex ? 0 : 10),
            bottomLeft: Radius.circular(isLastIndex ? 0 : 10),
            topRight: Radius.circular(isLastIndex ? 10 : 0),
            bottomRight: Radius.circular(isLastIndex ? 10 : 0),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: isSelected ? AppColors.softWhite : AppColors.emeraldGreen,
            fontWeight: isSelected ? .bold : .normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
