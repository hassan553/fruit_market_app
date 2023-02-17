import 'package:flutter/material.dart';
import '../../dry_fruit/widgets/mixed_fruits_body.dart';
import '../widgets/melons_fruit_body.dart';
import '../widgets/organic_fruits_widget.dart';
import '../widgets/stone_fruit_body.dart';

class FruitBodyView extends StatelessWidget {
  const FruitBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            OrganicFruitsWidget(),
            MixedDryFruitBody(),
            StoneFruitWidget(),
            MelonsFruitWidget(),
          ],
        
      
    );
  }
}
