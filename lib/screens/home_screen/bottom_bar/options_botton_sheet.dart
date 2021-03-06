import 'package:flutter/material.dart';
import 'package:tasks/blocs/task_lists/task_lists_provider.dart';
import 'package:tasks/model/task_list.dart';
import 'package:tasks/screens/home_screen/bottom_bar/sort_dialog.dart';
import 'package:tasks/screens/list_screen/list_screen.dart';
import 'package:tasks/model/order.dart';

class OptionsBottomSheet extends StatelessWidget {
  const OptionsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = TaskListsProvider.of(context);
    var index = bloc.getCurrentIndex();
    return StreamBuilder(
      stream: bloc.taskLists,
      builder: (context, AsyncSnapshot<List<TaskList>> snapshot) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 15),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 30),
              title: const Text('Sort by'),
              subtitle: Text(snapshot.data?[index].order == Order.date ? 'Date' : 'Default'),
              onTap: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return const SortDialog();
                  },
                );
              },
            ),
            const Divider(),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 30),
              title: const Text('Rename list'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(
                  ListScreen.routeName,
                  arguments: snapshot.data![index].name,
                );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 30),
              title: const Text('Delete list'),
              onTap: () {
                bloc.deleteTaskList();
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 30),
              title: const Text('Delete all completed tasks'),
              onTap: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      title: const Text('Delete'),
                      content: const Text('Are you sure?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            bloc.deleteCompletedTasks();
                            Navigator.of(ctx).pop();
                          },
                          child: const Text('OK'),
                        )
                      ],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        );
      }
    );
  }
}
