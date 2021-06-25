import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/firebase/firebase_service.dart';

class SignOut extends StatefulWidget {
  const SignOut({Key? key}) : super(key: key);

  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                FirebaseService service = FirebaseService();
                await service.signOutFromGoogle();
                Navigator.pushReplacementNamed(
                    context, '/sign-in');
              },
            )
          ],
          backwardsCompatibility: false,
          systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.blue),
          title: const Text("Profile"),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(user!.email!),
                Text(user!.displayName!),
                CircleAvatar(
                  backgroundImage: NetworkImage(user!.photoURL!),
                  radius: 20,
                )
              ],
            )));
  }
}

