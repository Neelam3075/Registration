part of 'registration_cubit.dart';

class RegistrationState {
  final bool? genderGroup;
  final bool? passwordVisibility;
  final String? imagePath;
  RegistrationState({this.genderGroup, this.passwordVisibility, this.imagePath});

  RegistrationState copyWith(
      {bool? isMale,
      bool? isFemale,
      bool? passwordVisibility,
      String? imagePath}) {
    return RegistrationState(
        genderGroup: isFemale,
        passwordVisibility: passwordVisibility,
        imagePath: imagePath ?? this.imagePath);
  }
}
