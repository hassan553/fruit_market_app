import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fruit_market_app/core/uitls/app_colors.dart';
import 'package:lottie/lottie.dart';

class UploadOrderView extends StatefulWidget {
  const UploadOrderView({super.key});

  @override
  State<UploadOrderView> createState() => _UploadOrderViewState();
}

class _UploadOrderViewState extends State<UploadOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildLoadingWidget(),
      ),
    );
  }

  Widget _buildSuccessWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          'assets/animations/done.json',
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Payment Successfully\nYour Order is Booked ',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset('assets/animations/loading.json'),
        const Text(
          'Please Wait',
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
