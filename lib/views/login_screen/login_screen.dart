import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_guardian/core/sharedHelper/shared_helper.dart';
import 'package:mohavide_guardian/core/utils/contants.dart';
import 'package:mohavide_guardian/home.dart';
import 'package:mohavide_guardian/views/home_screen/sons_screen.dart';
import 'package:mohavide_guardian/views/login_screen/controller/controller.dart';
import 'package:mohavide_guardian/views/login_screen/states/states.dart';
import 'package:mohavide_guardian/views/register_screen/register_screen.dart';
import 'package:mohavide_guardian/widgets/build_text_forfield_widet.dart';
import 'package:mohavide_guardian/widgets/primary_button.dart';


class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>(debugLabel: 'login');

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
                /*action: SnackBarAction(
                  label: 'UNDO', onPressed: () {  },

                ),*/
              ),
            );

          }
          if (state is LoginSuccessState) {
            CacheHelper.saveData(key: 'uid', value: state.uid).then((value) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) =>  Sons_Screen(),
                ),
                    (route) {
                  return false;
                },
              );
            });
          }
        },
        builder: (context, state) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
             /* bottomNavigationBar: Image(
                image: AssetImage('assets/images/login_bottom.png'),
                width: double.infinity,
                height: 100.h,
                fit: BoxFit.cover,
              ),*/
              body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image(
                        image: const AssetImage('assets/images/new_login.png'),
                        width: double.infinity,
                        height: 380.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 15.h, right: 15.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              ' اهلا بك مرة اخرى',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 20.h),
                            BuildTextFormFieldWidget(
                              controller: emailController,
                              labelText: 'البريد الإلكتروني',
                              prefix: Icons.email,
                              validator: (String? value) {
                                if (value!.isEmpty || !value.contains("@")) {
                                  return 'من فضلك ادخل البريد الالكتروني';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),
                            BuildTextFormFieldWidget(
                              controller: passwordController,
                              labelText: 'كلمة المرور',
                              prefix: Icons.lock,
                              keyboardType: TextInputType.visiblePassword,
                              suffix: LoginCubit.get(context).suffix,
                              isPassword: LoginCubit.get(context).isPasswordEdit,
                              suffixPressed: () {
                                LoginCubit.get(context)
                                    .changePasswordVisibilityEdit();
                              },
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'من فضلك ادخل البريد المرور';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 20.h),
                            const Text(
                              'هل نسيت كلمة المرور ؟',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            SizedBox(height: 30.h),
                            (state is LoginLoadingState)
                                ? const Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ))
                                :  PrimaryButton(
                              onTap: () {

                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }

                              },
                              text: 'تسجيل الدخول',
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                const Text(
                                  'ليس لدي حساب ؟',
                                  style: TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (_)=> RegisterScreen()));
                                }, child: const Text(
                                  'انشاء حساب',
                                  style: TextStyle(fontSize: 18, color: primaryColor,fontWeight: FontWeight.bold),
                                ),)

                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
