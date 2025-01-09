
import 'package:flutter/material.dart';
import 'package:payment_app/ui/theme/custom_colors.dart';

class CardSelected extends StatelessWidget {
  const CardSelected({
    super.key,
    required this.isSelected,
    required this.title,
  });

  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isSelected ? CustomColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? null : Border.all(width: 2)),
      child: Text(title,
          style: TextStyle(
              color: isSelected ? Colors.white : null,
              fontWeight: FontWeight.w600)),
    );
  }
}