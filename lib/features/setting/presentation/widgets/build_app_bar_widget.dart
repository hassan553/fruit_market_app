import 'dart:io';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/uitls/app_colors.dart';
import '../../../home/view_model/home_cubit.dart';
import '../../../widgets/custom_text.dart';

class BuildAppBarWidget extends StatelessWidget {
  final String name;
  final String email;
  final String image;
  XFile? images;
  BuildAppBarWidget({
    super.key,
    required this.name,
    required this.email,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimaryColor,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => Align(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: FancyShimmerImage(
                      width: 170,
                      height: 170,
                      imageUrl: HomeCubit.get(context).userModel.image,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      HomeCubit.get(context).getImageGallery();
                    },
                    child: const CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.white,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              CustomTextWidget(
                text: name,
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextWidget(
                text: email,
                color: Colors.white,
                fontSize: 18,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
