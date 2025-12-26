import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget{
  CategoryChip({super.key});

  final categories = ['Mountains', 'Temples', 'Lakes', 'Cities'];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 50,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      separatorBuilder: (_, _) => const SizedBox(width: 10),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            categories[index],
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        );
      },
    ),
  );
  }
}