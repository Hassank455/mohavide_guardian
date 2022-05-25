import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_guardian/core/sharedHelper/shared_helper.dart';
import 'package:mohavide_guardian/core/utils/BlocObserver.dart';
import 'package:mohavide_guardian/home.dart';
import 'package:mohavide_guardian/views/home_screen/controller/controller.dart';
import 'package:mohavide_guardian/views/home_screen/sons_screen.dart';
import 'package:mohavide_guardian/views/login_screen/controller/controller.dart';
import 'package:mohavide_guardian/views/login_screen/login_screen.dart';
import 'package:mohavide_guardian/views/on_boarding_screen/controller/controller.dart';
import 'package:mohavide_guardian/views/on_boarding_screen/on_boarding_screen.dart';
import 'package:mohavide_guardian/views/register_screen/controller/controller.dart';
import 'package:mohavide_guardian/views/splash_screen/splash_screen.dart';
import 'package:mohavide_guardian/widgets/custom_error.dart';

import 'core/utils/contants.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await CacheHelper.init();

  Widget widget;
  bool? splash = CacheHelper.getData(key: 'splash');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  uId = CacheHelper.getData(key: 'uid');
  print('uId');
  print(uId);

  if (splash != null) {
    if (onBoarding != null) {
      if (uId != null) {
        widget = Sons_Screen();
      } else {
        widget = LoginScreen();
      }
    } else {
      widget = OnBoardingScreen();
    }
  } else {
    widget = SplashScreen();
  }
  BlocOverrides.runZoned(
    () {
      customError();
      runApp(MyApp(
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;

  MyApp({
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnBoardingCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getAllData(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(392, 872),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: "PNU",
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.green,
              ),
            ),
            home: Directionality(
                textDirection: TextDirection.rtl, child: startWidget!),
          );
        },
      ),
    );
  }
}
