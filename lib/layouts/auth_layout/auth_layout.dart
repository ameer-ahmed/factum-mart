import 'package:factum_mart/layouts/auth_layout/cubit/cubit.dart';
import 'package:factum_mart/layouts/auth_layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactumMartAuthLayout extends StatelessWidget {
  const FactumMartAuthLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FactumMartAuthLayoutCubit, FactumMartAuthLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FactumMartAuthLayoutCubit.get(context);
        return const Scaffold(
          body: Center(
            child: Text('Auth'),
          ),
        );
      },
    );
  }
}
