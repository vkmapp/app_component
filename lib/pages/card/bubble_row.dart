import 'package:flutter/material.dart';
class BubbleRow extends StatelessWidget {
  const BubbleRow({Key? key, required this.icon, required this.name}) : super(key: key);

  final String name;

  final IconData icon;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: SingleChildScrollView(
        child: Material(
          color: Colors.transparent,
          child: InkWell(onTap: (){},child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(width: 1, color: Colors.white)
                ),
                child: const Center(child: Icon(Icons.supervised_user_circle, color: Colors.white,),),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(name, style: TextStyle(fontSize: 12, color: Colors.white),)
            ],
          ),),
        ),
      ),
    );
  }
}
