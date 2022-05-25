import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_guardian/core/utils/contants.dart';
import 'package:mohavide_guardian/views/tab_student_screen/widget/show_student_data.dart';

class StudentDataDetails extends StatelessWidget {

  String? uId;
  StudentDataDetails({this.uId});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('students')
              .doc(uId).snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              );
            }
            return (snapshot.data['dataStudent'] != null) ? ListView(
              physics: AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              children: snapshot.data?['dataStudent'].map<Widget>((document) {
                return showStudentData(
                    preservation: document['preservation'],
                    description: document['description'],
                  audience:document['audience'] ,
                  evaluation: document['evaluation'],
                  homeWork: document['homeWork'],
                  date: document['date'],
                );
            }).toList(),
            ) : Center(
              child: Text('لا يوجد بيانات'),
            );
          },
        ),
      ),
    );
  }
}
