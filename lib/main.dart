import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:gritstone_machine_test/features/home_screen/view/home_screen.dart';

void main() async{  WidgetsFlutterBinding.ensureInitialized();

  await Alarm.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GritStone Machine Test',
      theme: ThemeData(
       scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const HomeScreen(
        
        
      ),
    );
  }
}
