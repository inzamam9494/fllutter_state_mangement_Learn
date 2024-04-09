import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/mvvm/resouces/components/round_button.dart';
import 'package:state_management/mvvm/utils/routes/routes_name.dart';
import 'package:state_management/mvvm/view_model/auth_view_model.dart';
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.blue.shade400,
        automaticallyImplyLeading: false,

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
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: InkWell(
                          onTap: (){
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                            child: Icon(
                                _obsecurePassword.value ?
                                Icons.visibility_off_outlined: Icons.visibility_outlined))
                    ),
                  );
                }),
            SizedBox(height: height * 0.050,),
            RoundButton(title: 'Login',
              loading: authViewModel.loading,
              onPress: () {
              if(_emailController.text.isEmpty){
                Utils.flushBarErrorMessage('Please enter email', context);
              }else if(_passwordController.text.isEmpty){
                Utils.flushBarErrorMessage('Please enter password', context);
              }else if(_passwordController.text.length < 6){
                Utils.flushBarErrorMessage('Please enter 6 digits', context);
              }else{
                Map data = {
                  'email': _emailController.text.toString(),
                  'password' : _passwordController.text.toString()
                };
                authViewModel.loginApi(data, context);
              }
              },),
            SizedBox(height: height * 0.025),
            InkWell(onTap: (){
              Navigator.pushNamed(context, RoutesName.signUp);
            },child: Text("Don't have an account? Sign Up"))
          ],
        ),
      )
    );
  }
}
