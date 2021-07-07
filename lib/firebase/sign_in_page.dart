import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'firebase_service.dart';

// ignore: use_key_in_widget_constructors
class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    OutlineInputBorder border = const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFEFEFEF), width: 3.0));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/images/appLogo.png"),
          RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
              ])),
          SizedBox(height: size.height * 0.01),
          const Text(
            'Sign In takes \n only 1 minute',
            style: TextStyle(color: Colors.grey),
          ),
          const GoogleSignIn(),
          buildRowDivider(size: size),
          Padding(padding: EdgeInsets.only(bottom: size.height * 0.02)),
          SizedBox(
            width: size.width * 0.8,
            child: TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 10.0),
                    enabledBorder: border,
                    focusedBorder: border)),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            width: size.width * 0.8,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                enabledBorder: border,
                focusedBorder: border,
                suffixIcon: const Padding(
                  child: FaIcon(
                    FontAwesomeIcons.eye,
                    size: 15,
                  ),
                  padding: EdgeInsets.only(top: 15, left: 15),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),
          SizedBox(
            width: size.width * 0.8,
            child: OutlinedButton(
              onPressed: () async {},
              child: const Text('textSignIn'),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                  side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
            ),
          ),
          RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Create An Account?',
                    style: TextStyle(
                      color: Colors.grey,
                    )),
                TextSpan(
                    text: ' Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    )),
              ])),
          // IconButton(
          //   icon: const Icon(
          //     Icons.logout,
          //     color: Colors.white,
          //   ),
          //   onPressed: () async {
          //     FirebaseService service = FirebaseService();
          //     await service.signOutFromGoogle();
          //   },
          // )
        ]),
      ),
    );
  }

  Widget buildRowDivider({required Size size}) {
    return SizedBox(
      width: size.width * 0.8,
      // ignore: prefer_const_literals_to_create_immutables
      child: Row(children: [
        // ignore: prefer_const_literals_to_create_immutables
        const Expanded(child: Divider(color: Colors.grey)),
        const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              "Or",
              style: TextStyle(color: Colors.grey),
            )),
        const Expanded(child: Divider(color: Colors.grey)),
      ]),
    );
  }
}

class GoogleSignIn extends StatefulWidget {
  const GoogleSignIn({Key? key}) : super(key: key);

  @override
  _GoogleSignInState createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return !isLoading
        ? SizedBox(
      width: size.width * 0.8,
      child: OutlinedButton.icon(
        icon: const FaIcon(FontAwesomeIcons.google,color: Colors.deepOrangeAccent,),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          FirebaseService service = FirebaseService();
          try {

            await service.signInWithGoogle();
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);


          } catch (e) {
            if (e is FirebaseAuthException) {
              showMessage(e.message!);
            }
          }
          setState(() {
            isLoading = false;
          });
        },
        label: const Text(
          'SignIn With Google',
          style:
          TextStyle(color:  Colors.deepOrangeAccent, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Colors.white),
            side: MaterialStateProperty.all<BorderSide>(BorderSide.none)),
      ),
    )
        : const CircularProgressIndicator();
  }

  void showMessage(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}