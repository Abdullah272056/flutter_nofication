import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager{

   final FlutterLocalNotificationsPlugin notificationsPlugin=FlutterLocalNotificationsPlugin();

  Future<void>  initNotification()async{
     AndroidInitializationSettings initializationSettingsAndroid= const
      AndroidInitializationSettings("flutter_logo");
     DarwinInitializationSettings initializationIos=
     DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
       onDidReceiveLocalNotification: (id,title,body,payload){}
     );


     InitializationSettings initializationSettings =InitializationSettings(
      android: initializationSettingsAndroid,
       iOS: initializationIos
     );

     await notificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse:(details){},

     );


   }




   Future<void> simpleNotificationsShow()async {



     AndroidNotificationDetails androidNotificationDetails =
     AndroidNotificationDetails(
         "channel_id",
         "channel_title",

         priority: Priority.high,
         importance: Importance.max,
         icon: "flutter_logo",
         largeIcon: DrawableResourceAndroidBitmap("flutter_logo")

     );
NotificationDetails notificationDetails =NotificationDetails(
android: androidNotificationDetails);

await notificationsPlugin.show(0, "Simple Notification", "New User send message", notificationDetails);

  }

   Future<void> bigPictureNotificationsShow()async {

     BigPictureStyleInformation bigPictureStyleInformation=
     BigPictureStyleInformation(DrawableResourceAndroidBitmap("flutter_logo"),

     contentTitle: "content Title",
       largeIcon: DrawableResourceAndroidBitmap("flutter_logo")
     );

     AndroidNotificationDetails androidNotificationDetails  =  AndroidNotificationDetails(
         "big_picture_id",
         "big_picture_title",
         priority: Priority.high,
         importance: Importance.max,
       styleInformation: bigPictureStyleInformation
     );

     NotificationDetails notificationDetails =NotificationDetails(android: androidNotificationDetails);

     //if id
     await notificationsPlugin.show(1, "Big Picture Notification Notification", "New message", notificationDetails);

   }


   Future<void> multipleNotificationsShow()async {

     AndroidNotificationDetails androidNotificationDetails =
     AndroidNotificationDetails(
         "channel_id",
         "channel_title",
         priority: Priority.high,
         importance: Importance.max,
       groupKey: "commonMessage"


     );
     NotificationDetails notificationDetails =NotificationDetails(
         android: androidNotificationDetails);

      notificationsPlugin.show(0, "New Notification", "User 1 send message", notificationDetails);

      Future.delayed(const Duration(microseconds: 1000),
           (){

             notificationsPlugin.show(1, "New Notification", "User 2 send message", notificationDetails);

           },

       );

      Future.delayed(const Duration(microseconds: 1500),
           (){
         notificationsPlugin.show(2, "New Notification", "User 3 send message", notificationDetails);
       },

     );
      List<String> lines=["user1","user2","user3"];
      InboxStyleInformation inboxStyleInformation=InboxStyleInformation(lines,
       contentTitle: "${lines.length}",
       summaryText: "Code Compilee",
      );

      AndroidNotificationDetails androidNotificationSpecific=AndroidNotificationDetails(

          'groupChennelId',
          'groupChennelTitle',
          groupKey: "commonMessage",
        setAsGroupSummary: true
      );

NotificationDetails platformChennelSpe=
NotificationDetails(android: androidNotificationSpecific);


notificationsPlugin.show(3, "Attention", "${lines.length} message", platformChennelSpe );




   }


   Future<void> multipleNotificationsShow1()async {

     BigPictureStyleInformation bigPictureStyleInformation=
     BigPictureStyleInformation(DrawableResourceAndroidBitmap("flutter_logo"),

         contentTitle: "content Title",
         largeIcon: DrawableResourceAndroidBitmap("flutter_logo")
     );

     AndroidNotificationDetails androidNotificationDetails  =  AndroidNotificationDetails(
         "big_picture_id",
         "big_picture_title",
         priority: Priority.high,
         importance: Importance.max,
         styleInformation: bigPictureStyleInformation
     );

     NotificationDetails notificationDetails =NotificationDetails(android: androidNotificationDetails);

     //if id
     await notificationsPlugin.show(1, "Big Picture Notification Notification", "New message", notificationDetails);

   }


}