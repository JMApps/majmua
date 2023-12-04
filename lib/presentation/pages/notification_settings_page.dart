import 'package:flutter/material.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';

class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Уведомления'),
        leading: const UserBackButton(),
      ),
    );
  }
}
