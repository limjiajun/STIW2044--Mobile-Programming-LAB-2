import 'package:flutter/material.dart';
import 'package:mytutor/views/loginscreen.dart';

import '../models/user.dart';



class MainScreen extends StatefulWidget {
  final User user;
  const MainScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.user.name.toString()),
              accountEmail: Text(widget.user.email.toString()),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://pic.onlinewebfonts.com/svg/img_362771.png"),
              ),
            ),
            _createDrawerItem(
              icon: Icons.tv,
              text: 'Home',
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (content) => MainScreen(
                              user: widget.user,
                            )));
              },
            ),
            _createDrawerItem(
              icon: Icons.list_alt,
              text: 'My users',
              onTap: () {},

            ),
            
            _createDrawerItem(
              icon: Icons.exit_to_app,
              text: 'Logout',
              onTap: () =>{ 
                Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginScreen ()))
                
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to our tutor app'),
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
