import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/constants/items.dart';
import 'package:payment_app/domain/model/item.dart';
import 'package:payment_app/ui/pages/description/widgets/widgets.dart';
import 'package:payment_app/ui/pages/widgets/widgets.dart';
import 'package:payment_app/ui/theme/custom_colors.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.sizeOf(context).height * 0.48,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(70),
                  color: Colors.grey[200],
                  child: Image.asset(item.image)),
            ),
          ),
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          BoxRate(
                            icon: const Icon(Icons.star, color: Colors.amber),
                            text: item.stars,
                            ontap: () {},
                          ),
                          const SizedBox(width: 20),
                          BoxRate(
                            icon: Icon(FontAwesomeIcons.solidThumbsUp,
                                size: 20, color: CustomColors.primary),
                            text: item.likes.toString(),
                            ontap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(item.description,
                          style: const TextStyle(fontSize: 15)),
                      if (item.properties?.storages?.isNotEmpty ?? false)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Storage",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 40,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 10);
                                  },
                                  itemCount: item.properties!.storages!.length,
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final storages = item.properties!.storages!;
                                    return CardSelected(
                                        isSelected: false,
                                        title:
                                            "${getConvertedStorage(storages[index])} ${getStorageReference(storages[index])}");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(item: item),
    );
  }
}
