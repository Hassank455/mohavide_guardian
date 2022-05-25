import 'package:flutter/material.dart';
import 'package:mohavide_guardian/teacher_data.dart';
import 'package:mohavide_guardian/teatcher_profile.dart';


class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}


class _Home_pageState extends State<Home_page> {
  int index = 1;
  String appBarTitle = "بيانات الطالب صقر أحمد محمد";

  @override
  Widget build(BuildContext context) {

    return  DefaultTabController(
        length: 2,
        initialIndex: index,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            automaticallyImplyLeading: false,
            title: Text('$appBarTitle '),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_forward)),
            ],
            centerTitle: true,
            bottom: TabBar(
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
          body: TabBarView(
            children: [
              Teatcher_profile(),
              Teacher_data(),
            ],
          ),
        ),
      );

  }

  @override
  void setState(VoidCallback fn) {
    if (index == 0) {
      setState(() {
        appBarTitle == "MMMMMMMMMMM";
      });
    }
    super.setState(fn);
  }
}
