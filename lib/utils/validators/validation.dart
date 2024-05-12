class BakoValidator {

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty){
      return "$fieldName is required.";
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return "Invalid email address";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    //Check for minimum password length
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter.";
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number.";
    }

    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must contain at least one special character.";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required";
    }

    final phoneRegExp = RegExp(r'^\d{10,}$');

    if (!phoneRegExp.hasMatch(value)) {
      return "Invalid phone number format (10 digits or more required)";
    }

    return null;
  }

    static String? validateInteger(String? value) {
    if (value == null || value.isEmpty) {
      return "Value is required";
    }

    final intRegExp = RegExp(r'^[0-9]+$');

    if (!intRegExp.hasMatch(value)) {
      return "Invalid integer format";
    }

    return null;
  }
}