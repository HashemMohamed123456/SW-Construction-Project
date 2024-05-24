import 'package:flutter/material.dart';
class TextCustom extends StatelessWidget {
  const TextCustom({super.key,required this.text,this.fontWeight,this.fontSize,this.overflow,this.color});
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? overflow;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontWeight:fontWeight,color:color,fontSize:fontSize,overflow:overflow ),);

  }
}