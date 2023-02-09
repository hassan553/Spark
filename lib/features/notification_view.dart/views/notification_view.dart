import 'package:flutter/material.dart';

import '../../widgets/background_widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Center(
        child: Text('notification'),
      ),
    );
  }
}
