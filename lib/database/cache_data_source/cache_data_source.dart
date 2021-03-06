import 'package:tasks/model/task.dart';
import 'package:tasks/model/task_list.dart';
import 'package:tasks/model/order.dart';

abstract class CacheDataSource {

  Future<void> init();

  Stream<List<TaskList>> getTaskListsAsStream();

  Future<List<TaskList>> getTaskLists();

  Future<void> addTaskList(TaskList taskList);

  Future<int> getTaskListId(String name);

  void renameTaskList(String name, int index);

  void updateTaskListOrder(Order order, int index);

  void syncTaskLists(List<TaskList> taskLists);

  void deleteTaskList(int index);

  // Task
  Future<Task> getTaskById(String id, int index);

  void addTask(Task task, int index);

  void updateTask(Task task, int index);

  void toggleCompleted(Task task, int index);

  Future<int> changeTaskList(Task task, String name, int index);

  void deleteTask(Task task, int index);

  void deleteCompletedTasks(int index);

  void deleteDatabase();
}