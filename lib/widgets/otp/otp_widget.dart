import 'package:app_component/widgets/otp/verification_code.dart';
import 'package:flutter/material.dart';

class OTPWidget extends StatefulWidget {
  const OTPWidget({Key? key}) : super(key: key);

  @override
  _OTPWidgetState createState() => _OTPWidgetState();
}

class _OTPWidgetState extends State<OTPWidget> {

  @override
  Widget build(BuildContext context) {
    return const TextField(key: Key('Test'),);
  }
}
