class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unkown error occurred"]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'Please enter a strong password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Email is not valid');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            'An account already exist for that email');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Operation is not allowed');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'This user has been disabled');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
