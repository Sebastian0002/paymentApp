import 'package:flutter/material.dart';

double getHeightOfBottomNavigatior(BuildContext context) {
      final viewPadding = MediaQuery.of(context).viewPadding;
      return viewPadding.bottom > 0 ? 100.0 : 90.0;
    }