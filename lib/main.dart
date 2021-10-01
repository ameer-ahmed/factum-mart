import 'package:factum_mart/layouts/auth_layout/cubit/cubit.dart';
import 'package:factum_mart/layouts/splash_layout/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const FactumMartApp());
}

class FactumMartApp extends StatelessWidget {
  const FactumMartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FactumMartAuthLayoutCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.red,
        ),
        home: const FactumMartSplashLayout(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
