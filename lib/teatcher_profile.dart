import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Teatcher_profile extends StatelessWidget {
  const Teatcher_profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body :Directionality(
          textDirection:TextDirection.rtl,
          child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [  const CircleAvatar(

              radius: 40,
              backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg'),
            ),

              SizedBox(height: 15,),
              const Text(
                'المحفظ أحمد سعيد عمر ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              const Text(
                'mnfn2000@gmail.com',
                style: TextStyle(),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                    Text(
                      '0599895976',
                      style: TextStyle(color: Colors.green),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              const Text(
                ' أنا المحفظ سعيد أحمد عمر , حاصل على درجة البكالوريوس من كلية أصول الدين في الجامعة الإسلامية ولدي العديد من دورات الأحكام والتجويد بدايةً من الإبتدائية إلى تأهيل السند وبفضل الله أتممت حفظ كتاب الله كاملا',
                style: TextStyle(color: Colors.grey),
                maxLines: 3,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              TextButton(onPressed: (){}, child: Text('عرض المزيد', style: TextStyle(color: Colors.green),)),
            ],
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Row(

              children: [
                Container(
                  child: Column(
                    children: [
                      Text('عدد الطلاب', style: TextStyle(fontSize: 13 , fontWeight: FontWeight.bold),) ,
                      Text('15 طالب', style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 2,
                    height:34,
                    color: Colors.grey,
                  ),
                ),

              ],
            ),
            Row(

              children: [
                Container(
                  child: Column(
                    children: [
                      Text('المؤهل العلمي',  style: TextStyle(fontSize: 13 , fontWeight: FontWeight.bold),) ,
                      Text('بكالوريوس', style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 2,
                    height:34,
                    color: Colors.grey,
                  ),
                ),

              ],
            ),
            Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Text('عدد الدورات التعليمية', style: TextStyle(fontSize: 13 , fontWeight: FontWeight.bold),) ,
                      Text('7 دورات', style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ),



              ],
            ),

          ],),
          Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text('اسم المسجد التابع له' , style: TextStyle(fontSize:13 ,fontWeight:FontWeight.normal  ),),
                Text('المسجد العمري الكبير' , style: TextStyle(fontSize:11 ,fontWeight: FontWeight.normal,color:Colors.grey ),),
              ],
            ),
          ),
          Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children:  [
                Row(
                  children: [
                    Icon(Icons.location_on , color: Colors.green,),
                    Text('موقع المسجد' , style: TextStyle(fontSize:13 ,fontWeight:FontWeight.normal  ),),
                  ],
                ),
                Text('المسجد العمري الكبير' , style: TextStyle(fontSize:11 ,fontWeight: FontWeight.normal,color:Colors.grey ),),
              ],
            ),
          ),
        ],
      ),
    ),
      ),
       floatingActionButton: Padding(
         padding: const EdgeInsets.all(30.0),
         child: Container(

           alignment: Alignment.bottomLeft,
           child: FloatingActionButton(

            onPressed: (){

            },
             child: const Icon(Icons.message),
             backgroundColor: Colors.green,
           ),
         ),
       ),

    );
  }
}

