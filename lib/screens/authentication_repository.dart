import 'package:basica/screens/controller/login_email_password_failure.dart';

import 'package:basica/screens/controller/signup_email_password_failure.dart';

import 'package:basica/screens/database.dart';

import 'package:basica/screens/home.dart';

import 'package:basica/screens/welcome_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables

  final _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;

  //Will be load when app launches this func will be called and set the firebaseUser state

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);

    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  String get uid => firebaseUser.value?.uid ?? '';

  /// If we are setting initial screen from here

  /// then in the main.dart => App() add CircularProgressIndicator()

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const ScreenHome());
  }

  //FUNC

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // Get the instance of AuthenticationRepository
      final authRepo = AuthenticationRepository.instance;

      if (firebaseUser.value != null) {
        Get.offAll(() => const ScreenHome());
      } else {
        Get.to(() => const WelcomeScreen());
      }

      // Update user data in Firestore
      await DatabaseService(uid: authRepo.uid).updateUserData('Annlin', email);
      await DatabaseService(uid: authRepo.uid)
          .addGroceryItem('Apple', 2, 'kg', false);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);

      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();

      return ex.message;
    }

    return null;
  }

  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LoginWithEmailAndPasswordFailure.code(e.code);

      return ex.message;
    } catch (_) {
      const ex = LoginWithEmailAndPasswordFailure();

      return ex.message;
    }

    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
