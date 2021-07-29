import 'package:flutter/material.dart';
import 'package:learning_english/configs/colors.dart';

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
      return AppColors.lightGreen;
    }
  if(type == "v" || type == "động từ")
    {
      return AppColors.yellow;
    }
  if(type == "adj" || type == "tính từ")
    {
      return AppColors.red;
    }
  if(type == "adv" || type == "trạng từ")
    {
      return AppColors.blue;
    }
  if(type == "pre" || type == "giới từ")
    {
      return AppColors.violet;
    }

  return AppColors.beige;
}