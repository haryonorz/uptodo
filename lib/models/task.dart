import 'package:uptodo/models/task_category.dart';

class Task {
  final int id;
  final String title;
  final String description;
  final DateTime dateTime;
  final TaskCategory taskCategory;
  final int numberPriority;
  final bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.taskCategory,
    required this.numberPriority,
    this.isCompleted = false,
  });
}

List<Task> listTasks = [
  Task(
    id: 0,
    title: 'Do Math Homework',
    description: 'Do chapter 2 to 5 for next week',
    dateTime: DateTime.parse('2022-09-06 15:00:00'),
    taskCategory: listCategoryTask[4],
    numberPriority: 1,
  ),
  Task(
    id: 1,
    title: 'Take out dogs',
    description: 'Surrounding the house complex',
    dateTime: DateTime.parse('2022-09-06 18:20:00'),
    taskCategory: listCategoryTask[9],
    numberPriority: 2,
  ),
  Task(
    id: 2,
    title: 'Business meeting with CEO',
    description: "Discussing this month's sales",
    dateTime: DateTime.parse('2022-09-05 08:15:00'),
    taskCategory: listCategoryTask[1],
    numberPriority: 3,
  ),
  Task(
    id: 3,
    title: 'Buy Grocery',
    description: 'Buying household needs this month',
    dateTime: DateTime.parse('2022-09-06 16:45:00'),
    taskCategory: listCategoryTask[0],
    numberPriority: 1,
    isCompleted: true,
  ),
];
