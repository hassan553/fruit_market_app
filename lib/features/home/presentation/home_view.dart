import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/features/home/model/product_model.dart';
import 'package:fruit_market_app/features/home/presentation/vegetables/views/vegetables_body.dart';
import 'package:fruit_market_app/features/home/services/local_database/local_data.dart';
import 'package:fruit_market_app/features/widgets/category_app_list.dart';
import 'package:print_color/print_color.dart';
import '../../widgets/custom_cursole_slider.dart';
import '../view_model/home_cubit.dart';
import 'dry_fruit/views/dry_fruits_body.dart';
import 'fruit/view/fruit_body_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalDatabase().create();
    LocalDatabase().insert(
      productModel: ProductModel(
        id: 1,
        name: 'name',
        nutrition: ['qw', 'qw'],
        price: 12,
        image: 'image',
        star: 1,
      ),
    );
    Print.green('insert success');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SafeArea(
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  // this widget build Carousel slider at top of the application
                  CarouselSliderWidget(
                    images: cubit.carouselImagesList,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // category list contain ( fruit ,vegetables ,dry fruit )
                  CategoryAppList(
                    onTap: (int index) {
                      cubit.changeCategoryIndex(index);
                    },
                    currentIndex: cubit.currentIndex,
                    categoryList: cubit.categoriesString,
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Builder(
                    builder: (context) {
                      if (cubit.currentIndex == 0) {
                        return const VegetablesBodyView();
                      } else if (cubit.currentIndex == 1) {
                        return const FruitBodyView();
                      } else {
                        return const DryFruitsBodyView();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
