import 'package:flutter/material.dart';
import '/core/resources/_r.dart';
import 'base_view.dart';

class BottomSheetBase extends StatelessWidget with BaseView {
  final Widget child;
  const BottomSheetBase({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomBarHeight = systemPadding(context).bottom + viewInsets(context).bottom;
    return GestureDetector(
      onTap: () => router(context).hideKeyboard(context),
      child: Stack(
        children: [
          Container(
            width: size.width,
            margin: const EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.only(bottom: bottomBarHeight, top: 16.0),
            constraints: BoxConstraints(
              maxHeight: size.height * 0.9,
              minHeight: size.height * 0.2,
            ),
            decoration: BoxDecoration(
              color: R.color.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            child: child,
          ),
          Container(
            height: 10.0,
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: R.color.bottomSheetRadiusColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
          ),
        ],
      ),
    );
  }
}
