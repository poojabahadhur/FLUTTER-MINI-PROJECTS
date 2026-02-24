import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  // Google sign in
  Future<UserCredential> signInWithGoogle() async {
    // Begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    if (gUser == null) {
      throw Exception("Sign in aborted by user");
    }

    // Obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    // Create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // Final sign-in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // ✅ Google sign out (forces account chooser next time)
  Future<void> signOutFromGoogle() async {
    final googleSignIn = GoogleSignIn();
    try {
      await googleSignIn.disconnect(); // clears the cached account
    } catch (_) {
      // ignore if already disconnected
    }
    await googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
