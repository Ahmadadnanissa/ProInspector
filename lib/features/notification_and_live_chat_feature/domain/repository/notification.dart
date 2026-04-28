import 'package:property_inspector/features/notification_and_live_chat_feature/data/models/notification_model.dart';

abstract class NotificationRepository {
  Future<List<AppNotification>> getAll();
  Future<List<AppNotification>> getUnread();
}
