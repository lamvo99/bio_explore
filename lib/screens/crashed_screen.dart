// Flutter imports:
import 'package:bio_explore/app_common_data/app_colors.dart';
import 'package:bio_explore/gen/assets.gen.dart';
import 'package:bio_explore/shared_customization/widgets/app_layout.dart';
import 'package:bio_explore/shared_customization/widgets/texts/app_text.dart';
import 'package:flutter/material.dart';

class CrashedScreen extends StatelessWidget {
  final dynamic exception;

  const CrashedScreen({super.key, required this.exception});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: AppLayout(
          showAppBar: true,
          title: "Lỗi",
          onWillPop: () => Future.value(true),
          body: SizedBox(
              width: width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        child:
                            Assets.images.error.image(width: 200, height: 120)),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: AppText(
                          exception.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: AppColors.gray600,
                              fontWeight: FontWeight.w400),
                        ))
                  ])),
        ));
  }
}
