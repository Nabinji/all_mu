import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
GoogleSignIn googleSignIn = GoogleSignIn();

class FirebaseServices {
  final auth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  googleSignOut() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }
}


//  InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Semester(movie)));
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                             top: 8.0, bottom: 0, left: 6, right: 6),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30.0),
//                           ),
//                           elevation: 3,
//                           child: Column(children: [
//                             SizedBox(
//                               height: 130,
//                               width: 120,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(top: 18.0),
//                                 child: Image.network(
//                                   movie.imageUrl,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Text(
//                               movie.syll,
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 19),
//                             )
//                           ]),
//                         ),
//                       ),
//                     ),
