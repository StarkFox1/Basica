class LoginWithEmailAndPasswordFailure {
  final String message;

  const LoginWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred"]);

  factory LoginWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return LoginWithEmailAndPasswordFailure('Invalid email');
      case 'wrong-password':
        return LoginWithEmailAndPasswordFailure('Incorrect password');
      case 'user-not-found':
        return LoginWithEmailAndPasswordFailure('User not found');
      case 'user-disabled':
        return LoginWithEmailAndPasswordFailure('This user has been disabled');
      case 'too-many-requests':
        return LoginWithEmailAndPasswordFailure(
            'Too many login attempts. Please try again later');
      default:
        return LoginWithEmailAndPasswordFailure();
    }
  }
}
