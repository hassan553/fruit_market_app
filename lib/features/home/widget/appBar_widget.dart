import 'package:flutter/material.dart';

import '../../widgets/custom_text.dart';

PreferredSizeWidget appBarWidget() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(150.0),
    child: AppBar(
      elevation: 10,
      title: const CustomTextWidget(
        text: 'Fruit Market ',
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    ),
  );
}
