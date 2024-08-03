import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_project_summary/components/body.dart';

/// This Page and it's Components will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@RoutePage()
class UserFlowProjectSummaryPage extends StatelessWidget {
  const UserFlowProjectSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Body();
  }
}
