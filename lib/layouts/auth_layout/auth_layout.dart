import 'package:factum_mart/layouts/auth_layout/cubit/cubit.dart';
import 'package:factum_mart/layouts/auth_layout/cubit/states.dart';
import 'package:factum_mart/layouts/home_layout/home_layout.dart';
import 'package:factum_mart/shared/components/components.dart';
import 'package:factum_mart/shared/components/logo.dart';
import 'package:factum_mart/shared/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactumMartAuthLayout extends StatelessWidget {
  FactumMartAuthLayout({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FactumMartAuthLayoutCubit, FactumMartAuthLayoutStates>(
      listener: (context, state) {
        if (state is FactumMartLoginSuccessState) {
          navigateAndKill(
            context: context,
            widget: const FactumMartHomeLayout(),
          );
        }
      },
      builder: (context, state) {
        var cubit = FactumMartAuthLayoutCubit.get(context);
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const FactumMartLogo(
                textScaleFactor: 1,
                alignment: MainAxisAlignment.center,
              ),
              elevation: 0,
            ),
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Hello',
                                textScaleFactor: 5,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: const [
                                  Text(
                                    'There',
                                    textScaleFactor: 5,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '.',
                                    textScaleFactor: 5,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    FactumMartTextField(
                                      controller: usernameController,
                                      textInputType: TextInputType.emailAddress,
                                      labelText: 'Username or email',
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    FactumMartTextField(
                                      controller: passwordController,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      labelText: 'Password',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text('Forgot Password?'),
                                        style: TextButton.styleFrom(
                                          minimumSize: Size.zero,
                                          padding: EdgeInsets.zero,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 34,
                                    ),
                                    state is FactumMartLoginLoadingState
                                        ? const CircularProgressIndicator()
                                        : Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Colors.red,
                                            ),
                                            child: MaterialButton(
                                              onPressed: () {
                                                cubit.login(
                                                  username:
                                                      usernameController.text,
                                                  password:
                                                      passwordController.text,
                                                );
                                              },
                                              child: const Text(
                                                'LOGIN',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text('Don\'t have an account? '),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text('Create now'),
                                        style: TextButton.styleFrom(
                                          minimumSize: Size.zero,
                                          padding: EdgeInsets.zero,
                                          tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
