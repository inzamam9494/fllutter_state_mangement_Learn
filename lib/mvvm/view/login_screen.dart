import 'package:flutter/material.dart';
import 'package:state_management/mvvm/utils/routes/routes_name.dart';

class LoginScreenMVVM extends StatefulWidget {
  const LoginScreenMVVM({super.key});

  @override
  State<LoginScreenMVVM> createState() => _LoginScreenMVVMState();
}

class _LoginScreenMVVMState extends State<LoginScreenMVVM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, RoutesName.home);
          },
          child: const Text('Click'),
        ),
      )
    );
  }
}
