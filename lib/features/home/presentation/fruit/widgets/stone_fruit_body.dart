import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/enums/app_state.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../views/details_view.dart';
import '../../widget/organic_fruit_text_widget.dart';
import '../../widget/product_item.dart';
import '../bloc/fruit_bloc.dart';

class StoneFruitWidget extends StatelessWidget {
  const StoneFruitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FruitBloc, FruitState>(
      builder: (context, state) {
        switch (state.stoneFruitState) {
          case RequestState.loaded:
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FruitTitleTextWidget(
                  priceOff: state.stoneFruitCollection.priceOff,
                  subTitle: state.stoneFruitCollection.subTitle,
                  title: state.stoneFruitCollection.title,
                ),
                SizedBox(
                  height: 8.sp,
                ),
                SizedBox(
                  height: screenSize(context).height * .28,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        navigateTo(
                          context,
                          DetailsView(
                            model: BlocProvider.of<FruitBloc>(context)
                                .stoneFruitList[index],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ProductItemWidget(
                          productModel: BlocProvider.of<FruitBloc>(context)
                              .stoneFruitList[index],
                          image: '',
                        ),
                      ),
                    ),
                    itemCount: BlocProvider.of<FruitBloc>(context)
                        .stoneFruitList
                        .length,
                  ),
                ),
              ],
            );
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );

          case RequestState.error:
            return const Text('an error occur');
        }
      },
    );
  }
}
