import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
      body: Container(
        // height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/mountainMan.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: sized_box_for_whitespace
                Container(
                    height: size.height * 0.35,
                    child: Image.asset("assets/images/appLogo.png")),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Color(0x85111111),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                const Text(
                  'Sign In takes only 1 minute',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
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
                        focusedBorder: border,
                        labelText: ' Username',
                        labelStyle: const TextStyle(color: Colors.white),
                        suffixIcon: const Padding(
                          child: FaIcon(
                            FontAwesomeIcons.user,
                            color: Colors.white,
                            size: 15,
                          ),
                          padding: EdgeInsets.only(top: 15, left: 15),
                        )),
                  ),
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
                      fillColor: Colors.white,
                      labelText: ' Password',
                      labelStyle: const TextStyle(color: Colors.white),
                      suffixIcon: const Padding(
                        child: FaIcon(
                          FontAwesomeIcons.eye,
                          color: Colors.white,
                          size: 15,
                        ),
                        padding: EdgeInsets.only(top: 15, left: 15),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),

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
      ),
    );
  }

  Widget buildRowDivider({required Size size}) {
    return SizedBox(
      width: size.width * 0.8,
      // ignore: prefer_const_literals_to_create_immutables
      child: Row(children: [
        // ignore: prefer_const_literals_to_create_immutables
        const Expanded(
            child: Divider(
          color: Colors.white,
          thickness: 1,
        )),
        const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Text(
              "Or",
              style: TextStyle(color: Colors.white),
            )),
        const Expanded(
            child: Divider(
          color: Colors.white,
          thickness: 1,
        )),
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
              icon: const FaIcon(
                FontAwesomeIcons.google,
                color: Colors.deepOrangeAccent,
              ),
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                FirebaseService service = FirebaseService();
                try {
                  await service.signInWithGoogle();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
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
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold),
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
