mixin InputValidator {
  String validateEmail(String email) {
    RegExp regex = RegExp(r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}");
    if (regex.hasMatch(email)) {
      return null;
    }
    return "Please check your email";
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      return "Password cannot be empty";
    }

    if (password.length < 6) {
      return "password must not be less than 6";
    }
    return null;
  }

  String emptyFieldValidator(String input) {
    return input.isNotEmpty ? null : "This cannot be empty";
  }

  String validateName(String value) {
    if (value.split(" ").length == 1) return "Please enter your full name";
    return value.isNotEmpty ? null : "Please enter a name";
  }
}
