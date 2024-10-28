import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signpage/auth/login_screen.dart';
import 'package:signpage/home_screen.dart';
import 'package:signpage/provider/provider.dart';
import './constants/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "signapp",
      options: const FirebaseOptions(
          apiKey: "AIzaSyBpQ2jRGwG-qSrf04gGEqcJbAF0OzysNf",
          appId: "1:933689726925:android:fb0317ac28794b37f01684",
          messagingSenderId: "933689726925",
          projectId: "signapp-5c3bf"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'signPage',
        theme: AppTheme.theme,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapShot) {
              if (snapShot.data != null) {
                return const LoginScreen();
              }
              return const HomeScreen();
            }),
      ),
    );
  }
}
