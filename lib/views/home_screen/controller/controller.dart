import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohavide_guardian/core/utils/contants.dart';
import 'package:mohavide_guardian/views/home_screen/states/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);


  Map<String, dynamic>? data;

  List? allDataS = [];

  void getAllData()async{
    emit(GetDataLoadingState());

    var querySnapshot = await FirebaseFirestore.instance
        .collection('guardian').doc(uId).snapshots().listen((docSnapshot) {
      if (docSnapshot.exists) {
        data = docSnapshot.data()!;
        //  print(docSnapshot.data()!['student']);
        List? studentsUId = docSnapshot.data()?['student'];

        print('studentsUId');
        print(studentsUId);
        emit(GetStudentsDataLoadingState());

        studentsUId?.forEach((element) async {
          await FirebaseFirestore.instance
              .collection('students').doc(element).get().then((value){
            if(value.data()!.isNotEmpty){
              allDataS?.add(value.data()!);
            }
            emit(GetStudentsDataSuccessState());
          }).catchError((e){
            print('eeeeeee');
            print(e);
          });
        });
      }
      emit(GetDataSuccessState());
    });

  }

  Map? MomerizeDataProfile;

  void getMomerizeDataProfile(String uId){
    FirebaseFirestore.instance
        .collection('memorizers').doc(uId).get().then((value) {
          print(value.data());
         // print(value.data());
          MomerizeDataProfile = value.data();
          print(MomerizeDataProfile?['name']);
    }).catchError((e){
      print(e.toString());

    });
  }


}