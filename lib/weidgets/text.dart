
import 'package:flutter/material.dart';

class CustomTextwidget extends StatelessWidget {
  const CustomTextwidget({super.key, required this.Title, this.maxLine, this.color, this.fW, this.fS});

  final String Title;
  final int? maxLine;
  final Color? color;
  final FontWeight? fW;
  final double? fS;

  @override
  Widget build(BuildContext context) {
    return Text(
      Title,
      maxLines : maxLine?? 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color?? Colors.white,
        fontWeight: fW?? FontWeight.w400,
        fontSize: fS?? 17,
      ),

    );
  }
}
