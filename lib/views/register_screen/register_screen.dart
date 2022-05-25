import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mohavide_guardian/core/sharedHelper/shared_helper.dart';
import 'package:mohavide_guardian/core/utils/contants.dart';
import 'package:mohavide_guardian/home.dart';
import 'package:mohavide_guardian/views/login_screen/login_screen.dart';
import 'package:mohavide_guardian/views/register_screen/controller/controller.dart';
import 'package:mohavide_guardian/views/register_screen/states/states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mohavide_guardian/widgets/primary_button.dart';

import '../../widgets/build_text_forfield_widet.dart';

class RegisterScreen extends StatefulWidget {



  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
   var formKey2 = GlobalKey<FormState>(debugLabel: 'register');

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {

        if(state is RegisterErrorState){
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

        if (state is RegisterSuccessState)
        {
          CacheHelper.saveData(key: 'uid', value: state.uid).then((value) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Home_page(),
              ),
                  (route) {
                return false;
              },
            );
          }
        );
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey2,
                child: Column(
                  children: [
                    Image(
                      image: const AssetImage('assets/images/register_image.png'),
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
                            'إنشاء حساب جديد',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(height: 20.h),
                          BuildTextFormFieldWidget(
                            controller: nameController,
                            labelText: 'الاسم',
                            prefix: Icons.person,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل الاسم';
                              }
                            },
                          ),
                          SizedBox(height: 20.h),
                          BuildTextFormFieldWidget(
                            controller: emailController,
                            labelText: 'البريد الإلكتروني',
                            keyboardType: TextInputType.emailAddress,
                            prefix: Icons.email,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل البريد الالكنروني';
                              }
                            },
                          ),
                          SizedBox(height: 20.h),
                          BuildTextFormFieldWidget(
                            controller: passwordController,
                            labelText: 'كلمة المرور',
                            prefix: Icons.lock,
                            keyboardType: TextInputType.visiblePassword,
                            suffix: RegisterCubit.get(context).suffix,
                            isPassword: RegisterCubit.get(context).isPasswordEdit,
                            suffixPressed: () {
                              RegisterCubit.get(context)
                                  .changePasswordVisibilityEdit();
                            },
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل كلمة المرور';
                              }
                            },
                          ),
                          SizedBox(height: 20.h),
                          const Text(
                            'هل نسيت كلمة المرور ؟',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(height: 30.h),
                          (state is RegisterLoadingState)
                              ? const Center(
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ))
                              : PrimaryButton(
                            onTap: () {

                              if (formKey2.currentState!.validate()) {
                                RegisterCubit.get(context).userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }

                            },
                            text: 'إنشاء حساب',
                          ),
                          Row(
                            children: [
                              const Text(
                                'لدي حساب مسبقاً ؟',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              TextButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (_)=> LoginScreen()),
                                );
                              }, child: const Text(
                                'تسجيل الدخول',
                                style: TextStyle(fontSize: 18, color: primaryColor,fontWeight: FontWeight.bold),
                              ),)

                            ],
                          ),SizedBox(height: 30.h),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
