import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view/components/task/task_widget.dart';
import 'package:todo_app/view/components/text_custom.dart';
import 'package:todo_app/view/screens/add_task/add_task_screen.dart';
import 'package:todo_app/view/screens/edit_task/edit_task_screen.dart';
import 'package:todo_app/view_model/bloc/todo_cubit.dart';
import 'package:todo_app/view_model/utils/colors/colors.dart';
class TasksHomeScreen extends StatelessWidget {
   const TasksHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.scaffoldColor,title: const TextCustom(text: 'Todo App',color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),centerTitle: true,),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocConsumer<TodoCubit,TodoState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Visibility(replacement:  const Center(child:  TextCustom(text: 'No Tasks Are Added',color: AppColors.scaffoldColor,fontSize:30,fontWeight: FontWeight.bold,)),
      visible: TodoCubit.get(context).cubitTaskModel.isNotEmpty,
      child: ListView.separated(itemBuilder: (context,index){
              return InkWell(onTap: (){
                TodoCubit.get(context).changeIndex(index);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditTaskScreen()));
              },child: TaskWidget(task: TodoCubit.get(context).cubitTaskModel[index]));
            }, separatorBuilder:(context, index) =>const  Divider(color: AppColors.scaffoldColor), itemCount:TodoCubit.get(context).cubitTaskModel.length),
    );
  },
),
        ),
      ),
    floatingActionButton:FloatingActionButton(backgroundColor: AppColors.scaffoldColor,onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddTaskScreen()));
    },child: const Icon(Icons.add,color:Colors.white),),);
  }
}
