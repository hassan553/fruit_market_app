import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/uitls/app_colors.dart';
import '../../../widgets/custom_text.dart';

class BuildAppBarWidget extends StatelessWidget {
  const BuildAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.green,
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
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
            ],
          ),
          Column(
            children: const [
              SizedBox(
                height: 5,
              ),
              CustomTextWidget(
                text: 'Hassan Marzouk ',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextWidget(
                text: 'hassanmarzouk042@gmail.com ',
                color: Colors.white,
                fontSize: 18,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
