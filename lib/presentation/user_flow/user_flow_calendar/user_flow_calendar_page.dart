import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media_management/presentation/user_flow/user_flow_calendar/components/body.dart';

@RoutePage()
class UserFlowCalendarPage extends StatelessWidget {
  const UserFlowCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Body();
  }
}
