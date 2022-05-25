import 'package:flutter/material.dart';
import 'package:mohavide_guardian/core/utils/contants.dart';
import 'package:mohavide_guardian/views/home_screen/controller/controller.dart';
import 'package:mohavide_guardian/views/tab_student_screen/widget/student_data_details.dart';
import 'package:mohavide_guardian/views/tab_student_screen/widget/student_profile.dart';


class StudentTabs extends StatefulWidget {
  Map? data = {};

  StudentTabs({this.data});

  @override
  State<StudentTabs> createState() => _StudentTabsState();
}

class _StudentTabsState extends State<StudentTabs> {
  @override
  void initState() {
    HomeCubit.get(context).getMomerizeDataProfile(widget.data?['uIdOfOMemorizers']);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('1111');
    print(widget.data?['uIdOfOMemorizers']);
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          title: Text('${widget.data?['nameOfStudent']} بيانات الطالب '),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_forward)),
          ],
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("بروفايل المحفظ"),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(Icons.person),
                ],
              ),
            ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("بيانات الطالب"),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(Icons.biotech),
                  ],
                ),
              ),


            ],
          ),
        ),
        body:  TabBarView(
          children: [
            StudentProfile(/*data: widget.data*/),
            StudentDataDetails(uId: widget.data?['uId']),

          ],
        ),
      ),
    );

  }
}
