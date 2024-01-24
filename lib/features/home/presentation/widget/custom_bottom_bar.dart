import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class CustomBottomBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function onIconTap;
  const CustomBottomBarWidget(
      {super.key, required this.onIconTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          onIconTap(value);
        },
        iconSize: 20.sp,
        selectedLabelStyle: TextStyle(
          fontSize: 16.sp,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 13.sp,
        ),
        items: const  [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.cart_plus,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesome.heart,
            ),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'My Account',
          ),
        ]);
  }
}
