extension InputValidate on String {
  bool isValidEmail() {
    return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(this);
  }

  // 닉네임 검증(2 ~ 10자의 한글, 영문)
  bool isValidNick() {
    return RegExp(r"^(?=.*[A-z가-힣])[A-z가-힣]{2,10}$").hasMatch(this);
  }

  bool isValidBirth() {
    return RegExp(r"^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12][0-9]|3[01]))$").hasMatch(this);
  }
}
