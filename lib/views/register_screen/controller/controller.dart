import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohavide_guardian/core/models/guardian_model.dart';
import 'package:mohavide_guardian/views/register_screen/states/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
     String? name,
     String? email,
     String? password,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email ?? '',
      password: password ?? '',
    )
        .then((value) {
      userCreate(
        uid: value.user!.uid,
        name: name ?? '',
        email: email ?? '',
        password: password ?? '',
      );
      emit(RegisterSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }


  void userCreate({
    required String name,
    required String email,
    required String uid,
    required String password,
  }) {
    GuardianModel model = GuardianModel(
      name: name,
      email: email,
      uId: uid,
      password: password,

    );
    FirebaseFirestore.instance
        .collection('guardian')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPasswordEdit = true;

  void changePasswordVisibilityEdit()
  {
    isPasswordEdit = !isPasswordEdit;
    suffix = isPasswordEdit ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(RegisterChangePasswordVisibilityState());
  }


}
