import 'package:bigbrainquiz/resources/firebase_service.dart';
import 'package:bigbrainquiz/ui/pages/home.dart';
import 'package:bigbrainquiz/ui/pages/profile_page.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(
              height: 30,
            ),
            buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                onClicked: () => selectedItem(context, 0)),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.person,
              onClicked: () {
                final db = Database();
                db.addUser();

                return selectedItem(context, 1);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    @required String text,
    @required IconData icon,
    VoidCallback onClicked,
  }) {
    final color = Colors.white;

    return ListTile(
      hoverColor: Colors.white70,
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ));
        break;
    }
  }
}
