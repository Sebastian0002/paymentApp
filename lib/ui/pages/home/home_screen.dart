import 'package:flutter/material.dart';
import 'package:payment_app/constants/items.dart';
import 'package:payment_app/ui/pages/home/widgets/widgets_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _index = 0;

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
      bottomNavigationBar: BottomNavigationBar(
        items: bottomItems, 
        currentIndex: _index,
        iconSize: 25,
        onTap: (index){
          setState(() {
            _index = index;
          });
        },
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
