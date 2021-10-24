import 'package:buildcondition/buildcondition.dart';
import 'package:factum_mart/modules/home_module/cubit/cubit.dart';
import 'package:factum_mart/modules/home_module/cubit/states.dart';
import 'package:factum_mart/shared/network/end_points.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class FactumMartHomeModule extends StatelessWidget {
  const FactumMartHomeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FactumMartHomeModuleCubit, FactumMartHomeModuleStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FactumMartHomeModuleCubit.get(context);
        return BuildCondition(
          condition: cubit.categoriesModel != null,
          builder: (context) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: SizedBox(
                          height: 120,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return FactumMartHomeModuleCategoryItem(
                                icon: cubit.categoriesModel!.data![index].icon,
                                title: cubit.categoriesModel!.data![index].name,
                              );
                            },
                            itemCount: cubit.categoriesModel!.data!.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 15,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => const CircularProgressIndicator(),
        );
      },
    );
  }
}

class FactumMartHomeModuleCategoryItem extends StatelessWidget {
  final String? icon;
  final String? title;
  const FactumMartHomeModuleCategoryItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: HexColor('#f1f1f1'),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.network(
                baseUrl + icon!,
              ),
            ),
          ),
          Text(
            title!,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
