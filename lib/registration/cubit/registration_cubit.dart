import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  final ImagePicker _picker = ImagePicker();

  RegistrationCubit(super.initialState);

  onRadioChange(bool? isFemale) {
    emit(state.copyWith(isFemale: isFemale));
  }

  passwordVisibility() {
    emit(state.copyWith(
        passwordVisibility: !(state.passwordVisibility ?? true)));
  }

  clickImage({required ImageSource imageSource}) async {
    XFile? file = await _picker.pickImage(source: imageSource);
    if (file != null) {
      emit(state.copyWith(imagePath: file.path));
    }
  }

  clickImageForWeb({required String? image}) async {
    emit(state.copyWith(imagePath: image));
  }
}
