class LoginWithEmailAndPasswordFailure {
  final String message;

  const LoginWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred"]);

  factory LoginWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return const LoginWithEmailAndPasswordFailure('Invalid email');
      case 'wrong-password':
        return const LoginWithEmailAndPasswordFailure('Incorrect password');
      case 'user-not-found':
        return const LoginWithEmailAndPasswordFailure('User not found');
      case 'user-disabled':
        return const LoginWithEmailAndPasswordFailure(
            'This user has been disabled');
      case 'too-many-requests':
        return const LoginWithEmailAndPasswordFailure(
            'Too many login attempts. Please try again later');
      default:
        return const LoginWithEmailAndPasswordFailure();
    }
  }
}
