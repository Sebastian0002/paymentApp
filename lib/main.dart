import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/routes/routes.dart';
import 'package:payment_app/services/bloc/blocs.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => PaymentBloc())
    ],
    child: const MainApp()));
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
        appBarTheme: const AppBarTheme(
          color: Colors.white
        )
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoutes,
      routes: Routes.routes,
    );
  }
}
