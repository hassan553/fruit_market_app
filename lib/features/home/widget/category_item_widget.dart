import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/functions/globle_functions.dart';
import 'organic_fruit_text_widget.dart';

class CategoryItemWidget extends StatelessWidget {
  final String categoryTitle;

  const CategoryItemWidget({
    super.key,
    required this.categoryTitle,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
              //FruitCubit.get(context).fetchOrganicFruitProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      
                      FruitTitleTextWidget(
                        priceOff:9,
                        subTitle: 'snapshot.data!.subTitle',
                        title:' snapshot.data!.title',
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
                              //navigateTo(context, const DetailsView());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 8),
                              // child: OrganicFruitWidget(
                              //   productModel: FruitCubit.get(context)
                              //       .organicFruitList[index],
                              // ),
                              child: Container(),
                            ),
                          ),
                          itemCount: 1,
                        ),
                      ),
                      FruitTitleTextWidget(
                        priceOff: 10,
                        subTitle: '$categoryTitle Mix Fresh Pack',
                        title: 'Mixed $categoryTitle Pack',
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      SizedBox(
                        height: screenSize(context).height * .35,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: InkWell(
                              onTap: () {
                                //                              navigateTo(context, const DetailsView());
                              },
                              child: Container(),
                              // child: OrganicFruitWidget(
                              //   productModel: FruitCubit.get(context)
                              //       .organicFruitList[index],
                              ),
                            ),
                             itemCount:
                    10, //FruitCubit.get(context).organicFruitList.length,
                        
                          ),
                         
                      ),
                      FruitTitleTextWidget(
                        priceOff: 15,
                        subTitle: 'Fresh Stone $categoryTitle',
                        title: 'Stone $categoryTitle',
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      SizedBox(
                        height: screenSize(context).height * .35,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
//                              navigateTo(context, const DetailsView());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 8),
                              // child: OrganicFruitWidget(
                              //   productModel: FruitCubit.get(context)
                              //       .organicFruitList[index],
                              // ),
                              child: Container(),
                            ),
                          ),
                          itemCount:10,
                              //FruitCubit.get(context).organicFruitList.length,
                        ),
                      ),
                      FruitTitleTextWidget(
                        priceOff: 5,
                        subTitle: 'Fresh Melons $categoryTitle',
                        title: 'Melons $categoryTitle',
                      ),
                      SizedBox(
                        height: 5.sp,
                      ),
                      SizedBox(
                        height: screenSize(context).height * .35,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
//                              navigateTo(context, const DetailsView());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Container(),
                              // child: OrganicFruitWidget(
                              //   productModel: FruitCubit.get(context)
                              //       .organicFruitList[index],
                              // ),
                            ),
                          ),
                          itemCount:10,
                             // FruitCubit.get(context).organicFruitList.length,
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Text('error');
                }
              });
        
  }
}
