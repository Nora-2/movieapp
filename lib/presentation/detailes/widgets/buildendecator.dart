
import 'package:flutter/material.dart';
import 'package:movies/core/utils/appcolors/app_colors.dart';
import 'package:movies/core/utils/widgets/custom_loading_spin_kit_ring.dart';

class Buildlodingindecator extends StatelessWidget {
  const Buildlodingindecator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomLoadingSpinKitRing(
        loadingColor: Appcolors.kAppBarColor,
      ),
    );
  }
}