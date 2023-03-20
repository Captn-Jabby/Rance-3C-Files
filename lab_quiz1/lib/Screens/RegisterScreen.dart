import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab_quiz1/Screens/LoginScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  // var obscurePass =
  final myBox = Hive.box('myBox');
  void registerUser(){
    setState(() {
      if (Hive.box('myBox').containsKey(userController.text) ||Hive.box('myBox').containsKey(passController.text)) {
        EasyLoading.showError('Credentials Already Taken');
      } else {
        myBox.add(userController.text);
        myBox.add(passController.text);

      }
      userController.clear();
      passController.clear();
      EasyLoading.showSuccess('Account Added');

    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                 const Text('Registration :', style: TextStyle(fontSize: 23),),
                  const Divider(height: 12,),
                  TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                      hintText: 'Username :',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
               const SizedBox(height: 12,),

                  TextFormField(
                    obscureText: true,
                    controller: passController,
                    decoration: InputDecoration(
                      hintText: 'Password :',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: registerUser,
                      child: const Text('Register')),

                  TextButton(onPressed: (){
                    Navigator.push(
                        context, CupertinoPageRoute(
                        builder:(context)=> const LoginScreen()));
                  },
                      child: const Text('Login')),



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
