import 'package:factum_mart/layouts/auth_layout/auth_layout.dart';
import 'package:factum_mart/layouts/auth_layout/cubit/cubit.dart';
import 'package:factum_mart/layouts/splash_layout/splash_layout.dart';
import 'package:factum_mart/shared/bloc_observer.dart';
import 'package:factum_mart/shared/constants.dart';
import 'package:factum_mart/shared/network/local/cache_helper.dart';
import 'package:factum_mart/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'userToken');
  runApp(
    FactumMartApp(
      token: token,
    ),
  );
}

class FactumMartApp extends StatelessWidget {
  const FactumMartApp({Key? key, required this.token}) : super(key: key);
  final String? token;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FactumMartAuthLayoutCubit>(
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
