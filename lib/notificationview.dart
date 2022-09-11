import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBarView(controller: DefaultTabController.of(context),
        children: [
          Tab(icon: Icon(Icons.pending),)
        ],
      ),
    );
  }
}
