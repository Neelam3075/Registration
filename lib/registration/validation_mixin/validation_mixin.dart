import 'package:untitled5/res/strings.dart';

mixin ValidationMixin {
  String? isFirstNameValid(String? firstName) {
    if (isValueEmpty(firstName)) {
      return Strings.firstNameMustNotBeEmpty;
    } else if (!(isValueEmpty(firstName)) && firstName!.length < 4) {
      return Strings.firstNameMustContainAtLeast3Char;
    } else {
      return null;
    }
  }

  String? isLastNameValid(String? lastName) {
    if (isValueEmpty(lastName)) {
      return Strings.lastNameMustNotBeEmpty;
    } else if (!(isValueEmpty(lastName)) && lastName!.length < 4) {
      return Strings.lastNameMustContainAtLeast3Char;
    } else {
      return null;
    }
  }

  String? isPhoneNumberValid(String? phoneNumber) {
    if (isValueEmpty(phoneNumber)) {
      return Strings.phoneNumberShouldNotBeEmpty;
    } else if (!(isValueEmpty(phoneNumber)) &&
        (phoneNumber!.length < 10 || phoneNumber.length > 10)) {
      return Strings.phoneNumberMustContain10Digit;
    } else {
      return null;
    }
  }

  String? isEmailValid(String? email) {
    RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (isValueEmpty(email)) {
      return Strings.firstNameMustNotBeEmpty;
    } else if (!(isValueEmpty(email)) && !(regExp.hasMatch(email!))) {
      return Strings.pleaseEnterAValidEmail;
    } else {
      return null;
    }
  }

  String? isPasswordValid(String? password) {
    RegExp regExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,15}$');
    if (isValueEmpty(password)) {
      return Strings.passwordMustNotBeEmpty;
    } else if (!(isValueEmpty(password)) && !(regExp.hasMatch(password!))) {
      return Strings.passwordMustBeContainAtLeast;
    } else {
      return null;
    }
  }

  String? isConfirmPasswordValid(String? password, String? confirmPassword) {
    if (isValueEmpty(confirmPassword)) {
      return Strings.passwordMustNotBeEmpty;
    } else if (!(isValueEmpty(confirmPassword)) &&
        (confirmPassword!.compareTo(password!) != 0)) {
      return Strings.passwordMustBeMatch;
    } else {
      return null;
    }
  }

  //Info Screen validation

  String? isValidEducation(String? education) {
    if (isValueEmpty(education)) {
      return Strings.educationMustNotBeEmpty;
    } else {
      return null;
    }
  }

  String? isValidYearOfPassing(String? yearOfPassing) {
    if (isValueEmpty(yearOfPassing)) {
      return Strings.yearOfPassingMustNotBeEmpty;
    } else if ((yearOfPassing != null) && (yearOfPassing.length > 4) ||
        (yearOfPassing!.contains('0000'))) {
      return Strings.pleaseEnterValidYear;
    } else {
      return null;
    }
  }

  String? isValidGrade(String? grade) {
    if (isValueEmpty(grade)) {
      return Strings.gradeMustNotBeEmpty;
    } else {
      return null;
    }
  }

  String? isValidExperience(String? experience) {
    if (isValueEmpty(experience)) {
      return Strings.experienceMustNotBeEmpty;
    } else if ((experience != null) && experience.length > 2) {
      return Strings.pleaseEnterValidExperience;
    } else {
      return null;
    }
  }

  String? isValidDesignation(String? designation) {
    if (isValueEmpty(designation)) {
      return Strings.designationMustNotBeEmpty;
    } else {
      return null;
    }
  }

  //Address screen validation
  String? isValidAddress(String? address) {
    if (isValueEmpty(address)) {
      return Strings.addressMustNotBeEmpty;
    } else if ((address != null) && (address.length < 4)) {
      return Strings.addressMustContainMoreThan3Char;
    } else {
      return null;
    }
  }

  String? isValidLandmark(String? landmark) {
    if (isValueEmpty(landmark)) {
      return Strings.landmarkMustNotBeEmpty;
    } else if ((landmark != null) && (landmark.length < 4)) {
      return Strings.landmarkMustContainMoreThan3Char;
    } else {
      return null;
    }
  }

  String? isValidState(String? state) {
    if (isValueEmpty(state)) {
      return Strings.stateMustNotBeEmpty;
    }else {
      return null;
    }
  }

  String? isValidPinCode(String? pinCode) {
    if ((pinCode != null) && (pinCode.length < 6) ) {
      return Strings.zipCodeMustContain6Digit;
    } else {
      return null;
    }
  }

  bool isValueEmpty(String? value) {
    if (value == null || value.trimLeft().isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
