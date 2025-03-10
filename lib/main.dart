import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/services/cubit/cubits.dart';
import 'package:payment_app/services/stripe_service.dart';
import 'package:payment_app/ui/routes/routes.dart';
import 'package:payment_app/ui/theme/custom_colors.dart';

void main() {
  StripeService().init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => ItemCubit()),
    BlocProvider(create: (_) => CartCubit()),
  ], child: const MainApp()));
}

final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigationKey,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(color: Colors.white),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: CustomColors.primary,
              unselectedItemColor: Colors.black),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStateColor.resolveWith((_)=> CustomColors.primary)
            )
          )
          ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoutes,
      routes: Routes.routes,
    );
  }
}
