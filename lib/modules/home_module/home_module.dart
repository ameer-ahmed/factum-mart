import 'dart:ui';

import 'package:buildcondition/buildcondition.dart';
import 'package:factum_mart/models/modules_models/home_module/products_model.dart';
import 'package:factum_mart/modules/home_module/cubit/cubit.dart';
import 'package:factum_mart/modules/home_module/cubit/states.dart';
import 'package:factum_mart/shared/network/end_points.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class FactumMartHomeModule extends StatefulWidget {
  const FactumMartHomeModule({Key? key}) : super(key: key);

  @override
  State<FactumMartHomeModule> createState() => _FactumMartHomeModuleState();
}

class _FactumMartHomeModuleState extends State<FactumMartHomeModule> {
  final ScrollController? scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController!.addListener(() {
      if (scrollController!.position.pixels ==
          scrollController!.position.maxScrollExtent) {
        FactumMartHomeModuleCubit.get(context).isMore = true;
        FactumMartHomeModuleCubit.get(context).getHomeProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FactumMartHomeModuleCubit, FactumMartHomeModuleStates>(
      listener: (context, state) {
        if (state is FactumMartHomeModuleProductsOutRangeState) {
          FactumMartHomeModuleCubit.get(context).isOutRange = true;
        }
      },
      builder: (context, state) {
        var cubit = FactumMartHomeModuleCubit.get(context);
        return BuildCondition(
          condition:
              cubit.categoriesModel != null && cubit.productsModel != null,
          builder: (context) => SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
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
                        height: 14,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Latest Products',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                        ),
                        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                          childAspectRatio: 0.9 / 1.65,
                          children: List.generate(
                            cubit.products!.length,
                            (index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: FactumMartHomeModuleProductItem(
                                  productData: cubit.products![index],
                                ),
                              );
                            },
                            growable: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (cubit.isOutRange == false)
                    Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              ),
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
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
    return SizedBox(
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
                width: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.center,
            child: Text(
              title!,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class FactumMartHomeModuleProductItem extends StatelessWidget {
  final FactumMartHomeModuleProductsDataModel? productData;
  const FactumMartHomeModuleProductItem({Key? key, required this.productData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.favorite_outline),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Image(
                        image: NetworkImage('${productData!.image}'),
                        errorBuilder: (context, error, stackTrace) =>
                            const Image(
                          image: AssetImage('assets/images/image_notfound.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${productData!.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: const [
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'EGP',
                                    style: TextStyle(
                                      color: Colors.red,
                                      // fontFeatures: [
                                      //   FontFeature.superscripts(),
                                      // ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${productData!.price}'.split('.')[0],
                                textScaleFactor: 1.5,
                                style: const TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              if ('${productData!.price}'
                                  .split('.')
                                  .asMap()
                                  .containsKey(1)) ...[
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '${productData!.price}'.split('.')[1],
                                      // textScaleFactor: 1,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        // fontFeatures: [
                                        //   FontFeature.superscripts(),
                                        // ],
                                      ),
                                    ),
                                  ],
                                ),
                              ]
                            ],
                          ),
                          if (productData!.price != productData!.oldPrice) ...[
                            Text(
                              'EGP ${productData!.oldPrice}',
                              textScaleFactor: 0.9,
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
