import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/mvvm/resouces/components/round_button.dart';
import 'package:state_management/mvvm/view_model/auth_view_model.dart';

import '../utils/routes/routes_name.dart';
import '../utils/routes/utils.dart';

class SignUpScreenMVVM extends StatefulWidget {
  const SignUpScreenMVVM({super.key});

  @override
  State<SignUpScreenMVVM> createState() => _SignUpScreenMVVMState();
}

class _SignUpScreenMVVMState extends State<SignUpScreenMVVM> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  ValueNotifier<bool> _confirmObsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade400,
        title: const Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios,
          color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              focusNode: emailFocusNode,
              controller: _emailController,
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
                    focusNode: passwordFocusNode,
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                          onTap: (){
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                            child: Icon(
                              _obsecurePassword.value ?
                                Icons.visibility_off_outlined : Icons.visibility_outlined))
                    ),
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, passwordFocusNode, confirmPasswordFocusNode);
                    },
                  );
                }),
            ValueListenableBuilder(valueListenable: _confirmObsecurePassword,
                builder: (context,value,child){
              return TextFormField(
                focusNode: confirmPasswordFocusNode,
                controller: _confirmPasswordController,
                obscureText: _confirmObsecurePassword.value,
                decoration: InputDecoration(
                    hintText: "Confirm Password",
                    labelText: "Confirm Password",
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                        onTap: (){
                          _confirmObsecurePassword.value = !_confirmObsecurePassword.value;
                        },
                        child: Icon( _confirmObsecurePassword.value?
                        Icons.visibility_off_outlined : Icons.visibility_outlined))
                ),
              );
                }),
            SizedBox(height: height * 0.050,),
            RoundButton(title: 'Sign Up',
                loading: authViewModel.signUpLoading,
                onPress: (){
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please enter email', context);
                  }else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please enter password', context);
                  }else if(_passwordController.text.length < 6){
                    Utils.flushBarErrorMessage('Please enter 6 digits', context);
                  }else if(_passwordController == _confirmPasswordController){
                    Utils.flushBarErrorMessage("Password doesn't matched", context);
                  }
                  else{
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password' : _passwordController.text.toString()
                    };
                    authViewModel.signUpApi(data, context);
                  }
                }),
            SizedBox(height: height * 0.025),
            InkWell(onTap: (){
              Navigator.pushNamed(context, RoutesName.login);
            },child: const Text("Already have an account? Login"))
          ],
        ),
      ),
    );
  }
}
