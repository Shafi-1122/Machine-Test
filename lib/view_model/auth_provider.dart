import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isUserSignIn = true;

// Saving user data to shared preference
  Future saveUIDDataToSharedPreferencesandNavigate(
      uid, Registered, email, name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (uid.isNotEmpty) {
      await prefs.setString('uid', uid);
      await prefs.setString('mail', email);
      await prefs.setString('user_name', name);
      if (kDebugMode) {
        print("uid $uid");
        print("mail $email");
        print("username $name");
      }
    }
  }

// Removing user data from shared preference
  Future removeDataFromSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // if (userUID.isNotEmpty) {
    await prefs.remove('uid');
    await prefs.remove('mail');
    await prefs.remove('user_name');
    await prefs.clear();
    print("Removed from shared ");
    // }
  }

  Future<Map<String, String?>?> signInWithGoogle() async {
    try {
      isLoading = true;
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final User? user = userCredential.user;

      saveUIDDataToSharedPreferencesandNavigate(
          user?.uid, false, user?.email, user?.displayName);

      final String? email = user?.email;
      final String? displayName = user?.displayName;

      isUserSignIn = true;
      isLoading = false;

      notifyListeners();

      return {
        'email': email,
        'displayName': displayName,
      };
    } on Exception catch (e) {
      isUserSignIn = false;
      print('exception->$e');
      isLoading = false;
      notifyListeners();
      return null;
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();

      await GoogleSignIn().signOut().then(
        (value) {
          print("Insied then methode");
          removeDataFromSharedPreferences();

          isUserSignIn = false;
        },
      );

      notifyListeners();

      return true;
    } on Exception catch (e) {
      print('exception->$e');
      isUserSignIn = false;
      notifyListeners();
      return false;
    }
  }
}
