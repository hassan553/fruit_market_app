import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/core/functions/globle_functions.dart';
import 'package:fruit_market_app/features/cart/presentation/views/cart_view.dart';
import 'package:fruit_market_app/features/favourite/presentation/views/favourite_view.dart';
import 'package:fruit_market_app/features/setting/presentation/views/help_view.dart';
import 'package:fruit_market_app/features/setting/presentation/widgets/list_tile_widget.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../widgets/build_app_bar_widget.dart';
import 'order_view.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          body: Column(children: [
            BuildAppBarWidget(
                image: cubit.userModel.image,
                name: cubit.userModel.name,
                email: cubit.userModel.email),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ListTileWidget(
                    iconData: FontAwesome.bag_shopping,
                    text: 'My Orders',
                    onTap: () => navigateTo(context, const OrderView()),
                  ),
                  const SizedBox(height: 15),
                  ListTileWidget(
                    iconData: FontAwesome.heart_fill,
                    text: 'Favorites',
                    onTap: () => navigateTo(context, const FavoriteView()),
                  ),
                  const SizedBox(height: 15),
                  ListTileWidget(
                    iconData: FontAwesome.cart_shopping,
                    text: 'My Cart',
                    onTap: () => navigateTo(context, const CartView()),
                  ),
                  const SizedBox(height: 15),
                  ListTileWidget(
                    iconData: FontAwesome.share,
                    text: 'Refer a Friend',
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTileWidget(
                    iconData: Icons.help,
                    text: 'Help',
                    onTap: () => navigateTo(context, const HelpView()),
                  ),
                  const SizedBox(height: 15),
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
      },
    );
  }
}
