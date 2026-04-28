import 'package:flutter/material.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/data/models/notification_model.dart';
import 'package:property_inspector/features/notification_and_live_chat_feature/domain/repository/notification.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
// ignore: library_prefixes

class NotificationProvider extends ChangeNotifier {
  final NotificationRepository repo;

  NotificationProvider(this.repo);

  List<AppNotification> notifications = [];
  bool isLoading = false;

  Future<void> loadAll() async {
    isLoading = true;
    notifyListeners();

    notifications = await repo.getAll();

    isLoading = false;
    notifyListeners();
  }

  Future<void> loadUnread() async {
    isLoading = true;
    notifyListeners();

    notifications = await repo.getUnread();

    isLoading = false;
    notifyListeners();
  }

  void addNotification(AppNotification notification) {
    notifications.insert(0, notification);
    notifyListeners();
  }

  late IO.Socket socket;

  void connectSocket() {
    socket = IO.io(
      'http://your-server-url',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .build(),
    );

    socket.connect();

    socket.on('new_notification', (data) {
      final notification = AppNotification.fromJson(data);
      addNotification(notification);
    });
  }
}
