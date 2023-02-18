import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/uitls/app_colors.dart';
import '../../../widgets/custom_text.dart';

class BuildAppBarWidget extends StatelessWidget {
  final String name;
  final String email;
  const BuildAppBarWidget({
    super.key,
    required this.name,
    required this.email,
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
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.topRight,
              children: const [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    'assets/images/imag1.png',
                  ),
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.white,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children:  [
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
            const  SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
