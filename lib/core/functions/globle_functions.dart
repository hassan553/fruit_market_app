import 'package:flutter/material.dart';
import 'package:route_transitions_easy/route_transitions_easy.dart';

Size screenSize(context) {
  return MediaQuery.of(context).size;
}

navigateOff(context, screen) {
  RouteTransitionsEasy(
    context: context,
    child: screen,
    animation: AnimationType.fadeIn,
    duration: const Duration(milliseconds: 500),
    replacement: true,
  );
}

navigateTo(context, screen) {
  RouteTransitionsEasy(
    context: context,
    child: screen,
    animation: AnimationType.fadeIn,
    duration: const Duration(milliseconds: 500),
    replacement: false,
  );
}

pop(context) {
  Navigator.pop(
    context,
  );
}

showDialogWidget(context, text) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: SizedBox(
          height: screenSize(context).height * .1,
          width: screenSize(context).width * .3,
          child: Column(
            children: [
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

enum DialogState { success, error }
