import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab_quiz1/Screens/RegisterScreen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final myBox = Hive.box('myBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text('Welcome :',
               style: TextStyle( fontSize: 34),
            ),
            ),
            Center(child: Text('${myBox.get(0)}!',
                style: const TextStyle( fontSize: 34, color: Colors.red)
            ),
            ),
            const SizedBox(height: 24,),
            TextButton(onPressed: (){
            myBox.clear();
            Navigator.push(context, CupertinoPageRoute(builder: (context)=> const RegisterScreen()));
            },
                child: const Text('Logout', style: TextStyle(fontSize: 23),))
          ],
        ),
     ),
    );
  }
}
