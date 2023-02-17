import 'package:flutter/material.dart';
import 'package:fruit_market_app/features/home/presentation/vegetables/widgets/root_vegetables_body.dart';
import '../widgets/alluim_vegetables_body.dart';
import '../widgets/mixed_vegetables_body.dart';
import '../widgets/organic_vegetables.dart';

class VegetablesBodyView extends StatelessWidget {
  const VegetablesBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          OrganicVegetablesBody(),
          MixedVegetablesBody(),
          AlliumVegetablesBody(),
          RootVegetablesBody(),
        ],
      
    );
  }
}
