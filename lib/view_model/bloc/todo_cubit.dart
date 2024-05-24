import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/task_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
  static TodoCubit get(context)=>BlocProvider.of<TodoCubit>(context);
  List<TaskModel>cubitTaskModel=[];
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  TextEditingController titleController= TextEditingController();
  TextEditingController descriptionController= TextEditingController();
  TextEditingController startDateController= TextEditingController();
  TextEditingController endDateController= TextEditingController();

  Future<void> addTask() async{
    TaskModel newTaskObject=TaskModel(
      name:titleController.text,
      description: descriptionController.text,
      firstDate: startDateController.text,
      lastDate: endDateController.text,
    );
    cubitTaskModel.add(newTaskObject);
    resetControllers();
    emit(AddedTaskSuccessState());
  }
  void resetControllers(){
    titleController.clear();
    descriptionController.clear();
    startDateController.clear();
    endDateController.clear();
  }
  int currentIndex=0;
  void changeIndex(int index){
    currentIndex=index;
    titleController.text=cubitTaskModel[index].name??'';
    descriptionController.text=cubitTaskModel[index].description??'';
    startDateController.text=cubitTaskModel[index].firstDate??"";
    endDateController.text=cubitTaskModel[index].lastDate??'';
  }
  Future<void>editTask() async{
    cubitTaskModel[currentIndex].name=titleController.text;
    cubitTaskModel[currentIndex].description=descriptionController.text;
    cubitTaskModel[currentIndex].firstDate=startDateController.text;
    cubitTaskModel[currentIndex].lastDate=endDateController.text;
    emit(EditedTaskState());
  }
  Future<void>deleteTask()async{
    cubitTaskModel.removeAt(currentIndex);
    emit(DeletedTaskState());
  }
}
