import 'package:flutter/material.dart';
import 'package:learning_english_with_getx/core/constants/app_style_constants.dart';

Widget chipWordType({required String type, required double width, required double height})
{
  return Padding(
    padding: const EdgeInsets.all(2.0),
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorByWordType(type),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Center(
        child: Text(type, style: TextStyle(color: Colors.white),),
      ),
    ),
  );
}

Color colorByWordType(String type)
{
  if(type == "n" || type == "danh từ")
  {
    return AppStyles.lightGreen;
  }
  if(type == "v" || type == "động từ")
  {
    return AppStyles.yellow;
  }
  if(type == "adj" || type == "tính từ")
  {
    return AppStyles.red;
  }
  if(type == "adv" || type == "trạng từ")
  {
    return AppStyles.blue;
  }
  if(type == "pre" || type == "giới từ")
  {
    return AppStyles.violet;
  }

  return AppStyles.beige;
}