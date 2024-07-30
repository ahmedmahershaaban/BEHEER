import 'package:flutter/material.dart';
import 'package:ringo_media_management/presentation/components/shimmer_loading.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_menu_controller/components/user_flow_app_bar.dart';

class UserFlowMainScaffold extends StatelessWidget {
  const UserFlowMainScaffold({
    super.key,
    required this.appBarTitle,
    required this.appBarSubTitle,
    required this.body,
    required this.drawer,
  });
  final String appBarTitle;
  final String? appBarSubTitle;
  final Widget body;
  final Widget drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: UserFlowAppBar(
        title: appBarTitle,
        subTitle: appBarSubTitle,
      ),
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: body,
      ),
      drawer: drawer,
    );
  }
}
