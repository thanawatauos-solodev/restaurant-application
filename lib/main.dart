import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant_application/navigation/route/go_route.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  void initState() {
    super.initState();

    initailizeUser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: TextTheme(labelSmall: TextStyle())),
      routerConfig: router,
      builder: (context, child) {
        return Scaffold(body: Stack(children: [child!]));
      },
    );
  }

  Future<void> initailizeUser() async {}
}
