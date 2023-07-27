import 'package:basica/screens/controller/login_email_password_failure.dart';
import 'package:basica/screens/controller/signup_email_password_failure.dart';
import 'package:basica/screens/database.dart';
import 'package:basica/screens/home.dart';
import 'package:basica/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  // Will be called when the app launches to set the firebaseUser state
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
  }

  String get uid => firebaseUser.value?.uid ?? '';

  // FUNC
  Future<String?> createUserWithEmailAndPassword(
      String email, String password, String name, String phoneNo) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
        // name: name,
        // phoneNo: phoneNo,
      );

      // Get the instance of AuthenticationRepository
      final authRepo = AuthenticationRepository.instance;

      if (firebaseUser.value != null) {
        Get.offAll(() => ScreenHome());
      } else {
        Get.to(() => WelcomeScreen());
      }

      // Update user data in Firestore
      await DatabaseService(uid: authRepo.uid)
          .updateUserData(name, email, phoneNo);
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
      if (firebaseUser.value != null) {
        Get.offAll(() => ScreenHome());
      } else {
        Get.to(() => WelcomeScreen());
      }
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
