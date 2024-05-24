part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}
class AddedTaskSuccessState extends TodoState{}
class EditedTaskState extends TodoState{}
class DeletedTaskState extends TodoState{}
