class Validator {
  bool name(String name) {
    final String value = _cleanedValue(name);

    if (value.isEmpty || value.length < 3) return false;
    return true;
  }

  bool phone(String phone) {
    if (phone.isEmpty) return false;

    final regex = RegExp(r'^\+[0-9]{10,}$');

    return regex.hasMatch(phone);
  }

  bool email(String email) {
    if (email.isEmpty) return false;

    final regex = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

    return regex.hasMatch(email);

    // final trimmedEmail = email.replaceAll(' ', '');

    // if (trimmedEmail.isEmpty ||
    //     !trimmedEmail.contains('@') ||
    //     trimmedEmail.length < 5) {
    //   return false;
    // }
    // return true;
  }

  bool number(String number) {
    if (number.isEmpty) return false;

    final regex = RegExp(r'^[0-9]+$');

    return regex.hasMatch(number);
  }

  bool length(String value, {int min = 8, int? max}) {
    value = _cleanedValue(value);

    if (value.isEmpty) return false;

    if (max != null) {
      return (min <= value.length && value.length <= max);
    }
    return (min <= value.length);
  }

  bool match(dynamic value1, dynamic value2) {
    if (value1.isEmpty || value2.isEmpty) return false;

    return (value1 == value2);
  }

  String _cleanedValue(String value) {
    return value.replaceAll(' ', '');
  }
}
