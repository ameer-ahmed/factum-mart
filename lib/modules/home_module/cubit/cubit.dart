import 'package:factum_mart/models/modules_models/home_module/categories_model.dart';
import 'package:factum_mart/modules/home_module/cubit/states.dart';
import 'package:factum_mart/shared/constants.dart';
import 'package:factum_mart/shared/network/end_points.dart';
import 'package:factum_mart/shared/network/remote/dio_helper.dart';
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
        print(categoriesModel!.status);
      } else {
        emit(FactumMartHomeModuleCategoriesErrorState());
      }
    }).catchError((error) {
      print(error);
      emit(FactumMartHomeModuleCategoriesErrorState());
    });
  }
}
