import 'package:factum_mart/layouts/shop_layout/cubit/cubit.dart';
import 'package:factum_mart/layouts/shop_layout/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactumMartShopLayout extends StatelessWidget {
  const FactumMartShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = FactumMartShopLayoutCubit.get(context);
    return BlocConsumer<FactumMartShopLayoutCubit, FactumMartShopLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              title: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            size: 20,
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: 'What\'s on your mind?',
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                ],
              ),
              titleSpacing: 0,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: cubit.factumMartModules[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) => cubit.changeBottomNavigationBar(index),
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_sharp),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_rounded),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_sharp),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_sharp),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
