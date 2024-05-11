import 'package:flutter/material.dart';
class ContainerFemale extends StatelessWidget {
  const ContainerFemale({
    super.key,
    required this.isMale, required this.text, required this.icon,
  });

  final bool isMale;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: !isMale ? Colors.blue : Colors.grey[400]),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            text,
            style:const TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
