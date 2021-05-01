import 'package:covicare/helpers/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<UserCredential> signInWithGoogle() async {
  Firebase.initializeApp();
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final UserCredential authCred = await _auth.signInWithCredential(credential);

  final User user = authCred.user;
  print("user");
  print(user);
  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    await DatabaseService(uid: user.uid)
        .updateUserData(user.uid, user.displayName, user.email);
    // Once signed in, return the UserCredential
    return authCred;
  }

  return null;
}

Future<void> signOutGoogle() async {
  await _googleSignIn.signOut();
  await _auth.signOut();
  print("User Signed Out");
}
