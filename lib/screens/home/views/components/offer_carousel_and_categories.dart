import 'package:flutter/material.dart';
import 'package:shop/route/route_constants.dart';

import '../../../../constants.dart';
import 'categories.dart';
import 'offers_carousel.dart';

List<CategoryModel> demoCategories = [
  CategoryModel(name: "All Categories"),
  CategoryModel(
      name: "Clothes",
      svgSrc: "assets/icons/Shop.svg",
      route: clothesCategoryScreenRoute),
  CategoryModel(name: "Beauty", svgSrc: "assets/icons/Woman.svg"),
  CategoryModel(name: "Home & Kitchen", svgSrc: "assets/icons/Sale.svg"),
  // CategoryModel(
  //     name: "Kids", svgSrc: "assets/icons/Child.svg", route: kidsScreenRoute),
];

class OffersCarouselAndCategories extends StatelessWidget {
  const OffersCarouselAndCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OffersCarousel(),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Categories",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Categories(
          categoriesList: demoCategories,
        ),
      ],
    );
  }
}
