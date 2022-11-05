import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_task/moduels/gallery_moduel/gallery_screen.dart';
import 'package:job_task/moduels/login_moduel/cubit/login_cubit.dart';

import '../../component/widgets/login_widget/login_button.dart';
import '../../component/widgets/login_widget/text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: height,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/loginbg.png'),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              const Text(
                                '    My\nGallery ',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Color(
                                    0xff4A4A4A,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              BlurryContainer(
                                child: Container(
                                  height: 400,
                                  width: 388,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.6),
                                      borderRadius: BorderRadius.circular(32)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 48, right: 31, left: 31),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'LOG IN',
                                          style: TextStyle(
                                              color: Color(0xff4A4A4A),
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        SizedBox(
                                          height: 47,
                                          child: DefaultTextFiled(
                                            hintText: 'user name',
                                            controller: emailController,
                                            obsecure: false,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        SizedBox(
                                          height: 47,
                                          child: DefaultTextFiled(
                                            obsecure: true,
                                            hintText: 'password',
                                            controller: passwordController,
                                          ),
                                        ),
                                        if (state is! LoginLoadingState)
                                          DefulatBotton(
                                            text: 'SUBMIT',
                                            function: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                cubit.logIn(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  context: context ,
                                                );
                                              }
                                            },
                                          ),
                                        if (state is LoginLoadingState)
                                          const SizedBox(
                                            height: 30,
                                          ),
                                        if (state is LoginLoadingState)
                                          const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 80,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/icon4.png',
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {

        },
      ),
    );
  }
}
