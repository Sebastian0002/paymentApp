import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_app/domain/model/item.dart';
import 'package:payment_app/ui/pages/constants/constants.dart';
import 'package:payment_app/ui/pages/description/widgets/widgets.dart';
import 'package:payment_app/ui/theme/custom_colors.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({super.key, required this.item});

  final Item item;

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  late bool isLike;
  @override
  void initState() {
    isLike = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            leadingWidth: 45,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_back_ios_new_rounded,
                      size: 18, color: Colors.black),
                ),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLike = !isLike;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Icon(
                      key: ValueKey(isLike),
                      Icons.favorite,
                      color: isLike ? Colors.red : Colors.black,
                      size: 24,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.share, color: Colors.black),
              ),
              const SizedBox(width: 10)
            ],
            expandedHeight: MediaQuery.sizeOf(context).height * 0.48,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(70),
                  color: Colors.grey[200],
                  child: Hero(
                      tag: 'Image-hero-${widget.item.image}',
                      child: Image.asset(widget.item.image))),
            ),
          ),
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: Container(
                height: widget.item.properties == null
                    ? (MediaQuery.sizeOf(context).height * 0.52) -
                        getHeightOfBottomNavigatior(context)
                    : null,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.item.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          BoxRate(
                            icon: const Icon(Icons.star, color: Colors.amber),
                            text: widget.item.stars,
                            ontap: () {},
                          ),
                          const SizedBox(width: 20),
                          BoxRate(
                            icon: Icon(FontAwesomeIcons.solidThumbsUp,
                                size: 20, color: CustomColors.primary),
                            text: widget.item.likes.toString(),
                            ontap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(widget.item.description,
                          style: const TextStyle(fontSize: 15)),
                      PropertiesDetails(item: widget.item),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(item: widget.item),
    );
  }
}
