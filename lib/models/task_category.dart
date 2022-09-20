import 'package:flutter/material.dart';

class TaskCategory {
  final String name;
  final String iconPath;
  final Color color;

  TaskCategory({
    required this.name,
    required this.iconPath,
    required this.color,
  });
}

List<TaskCategory> listCategoryTask = [
  TaskCategory(
    name: 'Grocery',
    iconPath: 'assets/icons/label_grocery.svg',
    color: const Color(0xFFCCFF80),
  ),
  TaskCategory(
    name: 'Work',
    iconPath: 'assets/icons/label_work.svg',
    color: const Color(0xFFFF9680),
  ),
  TaskCategory(
    name: 'Sport',
    iconPath: 'assets/icons/label_sport.svg',
    color: const Color(0xFF80FFFF),
  ),
  TaskCategory(
    name: 'Design',
    iconPath: 'assets/icons/label_design.svg',
    color: const Color(0xFF80FFD9),
  ),
  TaskCategory(
    name: 'University',
    iconPath: 'assets/icons/label_university.svg',
    color: const Color(0xFF809CFF),
  ),
  TaskCategory(
    name: 'Social',
    iconPath: 'assets/icons/label_social.svg',
    color: const Color(0xFFFF80EB),
  ),
  TaskCategory(
    name: 'Music',
    iconPath: 'assets/icons/label_music.svg',
    color: const Color(0xFFFC80FF),
  ),
  TaskCategory(
    name: 'Health',
    iconPath: 'assets/icons/label_health.svg',
    color: const Color(0xFF80FFA3),
  ),
  TaskCategory(
    name: 'Movie',
    iconPath: 'assets/icons/label_movie.svg',
    color: const Color(0xFF80D1FF),
  ),
  TaskCategory(
    name: 'Home',
    iconPath: 'assets/icons/label_home.svg',
    color: const Color(0xFFFF8080),
  ),
];
