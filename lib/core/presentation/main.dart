import 'package:blue_meth_registery/app_router.dart';
import 'package:blue_meth_registery/core/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({super.key,required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //onGenerateRoute expects a function reference, not the result of a function.
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
