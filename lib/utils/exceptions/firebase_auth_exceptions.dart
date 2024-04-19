class BakoFirebaseAuthException implements Exception {
  final String code;

  BakoFirebaseAuthException(this.code);

  String get message{
    switch (code) {
      case "Email-already-in-use" :
        return "The email address is already registered. Please use a different email.";
      case "invalid-email" :
        return "The email address provided is invalid. Please use a different email.";
      case "weak-password" :
        return "The passwrod provided is too weak. Please choose a stronger password.";
      case "user-disabled" :
        return "The user account has been disabled. Please contact support for assistance.";
      case "user-not-found" :
        return "User not found. Invalid login details.";
      case "wrong-password" :
        return "Incorrect password. Please chech ypur password and try again.";
      case "invalid-verification-code" :
        return "Invalid verification code. Please enter a valid code.";
      case "invalid-verification-id" :
        return "Invalid verification ID. Please request a new verification code.";
      case "quota-exceeded" :
        return "Quota exceeded. Please try again later.";
      case "email-already-exists" :
        return "The email address already exists. Please use a different email.";
      case "provider-already-linked" :
        return "The account is already linked with another provider.";
      case "requires-recent-login" :
        return "This operation is sensitive and requires recent authentication. Please log in again.";
      case "credential-already-in-use" :
        return "This credential already associated with a different user account.";
      case "user-mismatch" :
        return "This supplied credentials do not correspond to the previously signed in user.";
      default:
        return "nothing";
    }
  }
}