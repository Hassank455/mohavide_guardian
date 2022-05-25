import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Teacher_data extends StatelessWidget {
  const Teacher_data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(16),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ما حفظه الطالب',
                        style: TextStyle(fontSize: 20),
                      ),

                      Spacer(),
                      Text(
                        'سورة المطففين',
                        style: TextStyle(color: Colors.grey[600], fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(16),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'الواجب المقرر حله',
                        style: TextStyle(fontSize: 20),
                      ),


                      Spacer(),
                      Text(
                        ' سورة النازعات',
                        style: TextStyle(color: Colors.grey[600], fontSize: 18),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(16),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تقييم ما تم حفظه',
                        style: TextStyle(fontSize: 20),
                      ),

                      Spacer(),
                      Text(
                        '10/10',
                        style: TextStyle(color: Colors.grey[600], fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(16),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تقييم الواجب الأخير',
                        style: TextStyle(fontSize: 20),
                      ),

                      Spacer(),
                      Text(
                        '5/5',
                        style: TextStyle(color: Colors.grey[600], fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.grey[200],
                  padding: EdgeInsets.all(16),
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'الحضور لاخر يوم',
                        style: TextStyle(fontSize: 20),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      //   child: Icon(
                      //     Icons.arrow_forward,
                      //     color: Colors.grey,
                      //   ),
                      // ),
                      Spacer(),
                      Text(
                        'حاضر',
                        style: TextStyle(color: Colors.grey[600], fontSize: 18),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
