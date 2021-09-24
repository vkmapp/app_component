import 'package:flutter/material.dart';

import 'card/bank_card.dart';
class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: ListWheelScrollView(itemExtent: 250,
          children: const [
            BankCard(),
            BankCard(),
            BankCard(),
            BankCard(),
          ],),
        ),
      ),
    );
  }
}
