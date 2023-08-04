class AppValidator {
  ///Email Regular Expression
  static final RegExp _mail = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  static final RegExp _phone = RegExp(r'(0)(5|6|7)[0-9]{8}');

  static final RegExp _url = RegExp(
      r'[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');

  ///Validate empty Input
  static String? validateEmpty(String? value) {
    if (value == null) {
      return "* Obligatoire";
    }
    if (value.isEmpty) {
      return "* Obligatoire";
    }
    return null;
  }

  ///Validate Url Input
  static String? validateUrl(String? value) {
    if (value == null) {
      return "* Obligatoire";
    }
    if (value.isEmpty) {
      return "* Obligatoire";
    }
    if (!_url.hasMatch(value)) {
      return "Url n'est pas valide";
    }
    return null;
  }

  ///Validate Email Input
  static String? validateEmail(String? value) {
    if (value == null) {
      return "* Obligatoire";
    }
    if (!_mail.hasMatch(value)) {
      return "Email n'est pas valide";
    }
    return null;
  }

  /// Validate Phone input
  static String? validatePhone(String? value) {
    if (value == null) {
      return "* Obligatoire";
    }
    if (!_phone.hasMatch(value)) {
      return "Numéro de Téléphone n'est pas valide";
    }
    return null;
  }

  ///Validate Required Input
  static String? validateText(String? value) {
    if (value == null) {
      return "* Obligatoire";
    }
    return null;
  }

  ///Validate Password, must have 6 to 32 char
  static String? validatePassword(String? password) {
    if (password == null) {
      return "* Obligatoire";
    }
    if (password.isEmpty) {
      return "* Obligatoire";
    }
    if (password.length < 6) {
      return "Clé trop court";
    }
    return null;
  }
}
