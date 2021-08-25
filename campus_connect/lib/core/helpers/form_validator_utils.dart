import 'dart:io';

String? validateEmail(String? email) {
  if (email!.trim() == '') {
    return 'Email is required';
  }
  email = email.trim();
  if (RegExp('[^a-zA-Z0-9.@\-]').hasMatch(email)) {
    return 'Only letters(A-Z), numbers(0-9), & periods(.) are allowed.';
  }
  var pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(email)) {
    if (email.indexOf('@') > -1) {
      String username = email.substring(0, email.indexOf('@'));
      if (username.endsWith('.')) {
        return 'Email username cannot end with a period';
      }
    }
    return 'Enter a valid email address';
  }

  return null;
}

String? validatePhone(String? phone) {
  if (phone == null || phone.trim() == '') {
    return 'phone number is required...';
  }
  if (phone.length != 11) {
    return 'phone number must be 11 digits';
  }
  phone = phone.trim();

  if (RegExp('^[+]').hasMatch(phone)) {
    return 'Enter phone number without country code.';
  }
  if (RegExp('[^0-9]').hasMatch(phone)) {
    return 'Only numbers are allowed.';
  }
  var pattern = r'^([0-9]{6,})$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(phone)) {
    return 'Enter a valid phone without country code. e.g 712 123...';
  }

  return null;
}

String? validatePassword(String? password) {
  if (password == null || password == '') {
    return 'Password is required';
  } else if (password.length < 5) {
    return 'Use 5 characters or more for password';
  } else if (['password', 'Password', '12345', '123456', '1234567']
      .contains(password)) {
    return 'Use a more secure (strong) password';
  }

  return null;
}

String? validatePasswordConfirmation(String password, String confirmation) {
  if (validatePassword(password) == null && password != confirmation) {
    return 'Passwords do not match';
  }

  return null;
}

String? validateMatric(String? username) {
  if (username!.trim() == '') {
    return 'Matric is required';
  }
  username = username.trim();
  if (RegExp(r'^(_)+$').hasMatch(username)) {
    return 'Matric number cannot be all underscores';
  }

  return null;
}

String? validateRequired(String value, String name, {int? minLength}) {
  if (value.trim() == '') {
    return '$name is required';
  }

  if (minLength != null && value.length < minLength) {
    return '$name requires at least $minLength characters';
  }

  return null;
}

String? confirmPassword(String password, String value, String name) {
  if (validateRequired(value, name) != null) {
    return validateRequired(value, name);
  }
  if (password != value) {
    return '$name does not match';
  }

  return null;
}

// Formats money value
String formatMoney(dynamic value, {int precision = 2}) {
  assert(precision >= 0 && precision <= 20);

  double d;
  try {
    if (value is num) {
      d = value.toDouble();
    } else {
      d = double.parse(value);
    }
  } catch (_, __) {
    return value;
  }
  var money = (d).toStringAsFixed(precision);

  money = money.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
  return money;
}

String? validateFullName(String? name) {
  if (name!.trim() == '' || name.length < 3) {
    return 'FullName is required';
  }

  return null;
}
