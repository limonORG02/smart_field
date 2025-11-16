import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/ui/screens/dashboard_screen.dart';


import 'firebase_options.dart'; // сгенерируй через FlutterFire CLI


void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const SmartFieldApp());
}


class SmartFieldApp extends StatelessWidget {
const SmartFieldApp({super.key});


@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'SmartField',
theme: ThemeData(
primarySwatch: Colors.green,
),
home: const DashboardScreen(),
);
}
}
