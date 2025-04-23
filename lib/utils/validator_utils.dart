import 'package:doctor_app/resources/strings_manager.dart';

class ValidationForm {
  static String? validateEmail(String? value) {
    if (value == null || value!.isEmpty) {
      return "Please enter an Email";
    } else if (!RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    ).hasMatch(value)) {
      return "Please enter a valid Email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    } else
      return null;
  }

  static String? validateField(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    } else
      return null;
  }
}
