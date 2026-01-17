import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_application/navigation/bottom_navigation/tabbar_layout.dart';
import 'package:restaurant_application/navigation/route/constants/app_paths.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            spacing: 20,
            mainAxisAlignment: .center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'username da',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'password test hello',
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  context.go(AppPaths.home);

                  ref.read(bottomTabIndexProvider.notifier).state = 0;
                },
                child: Text('button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
