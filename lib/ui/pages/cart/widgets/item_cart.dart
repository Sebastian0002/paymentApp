import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/services/cubit/cubits.dart';
import 'package:payment_app/ui/theme/custom_colors.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    return BlocBuilder<CartCubit, CartState>(
      builder: (_, state) {
        final item = state.itemsCart[index];
        return SizedBox(
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                padding: const EdgeInsets.all(15),
                width: 130,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(item.image, fit: BoxFit.contain),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            item.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          )),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              cartCubit.removeItem(item);
                            },
                            child: const Icon(Icons.close,
                                color: Colors.grey, size: 22),
                          )
                        ],
                      ),
                      ...item.finalProperties.map((e) {
                        return Text(
                          e != null ? e.toString() : '',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                              fontSize: 13),
                        );
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "\$${item.formattedPrice}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Row(children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                cartCubit.decraseItemQuantity(item);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black54)),
                                child: const Icon(
                                  FontAwesomeIcons.minus,
                                  size: 20,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              item.quantity.toString(),
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                cartCubit.addItem(item);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: CustomColors.primary, width: 2)),
                                child: Icon(Icons.add,
                                    size: 20, color: CustomColors.primary),
                              ),
                            ),
                          ])
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
