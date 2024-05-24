import 'package:flutter/material.dart';
import 'package:todo_app/model/task_model.dart';

import '../../../view_model/utils/colors/colors.dart';
import '../text_custom.dart';
class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key,required this.task});
final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: AppColors.scaffoldColor
          )
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.title,color: Colors.white,),
              const SizedBox(width: 10,),
              TextCustom(text:": ${task.name}" ,color:Colors.white ,fontSize:20,),
            ],
          ),
          const SizedBox(height: 5,),
           Row(
             children: [
               const Icon(Icons.description,color: Colors.white,),
               const SizedBox(width: 10,),
               TextCustom(text:": ${task.description}",color:Colors.white,fontSize: 20,),
             ],
           ),

        ],
      ),
    );
  }
}
