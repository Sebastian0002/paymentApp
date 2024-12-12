import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/bloc/card/card_bloc.dart';
import 'package:payment_app/routes/routes.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => CardBloc())
    ],
    child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
