import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_market_app/features/home/presentation/vegetables/bloc/vegetables_bloc.dart';
import '../../../../../core/enums/app_state.dart';
import '../../../../../core/functions/globle_functions.dart';
import '../../views/details_view.dart';
import '../../widget/organic_fruit_text_widget.dart';
import '../../widget/product_item.dart';

class RootVegetablesBody extends StatelessWidget {
  const RootVegetablesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VegetablesBloc, VegetablesState>(
      builder: (context, state) {
        switch (state.rootState) {
          case RequestState.loaded:
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FruitTitleTextWidget(
                  priceOff: state.rootCollection.priceOff,
                  subTitle: state.rootCollection.subTitle,
                  title: state.rootCollection.title,
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
                            model: BlocProvider.of<VegetablesBloc>(context)
                                .rootList[index],
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ProductItemWidget(
                          productModel: BlocProvider.of<VegetablesBloc>(context)
                              .rootList[index],
                          image: '',
                        ),
                      ),
                    ),
                    itemCount: BlocProvider.of<VegetablesBloc>(context)
                        .rootList
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
