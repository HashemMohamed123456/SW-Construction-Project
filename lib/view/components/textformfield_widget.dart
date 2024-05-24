import 'package:flutter/material.dart';


import '../../view_model/utils/colors/colors.dart';
class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final bool? readOnly;
  final TextInputAction? textInputAction;
  final String? labelText;
  final IconData? icon;
  const TextFormFieldWidget({super.key,this.controller,this.keyboardType,this.onTap,this.readOnly=false,this.textInputAction=TextInputAction.next,this.labelText,this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(cursorColor: AppColors.scaffoldColor,
      style: const TextStyle(color: AppColors.scaffoldColor),
      controller:controller ,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly:readOnly??false ,
      textInputAction:textInputAction ,
      decoration: InputDecoration(floatingLabelStyle: const TextStyle(color:AppColors.scaffoldColor),prefixIcon: Icon(icon,color: AppColors.scaffoldColor,),labelText:labelText ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.scaffoldColor,width: 2),
          ),
          focusedBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.scaffoldColor,width: 3)
          )),
    );
  }
}
