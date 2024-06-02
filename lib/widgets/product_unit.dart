import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductUnit extends StatelessWidget {
  final Function() onTap;
  final String title;
  const ProductUnit({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 59,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 201, 199, 199)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 3),
                child: Text(
                  '$title',
                  style: const TextStyle(
                      fontSize: 15, color: Color.fromARGB(255, 93, 134, 155)),
                ),
              ),
            ),
            const Center(
              child: Icon(
                Icons.arrow_drop_down,
                size: 12,
                color: Color.fromARGB(255, 93, 134, 155),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
