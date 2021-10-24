import 'package:factum_mart/layouts/shop_layout/cubit/states.dart';
import 'package:factum_mart/modules/cart_module/cart_module.dart';
import 'package:factum_mart/modules/favorites_module/favorites_module.dart';
import 'package:factum_mart/modules/home_module/home_module.dart';
import 'package:factum_mart/modules/settings_module/settings_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactumMartShopLayoutCubit extends Cubit<FactumMartShopLayoutStates> {
  FactumMartShopLayoutCubit() : super(FactumMartShopLayoutInitialState());

  static FactumMartShopLayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> factumMartModules = const [
    FactumMartHomeModule(),
    FactumMartFavoritesModule(),
    FactumMartCartModule(),
    FactumMartSettingsModule(),
  ];
  int currentIndex = 0;

  void changeBottomNavigationBar(int index) {
    emit(FactumMartShopLayoutChangeBottomBar());
    currentIndex = index;
  }
}
