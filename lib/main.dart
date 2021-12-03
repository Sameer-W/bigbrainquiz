import 'package:bigbrainquiz/resources/google_sign_in.dart';
import 'package:bigbrainquiz/ui/pages/home.dart';
import 'package:bigbrainquiz/ui/pages/homepage.dart';
import 'package:bigbrainquiz/ui/pages/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Open Trivia',
        theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Colors.indigo,
            fontFamily: "Montserrat",
            buttonColor: Colors.pink,
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                textTheme: ButtonTextTheme.primary)),
        home: HomePageMain(),
      ),
    );
  }
}
