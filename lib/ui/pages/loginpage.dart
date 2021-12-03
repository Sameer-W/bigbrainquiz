import 'package:bigbrainquiz/models/question.dart';
import 'package:bigbrainquiz/resources/firebase_service.dart';
import 'package:bigbrainquiz/resources/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TextStyle(
        color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w500);
    final TextStyle trailingStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Or Signup'),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).accentColor
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 60,
            child: ElevatedButton.icon(
              label: Text('Sign up with google'),
              icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: Size(double.infinity, 50)),
              onPressed: () {
                final db = Database();
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
            ),
          ),
        ),
      ),
    );
  }
}
