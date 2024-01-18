import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocerapp/features/user_auth/pages1/login_page.dart';
import 'package:grocerapp/features/user_auth/pages1/sign_up_page.dart';
import 'package:grocerapp/pages/HomePage.dart';
import 'package:grocerapp/pages/ItemPage.dart';
import 'package:grocerapp/pages/SplashScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(


  apiKey: "AIzaSyDrx_Mzdf_PY_qkdEN1FXHjMLd6zF6qYMU",

  projectId: "flutter-web-connetion",

  messagingSenderId: "1031485930093",
  appId: "1:1031485930093:web:45413fb125a51f8f709d64",






      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My grocerApp',
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(
          seconds: 60,
          navigateAfterSeconds: LoginPage(),
          child: Container(), // Add a dummy child widget
        ),
        "/login": (context) => LoginPage(),
        "/singUp": (context) => SignUpPage(),
        "/homePage": (context) => HomePage(),
        "itemPage": (context) => ItemPage(),
      },
    );
  }
}