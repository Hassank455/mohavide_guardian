import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mohavide_guardian/views/home_screen/controller/controller.dart';
import 'package:mohavide_guardian/widgets/listTile_profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentProfile extends StatelessWidget {
 /* Map? data = {};

  StudentProfile({this.data});*/

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /*Container(
                height: 290.h,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/profileStudents.png',
                      width: double.infinity,
                      height: 230.h,
                      fit: BoxFit.cover,
                    ),

                  ],
                ),
              ),*/
              SizedBox(height: 40.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      HomeCubit.get(context).MomerizeDataProfile?['image'] ?? ''),
                  radius: 80.w,
                ),
              ),
              SizedBox(height: 30.h),
              buildLabelInProfile('اسم المحفظ', HomeCubit.get(context).MomerizeDataProfile?['name']  ?? '',Icons.person),
              SizedBox(height: 20.h),
              buildLabelInProfile('رقم الهاتف', HomeCubit.get(context).MomerizeDataProfile?['phoneNumber']   ?? '',Icons.phone),
              SizedBox(height: 20.h),
              buildLabelInProfile('الجنس', HomeCubit.get(context).MomerizeDataProfile?['gender']   ?? '',Icons.male ),
              SizedBox(height: 20.h),
              buildLabelInProfile('المرحلة الدراسية',  HomeCubit.get(context).MomerizeDataProfile?['educationalLevel']  ?? '',Icons.book),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
