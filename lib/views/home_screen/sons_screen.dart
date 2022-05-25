import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_guardian/core/utils/contants.dart';
import 'package:mohavide_guardian/home.dart';
import 'package:mohavide_guardian/views/home_screen/controller/controller.dart';
import 'package:mohavide_guardian/views/home_screen/states/states.dart';
import 'package:mohavide_guardian/views/home_screen/widget/student_widget.dart';


class Sons_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
        /*  if (state is GetDataLoadingState) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }*/
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: Text('الأبناء'),
              centerTitle: true,
            ),
            body: (state is GetStudentsDataSuccessState) ? (HomeCubit.get(context).allDataS!.isEmpty ||
                HomeCubit.get(context).allDataS?.length ==
                    null)
                ? const Center(
              child: Text('لا يوجد طلاب'),
            )
                : Directionality(
              textDirection:TextDirection.rtl,
              child:Padding(
                padding: EdgeInsets.all(16.0.h),
                child: Column(
                  children: [
                     ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => StudentWidget(
                          data: HomeCubit.get(context)
                              .allDataS?[index],
                          context: context,
                          name: HomeCubit.get(context)
                              .allDataS?[index]['nameOfStudent'],
                          image: HomeCubit.get(context)
                              .allDataS?[index]['image'],
                          nameGuration: HomeCubit.get(context)
                              .allDataS?[index]['nameOfGuardian'],
                        ),
                        separatorBuilder: (context, index) =>
                        const SizedBox(
                          height: 20,
                        ),
                        itemCount: HomeCubit.get(context)
                            .allDataS!
                            .length),
                  ],
                ),
              ),

            ) : const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
    );
  }

}

