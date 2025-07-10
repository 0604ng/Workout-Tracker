import 'package:firebase_auth/firebase_auth.dart';

class FirebaseErrorHandler {
  static String mapErrorCode(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'email-already-in-use':
        return 'Email is already in use.';
      case 'weak-password':
        return 'Password is too weak.';
      case 'invalid-email':
        return 'Invalid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many requests. Try again later.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      case 'invalid-credential':
        return 'Invalid credentials provided.';
      case 'network-request-failed':
        return 'Network error. Check your internet connection.';
      case 'requires-recent-login':
        return 'Please reauthenticate and try again.';
      default:
        return 'An unknown error occurred.';
    }
  }

  static String handleAuthError(FirebaseAuthException error) {
    return mapErrorCode(error.code);
  }

  static Exception toException(FirebaseAuthException error) {
    return Exception(handleAuthError(error));
  }
}
