import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../models/Item.dart';
import '../../../../../configs/constants.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: TextStyle(
                  fontSize: 24
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/star.svg',
                  width: kDefaultPadding * 0.8,
                ),

                SizedBox(width: kDefaultPadding * 0.5),

                Text(
                    '${item.rating.toString()} (${item.ratingCount.toString()})'
                )
              ],
            )
          ],
        ),

        IconButton(
            icon: SvgPicture.asset('assets/icons/heart.svg'),
            onPressed: () {}
        )
      ],
    );
  }
}