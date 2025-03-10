import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/services/cubit/cubits.dart';
import 'package:payment_app/ui/pages/constants/constants.dart';
import 'package:payment_app/ui/pages/widgets/widgets.dart';
import 'package:payment_app/ui/theme/custom_colors.dart';

class CustomBottomNavigatorCart extends StatelessWidget {
  const CustomBottomNavigatorCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final bool disabled = state.total.floor() == 0;
        return Container(
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                blurRadius: 2, color: Colors.black54, offset: Offset(0, 1))
          ]),
          width: MediaQuery.sizeOf(context).width,
          height: getHeightOfBottomNavigatior(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MaterialButton(
                disabledColor: Colors.grey,
                onPressed: disabled
                    ? null
                    : () async {
                        final res = await context.read<CartCubit>().doPay();
                        if (res.res) {
                          customAlertMessage(
                              title: const Text('Payment Successfully'),
                              content: const Text(
                                  "The payment has been accepted, your order is being processed, and we will send you an email when it is ready to be shipped."));
                        } else {
                          customAlertMessage(
                              title: const SizedBox(),
                              content: Text(res.msg ??
                                  'Unknown error. Please contact the administrator.'));
                        }
                      },
                minWidth: MediaQuery.sizeOf(context).width * 0.45,
                color: CustomColors.primary,
                child: Text("Pay for \$${state.formattedTotal}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        );
      },
    );
  }
}
