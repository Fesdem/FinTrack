import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageRepositoryProvider = Provider(
  (ref) => MessageRepository(firebaseMessaging: FirebaseMessaging.instance),
);

class MessageRepository {
  final FirebaseMessaging firebaseMessaging;

  MessageRepository({required this.firebaseMessaging});

  // requested permission from user

  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();

    await firebaseMessaging.getToken();

    initPushNotifications();
  }

  void handleMessage(
    RemoteMessage? message,
    // BuildContext context,
    // String destinationScreen,
  ) {
    if (message == null) return;

    // handleNotificationScreen(context, destinationScreen);
  }

  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}