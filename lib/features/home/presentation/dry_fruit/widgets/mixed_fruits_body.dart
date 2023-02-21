import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/enums/app_state.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../../widget/organic_fruit_text_widget.dart';
import '../../../widget/product_item.dart';
import '../../details_view.dart';
import '../bloc/dry_fruit_bloc.dart';

class MixedDryFruitBody extends StatelessWidget {
  const MixedDryFruitBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DryFruitBloc, DryFruitState>(
      builder: (context, state) {
        switch (state.mixedDryFruitState) {
          case RequestState.loaded:
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FruitTitleTextWidget(
                  priceOff: state.mixedDryFruitCollection.priceOff,
                  subTitle: state.mixedDryFruitCollection.subTitle,
                  title: state.mixedDryFruitCollection.title,
                ),
                SizedBox(
                  height: 8.sp,
                ),
                SizedBox(
                  height: screenSize(context).height * .35,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        navigateTo(
                          context,
                          DetailsView(
                            model: BlocProvider.of<DryFruitBloc>(context)
                                .mixedDryFruitList[index],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ProductItemWidget(
                          productModel: BlocProvider.of<DryFruitBloc>(context)
                              .mixedDryFruitList[index],
                          image: '',
                        ),
                      ),
                    ),
                    itemCount: BlocProvider.of<DryFruitBloc>(context)
                        .mixedDryFruitList
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
