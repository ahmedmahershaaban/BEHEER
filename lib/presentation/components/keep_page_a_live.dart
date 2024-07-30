import 'package:flutter/material.dart';

class KeepPageALive extends StatefulWidget {
  const KeepPageALive({super.key, required this.child});
  final Widget child;
  @override
  State<KeepPageALive> createState() => _KeepPageALiveState();
}

class _KeepPageALiveState extends State<KeepPageALive> with AutomaticKeepAliveClientMixin<KeepPageALive> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
