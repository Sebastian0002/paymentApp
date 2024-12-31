import 'package:flutter/material.dart';
import 'package:payment_app/constants/items.dart';
import 'package:payment_app/domain/model/item_category.dart';
import 'package:payment_app/ui/pages/home/widgets/card_item.dart';
import 'package:payment_app/ui/theme/custom_colors.dart';

class BodyHomeItems extends StatelessWidget {
  const BodyHomeItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                    onTap: () {},
                    child: Text("See all",
                        style: TextStyle(
                            color: CustomColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 16)))
              ],
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 40,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 10);
                },
                itemCount: categoryItems.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return _CategoryButton(
                      onTap: () {}, category: categoryItems[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                crossAxisCount: 2),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return CardItem(item: items[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({required this.category, required this.onTap});

  final ItemCategory category;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = category.isSelected!;
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected ? CustomColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isSelected ? null : Border.all(width: 2)),
        child: Text(category.name,
            style: TextStyle(
                color: isSelected ? Colors.white : null,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}
