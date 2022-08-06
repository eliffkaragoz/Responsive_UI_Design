import 'package:flutter/material.dart';

import '../../extension/context_extension.dart';

import '../../theme/color_constants.dart';

class AppBarForSignIn extends PreferredSize {
  final BuildContext context;
  AppBarForSignIn({Key? key, required this.context})
      : super(
          key: key,
          preferredSize: Size.fromHeight(context.dynamicHeight(0.18)),
          child: Container(
            color: CustomColorScheme.instance.appBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.dynamicWidth(0.1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: context.dynamicHeight(0.01)),
                      Expanded(flex: 1, child: buildBackIconButton(context)),
                      const Spacer(
                        flex: 2,
                      ),
                      Expanded(
                        flex: 2,
                        child: buildTitle(),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    buildCircle(colorValue: 0xff0050c3, x: 90),
                    buildCircle(colorValue: 0xff1853c8, y: -50)
                  ],
                ),
              ],
            ),
          ),
        );
  static IconButton buildBackIconButton(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back, color: Colors.white),
    );
  }

  static Text buildTitle() {
    return const Text(
      "Sign In",
      style: TextStyle(
          color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }

  static Transform buildCircle(
      {required int colorValue, double x = 0, double y = 0}) {
    return Transform(
      transform: Matrix4.translationValues(x, y, 0),
      child: CircleAvatar(
        backgroundColor: Color(colorValue).withOpacity(0.5),
        radius: 90.0,
      ),
    );
  }
}
