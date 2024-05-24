import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/view/components/textformfield_widget.dart';
import 'package:todo_app/view_model/bloc/todo_cubit.dart';
import 'package:todo_app/view_model/utils/colors/colors.dart';

import '../../components/text_custom.dart';
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoCubit.get(context).resetControllers();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldColor,
        title: const TextCustom(text: "Add Task",fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white,),
        centerTitle: true,

      ),
    body: Form(key: TodoCubit.get(context).formKey,child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(children: [
            TextFormFieldWidget(
              icon: Icons.title,
              controller: TodoCubit.get(context).titleController,
              labelText: 'Title',
            ),
            const SizedBox(height: 10,),
            TextFormFieldWidget(
              icon: Icons.description,
              controller: TodoCubit.get(context).descriptionController,
              labelText: 'Description',
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 10,),
            TextFormFieldWidget(
              icon: Icons.calendar_month,
              controller: TodoCubit.get(context).startDateController,
              labelText: 'Start Date',
              keyboardType: TextInputType.none,
              readOnly: true,
              onTap: (){
                showDatePicker(context: context,
                    initialDate: DateTime.now(),
                    firstDate:DateTime(2024,1,1),
                    lastDate:DateTime.now().add(const Duration(days: 365*3))
                ).then((value){
                  if(value!=null){
                  TodoCubit.get(context).startDateController.text=DateFormat.yMMMd().format(value);}
                });
              },
            ),
            const SizedBox(height: 10,),
            TextFormFieldWidget(icon: Icons.calendar_month,
              controller: TodoCubit.get(context).endDateController,
              labelText: 'End Date',
              keyboardType: TextInputType.none,
              readOnly: true,
              onTap: (){
                showDatePicker(context: context, initialDate: DateTime.now(),
                    firstDate:DateTime(2024,1,1),
                    lastDate:DateTime.now().add(const Duration(days: 365*3)
                    )
                ).then((value){
                  if(value!=null){
                  TodoCubit.get(context).endDateController.text=DateFormat.yMMMd().format(value);}
                })
                ;
              },
            ),
          ],),
        ),
      ),
          SafeArea(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:AppColors.scaffoldColor,
                  minimumSize: const Size(double.infinity,65),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
              onPressed: (){
              if(TodoCubit.get(context).formKey.currentState!.validate()){
                TodoCubit.get(context).addTask().then((value){
                  Navigator.pop(context);
                });
              }
              },
              child:const TextCustom(text: "Add Task",fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white) ),
          )
        ],
      ),
    ),),);
  }
}
