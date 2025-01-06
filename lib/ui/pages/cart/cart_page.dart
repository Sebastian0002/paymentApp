import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/services/cubit/cubits.dart';
import 'package:payment_app/ui/pages/cart/widgets/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  static const String route = '/scree_cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My cart"),
          leadingWidth: 55,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black26)),
              child: const Icon(Icons.arrow_back_ios_new_rounded,
                  size: 18, color: Colors.black),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 35,
                height: 35,
                margin: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black26)),
                child: const Icon(Icons.more_horiz_outlined,
                    size: 18, color: Colors.black),
              ),
            ),
            const SizedBox(width: 20)
          ],
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (_, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (context, index) {
                        return const Divider(color: Colors.black12);
                      },
                      itemCount: state.itemsCart.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemCart(index: index);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      _PayItems(
                        title: 'Subtotal:',
                        price: '0',
                      ),
                      const SizedBox(height: 10),
                      _PayItems(
                        title: 'DeliveryFee:',
                        price: state.deliveryFee.toStringAsFixed(2),
                      ),
                      const SizedBox(height: 10),
                      _PayItems(
                        title: 'Total:',
                        price: (900).toString(),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: const CustomBottomNavigatorCart(payPrice: 900));
  }
}

class _PayItems extends StatelessWidget {
  const _PayItems({required this.price, required this.title});

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        Text("\$$price",
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
      ],
    );
  }
}
