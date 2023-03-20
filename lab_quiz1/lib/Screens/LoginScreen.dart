import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab_quiz1/Screens/AccountScreen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userController = TextEditingController();
  final passController = TextEditingController();
  // var obscurePass =
  final myBox = Hive.box('myBox');

  void accountValidation(){
  final username = myBox.get(0);
  final password = myBox.get(1);
    setState(() {
      if(username == userController.text && password == passController.text){
        EasyLoading.showSuccess('Account Verified');
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>const AccountScreen()));
      }else{
        EasyLoading.showError('Account does not exist!');

      }
    });


// myBox.put('email1', userController.text);
// myBox.put('pass1', passController.text);
  }
  void getData()async{
    if(myBox.get('email1')!=null){
       userController.text = myBox.get('email1');
    } if(myBox.get('email1')!=null){
      passController.text = myBox.get('pass1');
    }
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
                  const Text('Login :', style: TextStyle(fontSize: 23),),
                  const Divider(height: 32,),
                  TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                      hintText: 'Username:',
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
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context)=>const AccountScreen()));
                  },
                      child: const Text('Login')),

                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  },
                      child: const Text('Register')),



                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
