import 'package:flutter/material.dart';
import 'package:state_management/mvvm/utils/routes/routes_name.dart';

import '../utils/routes/utils.dart';

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
            // Utils.toastMessage("error");
            Utils.snackBar("No Internet Connection", context);
          },
          child: const Text('Click'),
        ),
      )
    );
  }
}
