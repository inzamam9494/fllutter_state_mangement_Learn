import 'package:flutter/material.dart';
import 'package:state_management/mvvm/utils/routes/routes_name.dart';

import '../utils/routes/utils.dart';

class LoginScreenMVVM extends StatefulWidget {
  const LoginScreenMVVM({super.key});

  @override
  State<LoginScreenMVVM> createState() => _LoginScreenMVVMState();
}

class _LoginScreenMVVMState extends State<LoginScreenMVVM> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: "Email",
                labelText: "Email",
                prefixIcon: Icon(Icons.alternate_email)
              ),
              onFieldSubmitted: (value){
               Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child){
                  return TextFormField(
                    controller: _passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: _obsecurePassword.value,
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                          onTap: (){
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                            child: Icon(
                                _obsecurePassword.value ?
                                Icons.visibility_off_outlined: Icons.visibility_outlined))
                    ),
                  );
                })

          ],
        ),
      )
    );
  }
}
