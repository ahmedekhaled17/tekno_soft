import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final IconData icon;
  const CustomButton({
    super.key, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize:const Size(double.infinity, 55),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: (){
          Navigator.pop(context);
        },
        child: (
            const Row (
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text("TRY AGAIN",style: TextStyle(fontSize: 20),),
                Icon(Icons.refresh_outlined),
              ],
            )));
  }
}