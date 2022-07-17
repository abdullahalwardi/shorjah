import 'package:flutter/material.dart';
import 'package:shop/components/custom_modal_bottom_sheet.dart';
import 'package:shop/components/my_outlined_button.dart';
import 'package:shop/components/product/product_card.dart';
import 'package:shop/components/small_button.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/route/route_constants.dart';
import 'package:shop/screens/home/views/components/categories.dart';
import 'package:shop/screens/search/views/components/search_filter.dart';
import '../../../constants.dart';

List<CategoryModel> clothesSubCategories = [
  CategoryModel(name: "All Categories"),
  CategoryModel(
      name: "Man",
      svgSrc: "assets/icons/Man.svg",
      route: manCategoryScreenRoute),
  CategoryModel(name: "Woman", svgSrc: "assets/icons/Woman.svg"),
  CategoryModel(name: "Kids", svgSrc: "assets/icons/Man&Woman.svg"),
  // CategoryModel(
  //     name: "Kids", svgSrc: "assets/icons/Child.svg", route: kidsScreenRoute),
];

class ClothesCategory extends StatefulWidget {
  const ClothesCategory({Key? key}) : super(key: key);

  @override
  State<ClothesCategory> createState() => _ClothesCategoryState();
}

class _ClothesCategoryState extends State<ClothesCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            title: Text("Clothes"),
            actions: [],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            sliver: SliverToBoxAdapter(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Here we will put the sort and filter
                    MySmallButton(
                      press: () {},
                      svgSrc: 'assets/icons/Category.svg',
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.375,
                    ),
                    MyOutlinedButton(
                      press: () {
                        customModalBottomSheet(
                          context,
                          height: MediaQuery.of(context).size.height * 0.92,
                          child: const SearchFilter(),
                        );
                      },
                      text: 'Filter',
                      svgSrc: 'assets/icons/Filter.svg',
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 3)),
                    MyOutlinedButton(
                      press: () {
                        customModalBottomSheet(
                          context,
                          height: MediaQuery.of(context).size.height * 0.92,
                          child: const SearchFilter(),
                        );
                      },
                      text: 'Sort',
                      svgSrc: 'assets/icons/Sort.svg',
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Categories(
            categoriesList: clothesSubCategories,
          )),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: defaultPadding,
                crossAxisSpacing: defaultPadding,
                childAspectRatio: 0.66,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ProductCard(
                    image: demoPopularProducts[index].image,
                    brandName: demoPopularProducts[index].brandName,
                    title: demoPopularProducts[index].title,
                    price: demoPopularProducts[index].price,
                    priceAfetDiscount:
                        demoPopularProducts[index].priceAfetDiscount,
                    dicountpercent: demoPopularProducts[index].dicountpercent,
                    press: () {
                      Navigator.pushNamed(context, productDetailsScreenRoute);
                    },
                  );
                },
                childCount: demoPopularProducts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
