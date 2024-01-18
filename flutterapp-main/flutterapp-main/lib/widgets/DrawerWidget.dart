import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User? _user;

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
  }

  Future<void> _fetchCurrentUser() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      setState(() {
        _user = currentUser;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: _user != null
                ? UserAccountsDrawerHeader(
                    accountName: Text(
                      _user!.displayName ?? "User",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    accountEmail: Text(
                      _user!.email ?? "example@example.com",
                      style: TextStyle(fontSize: 16),
                    ),
                    
                  )
                : Container(), // Vous pouvez gérer les scénarios où l'utilisateur n'est pas connecté
          ),

          // Autres ListTiles...

         ListTile(
  leading: Icon(Icons.exit_to_app, color: Colors.red),
  title: Text(
    "Log Out",
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  ),
  onTap: () async {
    await _auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  },
),
        ],
      ),
    );
  }
}
