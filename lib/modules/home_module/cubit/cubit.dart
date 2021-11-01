import 'dart:developer';

import 'package:factum_mart/models/modules_models/home_module/categories_model.dart';
import 'package:factum_mart/models/modules_models/home_module/products_model.dart';
import 'package:factum_mart/modules/home_module/cubit/states.dart';
import 'package:factum_mart/shared/constants.dart';
import 'package:factum_mart/shared/network/end_points.dart';
import 'package:factum_mart/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactumMartHomeModuleCubit extends Cubit<FactumMartHomeModuleStates> {
  FactumMartHomeModuleCubit() : super(FactumMartHomeModuleInitialState());

  static FactumMartHomeModuleCubit get(context) => BlocProvider.of(context);

  FactumMartHomeModuleCategoriesModel? categoriesModel;

  void getHomeCategories() {
    emit(FactumMartHomeModuleCategoriesLoadingState());
    DioHelper.getData(
      url: categoriesEndPoint,
      token: token,
    ).then((value) {
      categoriesModel = FactumMartHomeModuleCategoriesModel.fromMap(value.data);
      if (categoriesModel!.status == true) {
        emit(FactumMartHomeModuleCategoriesSuccessState());
      } else {
        emit(FactumMartHomeModuleCategoriesErrorState());
      }
    }).catchError((error) {
      debugPrint('$error');
      emit(FactumMartHomeModuleCategoriesErrorState());
    });
  }

  FactumMartHomeModuleProductsModel? productsModel;
  int? itemCount = 8;
  int? page = 1;
  List<FactumMartHomeModuleProductsDataModel>? products = [];
  bool? isMore = false;
  bool? isOutRange = false;

  void getHomeProducts() {
    if (isOutRange == false) {
      isMore == false
          ? emit(FactumMartHomeModuleProductsLoadingState())
          : emit(FactumMartHomeModuleLoadMoreProductsLoadingState());
      DioHelper.getData(
        url: productsEndPoint +
            page!.toString() +
            '/?items_for_page=' +
            itemCount.toString(),
        token: token,
      ).then((value) {
        productsModel = FactumMartHomeModuleProductsModel.fromMap(value.data);
        if (productsModel!.status == true) {
          page = page! + 1;
          for (var element in productsModel!.data!) {
            products!.add(element);
          }
          isMore == false
              ? emit(FactumMartHomeModuleProductsSuccessState())
              : emit(FactumMartHomeModuleLoadMoreProductsSuccessState());
        } else {
          log(productsModel!.message.toString());
          emit(FactumMartHomeModuleProductsOutRangeState());
        }
        emit(FactumMartHomeModuleLoadMoreProductsCycleState());
      }).catchError((error) {
        log('$error');
        isMore == false
            ? emit(FactumMartHomeModuleProductsErrorState())
            : emit(FactumMartHomeModuleLoadMoreProductsErrorState());
      });
      isMore = false;
    } else {
      emit(FactumMartHomeModuleFullLoadedProductsState());
    }
  }

  void getMoreHomeProducts() {}
}
