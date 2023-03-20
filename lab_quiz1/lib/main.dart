import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lab_quiz1/Screens/RegisterScreen.dart';

void main() async{
await Hive.initFlutter();
var myBox = await Hive.openBox('myBox');
  runApp(const LabQuiz1());
}
class LabQuiz1 extends StatelessWidget {
  const LabQuiz1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterScreen(),
      builder: EasyLoading.init(),
    );
  }
}
