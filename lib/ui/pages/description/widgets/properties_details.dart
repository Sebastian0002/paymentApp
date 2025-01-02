import 'package:flutter/material.dart';
import 'package:payment_app/constants/items.dart';
import 'package:payment_app/domain/model/item.dart';
import 'package:payment_app/ui/pages/widgets/card_selected.dart';

class PropertiesDetails extends StatelessWidget {
  const PropertiesDetails({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                    return InkWell(
                      onTap: (){
                        
                      },
                      child: CardSelected(
                          isSelected: false,
                          title:
                              "${getConvertedStorage(storages[index])} ${getStorageReference(storages[index])}"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        if (item.properties?.colors?.isNotEmpty ?? false)
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Color",
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
                    final colors = item.properties!.colors!;
                    return InkWell(
                      onTap: (){

                      },
                      child: CardSelected(
                          isSelected: false,
                          title: colors[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        if (item.properties?.sizes?.isNotEmpty ?? false)
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Size",
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
                  itemCount: item.properties!.sizes!.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (BuildContext context, int index) {
                    final sizes = item.properties!.sizes!;
                    return InkWell(
                      onTap: (){},
                      child: CardSelected(
                          isSelected: false,
                          title: sizes[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
