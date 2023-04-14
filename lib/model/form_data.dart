class User {
  String? regNo;
  String? name;
  String? email;
  String? address;
  String? password;
  String? confirmPassword;
  String? dropdown;
  String? semYear;

  String? get getRegNo => regNo;

  set setRegNo(String? regNo) => this.regNo = regNo;

  get getName => name;

  set setName(name) => this.name = name;

  get getEmail => email;

  set setEmail(email) => this.email = email;

  get getAddress => address;

  set setAddress(address) => this.address = address;

  get getPassword => password;

  set setPassword(password) => this.password = password;

  get getConfirmPassword => confirmPassword;

  set setConfirmPassword(confirmPassword) =>
      this.confirmPassword = confirmPassword;

  get getDropdown => dropdown;

  set setDropdown(dropdown) => this.dropdown = dropdown;

  get getSemYear => semYear;

  set setSemYear(semYear) => this.semYear = semYear;

  User(
      {this.regNo,
      this.name,
      this.email,
      this.address,
      this.password,
      this.confirmPassword,
      this.dropdown,
      this.semYear});
}
