import 'package:factum_mart/layouts/auth_layout/cubit/states.dart';
import 'package:factum_mart/models/layouts_models/auth_layout/user_model.dart';
import 'package:factum_mart/shared/constants.dart';
import 'package:factum_mart/shared/network/end_points.dart';
import 'package:factum_mart/shared/network/local/cache_helper.dart';
import 'package:factum_mart/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactumMartAuthLayoutCubit extends Cubit<FactumMartAuthLayoutStates> {
  FactumMartAuthLayoutCubit() : super(FactumMartAuthLayoutInitialState());

  static FactumMartAuthLayoutCubit get(context) => BlocProvider.of(context);

  FactumMartUserModel? factumMartUserModel;
  void login({
    required String? username,
    required String? password,
  }) {
    emit(FactumMartLoginLoadingState());
    DioHelper.postData(
      url: loignEndPoint,
      data: {
        'username': username,
        'password': password,
      },
    ).then((value) {
      factumMartUserModel = FactumMartUserModel.fromMap(value.data);
      if (factumMartUserModel!.status == true) {
        CacheHelper.putData(
          key: 'userToken',
          value: factumMartUserModel!.data!.token,
        );
        debugPrint('$token');
        emit(FactumMartLoginSuccessState());
      } else {
        emit(FactumMartLoginErrorState());
      }
    }).catchError((error) {
      debugPrint('$error');
    });
  }
}
