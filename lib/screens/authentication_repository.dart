import 'package:basica/login/signup_screen.dart';
import 'package:basica/login/widgets/signup_form_widget.dart';
import 'package:basica/screens/controller/login_email_password_failure.dart';

import 'package:basica/screens/controller/signup_email_password_failure.dart';
<<<<<<< HEAD
import 'package:basica/screens/database.dart';
=======

import 'package:basica/screens/database.dart';

>>>>>>> 8b6ffef0b6698a31325dbb57b5f25169d337546f
import 'package:basica/screens/home.dart';

import 'package:basica/screens/welcome_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';




class AuthenticationRepository extends GetxController {

  static AuthenticationRepository get instance => Get.find();
<<<<<<< HEAD
=======




  //Variables

>>>>>>> 8b6ffef0b6698a31325dbb57b5f25169d337546f
  final _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;

<<<<<<< HEAD
  // Will be called when the app launches to set the firebaseUser state
=======



  //Will be load when app launches this func will be called and set the firebaseUser state

>>>>>>> 8b6ffef0b6698a31325dbb57b5f25169d337546f
  @override

  void onReady() {

    firebaseUser = Rx<User?>(_auth.currentUser);

    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setInitialScreen);

  }

<<<<<<< HEAD
  String get uid => firebaseUser.value?.uid ?? '';

  /// If we are setting the initial screen from here
  /// then in main.dart => App(), add CircularProgressIndicator()
=======



  String get uid => firebaseUser.value?.uid ?? '';




  /// If we are setting initial screen from here

  /// then in the main.dart => App() add CircularProgressIndicator()

>>>>>>> 8b6ffef0b6698a31325dbb57b5f25169d337546f
  _setInitialScreen(User? user) {

    user == null

        ? Get.offAll(() => const WelcomeScreen())
<<<<<<< HEAD
        : Get.offAll(() => const SignUpScreen());
  }

  // FUNC
=======

        : Get.offAll(() => const ScreenHome());

  }




  //FUNC

>>>>>>> 8b6ffef0b6698a31325dbb57b5f25169d337546f
  Future<String?> createUserWithEmailAndPassword(

      String email, String password) async {

    try {

      await _auth.createUserWithEmailAndPassword(

          email: email, password: password);

<<<<<<< HEAD
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
=======



      // Get the instance of AuthenticationRepository

      final authRepo = AuthenticationRepository.instance;




      firebaseUser.value != null

          ? Get.offAll(() => const ScreenHome())

          : Get.to(() => const WelcomeScreen());




      await DatabaseService(uid: authRepo.uid)

          .updateUserData('Annlin', 'Apple', 2, 'kg');

>>>>>>> 8b6ffef0b6698a31325dbb57b5f25169d337546f
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