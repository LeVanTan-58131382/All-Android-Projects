import 'package:flutter/material.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "Combo Meal",
            isActive: true,
            press: () {},
          ),
          CategoryItem(
            title: "Chicken",
            press: () {},
          ),
          CategoryItem(
            title: "Beverages",
            press: () {},
          ),
          CategoryItem(
            title: "Snacks & Sides",
            press: () {},
          ),
        ],
      ),
    );
  }
}
