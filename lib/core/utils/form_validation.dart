import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This extension is for form validations using the FormKey approach
/// Import this file in any form view and call the methods from the
/// Buildcontext's context variable
///
/// This extension still needs improvement
extension ValidationExtension on BuildContext {
  String? validateEmail(String? email) {
    if (email!.isEmpty) return 'Email address is required';

    final bool isEmailValid = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.'
            r',;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3'
            r'}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+['
            r'a-zA-Z]{2,}))$')
        .hasMatch(email.trim());

    return isEmailValid ? null : 'Please enter a valid email';
  }

  String? validatePassword(String? password) {
    if (password!.isEmpty) return 'Password is required';

    final bool isPasswordValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[#?!@$%^&*-]).{8,}$')
            .hasMatch(password);

    return isPasswordValid
        ? null
        : 'Must be alphanumeric with Uppercase and \n '
            'contain one or more symbol';
  }

  String? validateConfirmPasswordField(String? input, String? password) {
    if (input != password) {
      return 'Passwords do not match';
    } else {
      return null;
    }
  }

  String? validateNotEmptyField(String? input, [String? label]) {
    if (input!.isEmpty) {
      return label == null ? 'This field cannot be empty' : 'Enter a $label';
    } else {
      return null;
    }
  }

  String? validateContractAddress(String? input, [String? label]) {
    if (input!.isEmpty || input.length < 26) {
      return label == null ? 'Invalid contract Address' : 'Enter a $label';
    } else {
      return null;
    }
  }

  String? validateGreaterThanValue(String? amount, String? balance) {
    if (amount == null) {
      return 'Please enter a valid amount';
    }

    if (balance == null) {
      return 'Please enter a valid amount';
    }

    final amountToDouble = double.tryParse(amount);

    if (amountToDouble == null) {
      return 'Please enter a valid amount';
    }

    final balanceToDouble = double.tryParse(balance);

    if (balanceToDouble == null) {
      return 'Please enter a valid amount';
    }

    if (amountToDouble <= 0) {
      return 'Please enter a valid amount';
    }

    if (amountToDouble > balanceToDouble) {
      return 'Current balance ${balanceToDouble.toStringAsFixed(2)}';
    } else {
      return null;
    }
  }

  String? validateOTP(String? otpCode) {
    if (otpCode!.isEmpty) return 'OTP code is required';

    final bool isOTPValid = otpCode.length == 4;

    return isOTPValid ? null : 'Please enter a valid OTP code';
  }

  bool containsUppercaseAndLowercase(String? input) {
    if (input == null) {
      return false;
    }
    return RegExp('(?=.*?[A-Z])(?=.*?[a-z])').hasMatch(input);
  }

  bool containsAtLeast8(String? input) {
    if (input == null) {
      return false;
    }
    return RegExp('.{8,}').hasMatch(input);
  }

  bool containsNumberAndSymbol(String? input) {
    if (input == null) {
      return false;
    }
    return RegExp(r'(?=.*?\d)(?=.*?[#?!@$%^&*-])').hasMatch(input);
  }

  String? validateAccountNumber(String? input, [String? label]) {
    if (input!.isEmpty) {
      return label == null ? 'This field cannot be empty' : 'Enter a $label';
    } else {
      return null;
    }
  }
}
