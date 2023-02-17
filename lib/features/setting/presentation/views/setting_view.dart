import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import 'package:fruit_market_app/core/uitls/app_colors.dart';
import 'package:fruit_market_app/features/cart/presentation/views/cart_view.dart';
import 'package:fruit_market_app/features/favourite/presentation/views/favourite_view.dart';
import 'package:fruit_market_app/features/setting/presentation/views/help_view.dart';
import 'package:fruit_market_app/features/setting/presentation/widgets/list_tile_widget.dart';
import 'package:fruit_market_app/features/widgets/custom_text.dart';
import 'package:fruit_market_app/features/widgets/divider_widget.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

import '../widgets/build_app_bar_widget.dart';
import '../widgets/languages_widget.dart';
import 'order_view.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const BuildAppBarWidget(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              ListTileWidget(
                iconData: FontAwesome.bag_shopping,
                text: 'My Orders',
                onTap: () {
                  navigateTo(context, const OrderView());
                },
              ),
              const DividerWidget(),
              ListTileWidget(
                iconData: FontAwesome.heart_fill,
                text: 'Favorites',
                onTap: () {
                  navigateTo(context, const FavoriteView());
                },
              ),
              const DividerWidget(),
              ListTileWidget(
                iconData: FontAwesome.cart_shopping,
                text: 'My Cart',
                onTap: () {
                  navigateTo(context, const CartView());
                },
              ),
              const DividerWidget(),
              ListTileWidget(
                iconData: FontAwesome.language,
                text: 'language'.tr,
                onTap: () {
                  languagesWidget(context);
                },
              ),
              const DividerWidget(),
              ListTileWidget(
                iconData: FontAwesome.share,
                text: 'Refer a Friend',
                onTap: () {},
              ),
              const DividerWidget(),
              ListTileWidget(
                iconData: Icons.help,
                text: 'Help',
                onTap: () {
                  navigateTo(context, const HelpView());
                },
              ),
              const DividerWidget(),
              ListTileWidget(
                iconData: Icons.logout,
                text: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
