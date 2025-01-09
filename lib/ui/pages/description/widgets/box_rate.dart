import 'package:flutter/material.dart';

class BoxRate extends StatelessWidget {
  const BoxRate({super.key, required this.icon, required this.text, this.ontap});
  final Icon icon;
  final String text;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(100)
          ),
          child: Row(
            children: [
              icon,
              const SizedBox(width: 10),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}