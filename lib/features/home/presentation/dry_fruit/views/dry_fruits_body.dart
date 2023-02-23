import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_market_app/features/home/presentation/dry_fruit/widgets/dehiscent_fruits.dart';
import 'package:fruit_market_app/features/home/presentation/dry_fruit/widgets/indehiscent_fruits_body.dart';
import '../bloc/dry_fruit_bloc.dart';
import '../widgets/kashmiri_dry_fruit_body.dart';
import '../widgets/mixed_fruits_body.dart';

class DryFruitsBodyView extends StatelessWidget {
  const DryFruitsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        IndehiscentDryFruitBody(),
        SizedBox(height: 15),
        MixedDryFruitBody(),
        SizedBox(height: 15),
        DehiscentDryFruitBody(),
        SizedBox(height: 15),
        KashmiriDryFruitBody(),
      ],
    );
  }
}
