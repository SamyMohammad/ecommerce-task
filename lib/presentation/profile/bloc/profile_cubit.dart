import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repositories/profile_repository/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(const InitialProfileState());
  final ProfileRepo profileRepo;

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      emit(const PickImageState());
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
