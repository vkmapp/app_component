import 'package:flutter/material.dart';

class BubbleService extends StatelessWidget {
  const BubbleService({Key? key, required this.icon, required this.name})
      : super(key: key);

  final String name;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(width: 2, color: Colors.white)
              ),
              child: const Center(child: Icon(Icons.supervised_user_circle, color: Colors.white,),),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(name, style: TextStyle(fontSize: 12, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
