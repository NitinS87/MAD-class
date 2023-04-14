// ignore_for_file: unnecessary_null_comparison

class Passwords {
  late String password;
  late String confirmPassword;
  late int length;

  Passwords() {
    password = "";
    confirmPassword = "";
    length = 8;
  }

  bool nonEmpty() {
    return password != null &&
        password.length > 0 &&
        confirmPassword != null &&
        confirmPassword.length > 0;
  }

  bool match() {
    return password == confirmPassword;
  }

  bool valid() {
    var regex = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    return !regex.hasMatch(password) && password.length >= length;
  }
}
