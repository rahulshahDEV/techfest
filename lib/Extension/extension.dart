extension Validator on String {
  bool validateEmail() {
    return RegExp(r'[a-zA-Z0-9\.\-\_]+[@][-\a-z]+[\.][a-z]{2,3}')
        .hasMatch(this);
  }

  bool validatePhone() {
    return RegExp(r'[+][0-9]{3}[-\][0-9]{10}').hasMatch(this);
  }

  String validateApiUri() {
    // if (this.contains('localhost')) {
    //   return this.replaceAll('localhost', '192.168.1.20');
    // } else {
    //   return this.replaceAll('10.0.2.2', '192.168.1.20');
    //   // return this;
    // }

    return this.replaceAll('localhost', '10.0.2.2');

    // '10.0.2.2'
  }
}
