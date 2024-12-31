import 'package:flutter/material.dart';
import 'package:payment_app/ui/pages/home/widgets/widgets_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String route = '/home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Expanded(child: Text("E-commerce")),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CarButton(),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: BodyHome(),
      ),
    );
  }
}

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        spacing: 30,
        children: [
          SeachField(),
          TopBanner(),
          BodyHomeItems()
        ],
      ),
    );
  }
}
