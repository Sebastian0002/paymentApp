import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SeachField extends StatelessWidget {
  const SeachField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          boxShadow: const[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 5)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Search", style: TextStyle(color: Colors.black45)),
            SvgPicture.asset("assets/search.svg", width: 17)
          ],
        ),
      ),
    );
  }
}