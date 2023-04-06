import 'package:all_mu/screen/collage_selecting_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

import 'auth/google_login_auth.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class AuthSplashScreen extends StatefulWidget {
  const AuthSplashScreen({super.key});

  @override
  State<AuthSplashScreen> createState() => _AuthSplashScreenState();
}

class _AuthSplashScreenState extends State<AuthSplashScreen> {
  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {});
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(174, 135, 137, 199),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.17,
            ),
            Image.network(
              "https://www.mwu.edu.np/wp-content/themes/muniversity/images/mu%20logo.png",
              height: 130,
              width: 130,
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Lottie.network(
                "https://assets10.lottiefiles.com/packages/lf20_1a8dx7zj.json",
                width: 200,
              ),
            ),
            const Text(
              'Mid-West\nUniversity',
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseServices().signInWithGoogle();
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CollageSelectingScreen()));
                },
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.black26;
                  }
                  return Colors.white;
                })),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        "https://img.freepik.com/premium-psd/google-icon-isolated_68185-565.jpg?w=2000",
                        height: 40,
                        width: 40,
                      ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      const Text(
                        "Continue with Google",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
