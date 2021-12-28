
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http_requests/Dio/DioClient.dart';
import 'package:http_requests/Dio/google_signin_api.dart';
import 'package:http_requests/Models/UserModel.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late Future data;

  // Future getData() async {
  //   var data;
  //   String url = 'https://jsonplaceholder.typicode.com/posts';
  //   Services services = Services(url);
  //   data = services.fetchData();
  //   // print(data);
  //   return data;
  // }
  User? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _client.getUser(id: '1');
    // data = getData();
    // print(data);
  }

  // GoogleSignInAccount? user0 = null;

  final DioClient _client = DioClient();
  int pageNo = 1;
  int total = 419;
  bool signedIn = false;
  var cookie = "";
  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  // Initialization of variables for notifications
  // late final FirebaseMessaging messaging;
  // late int
  // _recievedNotificationCounter; //For counting the number of notifications we've recieved

  // Model calling
  // PushNotification? notificationInfo;

  // Registering Notification
  // void registerNotification() async {
  //   // Initialization of firebase app
  //   await Firebase.initializeApp();

  //   // Instance for firebase messaging
  //   messaging = FirebaseMessaging.instance;

  //   // There are three types of state in notification
  //   // 1. state for permission of sending the notiffication is not determinded i.e. (Null)
  //   // 2. Granted i.e. (True)
  //   // 3. Declined i.e. (False)

  //   // Creating notification setting
  //   NotificationSettings setting = await messaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     provisional: false,
  //     sound: true,
  //   );

  //   // Checking whether the user has granted the permission or not
  //   if (setting.authorizationStatus == AuthorizationStatus.authorized) {
  //     print("User has granted the permission");

  //     // Send main message
  //     FirebaseMessaging.onMessage.listen((message) {
  //       print("In listening");
  //       // Sving the paticualar message to our push notification model

  //       PushNotification notification = PushNotification(
  //         title: message.notification!.title,
  //         body: message.notification!.body,
  //         dataTitle: message.data['title'],
  //         dataBody: message.data['body'],
  //       );

  //       setState(() {
  //         _recievedNotificationCounter++;
  //         notificationInfo = notification;
  //       });

  //       if (notification != null) {
  //         print("Got message");
  //         showSimpleNotification(
  //           Text(notificationInfo!.title.toString()),
  //           leading: NotificationBadge(
  //               totalNotification: _recievedNotificationCounter),
  //           subtitle: Text(notificationInfo!.body.toString()),
  //           background: Colors.cyan,
  //           duration: Duration(seconds: 2),
  //         );
  //       }
  //     });
  //   }
  //   print("I'm here");
  // }

  // pages = total/20;
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
            appBar: AppBar(
              title: Text("Push Notification"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Flutter Push Notification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  // Showing the notificatin bagde which will count the total No.of notificattion we recieve
                  // NotificationBadge(totalNotification: _recievedNotificationCounter),

                  // If notificationInfo is not null
                  // notificationInfo != null
                  // ? Column(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         "TITLE: ${notificationInfo!.dataTitle ?? notificationInfo!.title}",
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 9,
                  //       ),
                  //       Text(
                  //         "BODY: ${notificationInfo!.dataBody ?? notificationInfo!.body}",
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ],
                  //   )
                  // : Container()
                ],
              ),
            ),
          )

          // Scaffold(
          //   appBar: AppBar(
          //     title: Text("HTTP Requests"),
          //   ),
          //   body: Container(
          //     width: double.infinity,
          //     child: Column(
          //       children: [
          //         Text("Sign in with"),
          //         ElevatedButton(
          //           onPressed: signIn,
          //           child: Text("Sign in with google"),
          //         ),
          //         ElevatedButton(
          //           onPressed: signOut,
          //           child: Text("Check Cookie"),
          //         ),
          //         signedIn ? Text("Logged in") : Text("Logged Out"),
          //       ],
          //     ),
          //   ),
          // ),
          ),
    );
  }

  Future signIn() async {
    // var request = new HttpRequest();
    // print("In Signin");
    // request.open('GET', '/dev.roombae.com/res-auth/google');
    // request.withCredentials = true;
    // request.setRequestHeader('name', 'value');
    // request.onLoad.listen((event) => {request.setRequestHeader(name, value)});
    // request.send();
    // var response = await
    // https: //securetoken.googleapis.com/v1/token?key=[API_KEY]
    final userGoogle = await GoogleSignInApi.login();
    // final someUser = userGoogle;

    // if (userGoogle == null) {
    //   print("Something went wrong");
    //   // ScaffoldMessenger.of(context)
    //   //     .showSnackBar(SnackBar(content: Text("Sign in Failed")));
    // } else {
    //   // print("Token ${someUser!.id}");
    //   // getCookie();
    //   print(userGoogle);
    //   setState(() {
    //     signedIn = true;
    //   });

    // getCookie("token");
    // headers['tokenId'] = userGoogle.authentication.toString();
    // print(userGoogle.authentication);

    //   // Navigator.of(context).pushReplacement(
    //   //     MaterialPageRoute(builder: (context) => LoggedInPage()));
    //   print("Welcome ${userGoogle.displayName}");
    //   print("${userGoogle.authHeaders}");
    //   // ScaffoldMessenger.of(context).showSnackBar(
    //   //     SnackBar(content: Text("Welcome ${userGoogle.displayName}")));
    // }
  }
}

getCookie() async {
  // print("Token = " + toString());
  var response = await http.post(
      Uri.parse(
        'https://roombae.com/api/authentication/rest-auth/google/',
      ),
      headers: {
        "tokenId":
            "eyJhbGciOiJSUzI1NiIsImtpZCI6ImJiZDJhYzdjNGM1ZWI4YWRjOGVlZmZiYzhmNWEyZGQ2Y2Y3NTQ1ZTQiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXpwIjoiNTc4NzU3NzMzNTI3LWZxMWowbW81dGJrNmI1Mm1ydDFpaDZxcmR0dDc3ZDh2LmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiYXVkIjoiNTc4NzU3NzMzNTI3LWZxMWowbW81dGJrNmI1Mm1ydDFpaDZxcmR0dDc3ZDh2LmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwic3ViIjoiMTA3Nzc1NjExMjI4ODgwMTA2MTQwIiwiZW1haWwiOiJtb2hkc2FsbWFucDg2NkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXRfaGFzaCI6Im4wYzRjQ0tYY1FqSTl3NVRacVNmMEEiLCJuYW1lIjoiTW9oZC5TYWxtYW4gUGF0ZWwiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUFUWEFKenpBNkE0dXdXeVNNa2t3bTFlTExCaG9OcjR2RHd4elJRUDFXX0I3QT1zOTYtYyIsImdpdmVuX25hbWUiOiJNb2hkLlNhbG1hbiIsImZhbWlseV9uYW1lIjoiUGF0ZWwiLCJsb2NhbGUiOiJlbiIsImlhdCI6MTYzNDk2MjU2MSwiZXhwIjoxNjM0OTY2MTYxLCJqdGkiOiJlY2JmMWM1YWI0MzBmYTEyZmQ1YTA3ZjA1ODhjZjY1MzA0ODg4ZTg0In0.BQUnf_FTpoCVOTTts669vKYdDGkNUjOLz17GFt1nz36JPicDrJgVL22nrYbuvchRN6DuuQeHzc978m0iM-dtpQMbUCY5gmePS9zXDfc2vYRflyr1WpPDgu11TaJEQVF7ZJcreSroIOdc0A61wNgEqUF4GxWffOFahNz1EVXG5OY-BNMX-3XNhu0V_mQlMkH0PZalu2FzbvYqXGoe0XIex0kNmXtu2QhTxxKiWj7ZXJFVOrYotFtIUl2xtVSrMJYXcYNTBTixCga2s2ie_NWVUxyNlkzd9nmyUWD0roO4-KMXOKEef-V8iJnSfzwgjvfaS2FclXUfK4VmghkDqK8vSw"
      });
  // var cookie = response.headers['set-cookie'];
  // headers['cookie'] = cookie!;
  // if (response.headers.isNotEmpty) {
  //   print("Cookie Value ${cookie}");
  //   headers['set-cookie'] = cookie;
  // }

  // print("Status Code: ${response.statusCode}");
  // print(response.headers);
  // setState(() {
  //   signedIn = true;
  // });
}

Future signOut() async {
  // print(headers);
  // http.Response response = await http.get(
  //   // Uri.parse('http://dev.roombae.com/test-cookie-exists-one'),
  //   // headers: headers
  //   Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
  //   // {
  //   //   'Set-Cookie': cookie,
  //   // 'Content-type': 'application/json',
  //   // 'Accept': 'application/json',
  //   // HttpHeaders.setCookieHeader: cookie,
  //   // // HttpHeaders.cookieHeader: cookie,
  //   // HttpHeaders.contentTypeHeader: 'application/json',
  //   // },
  // );
  // print(response.body);
  // // var response = await http
  //     .post(Uri.parse('http://dev.roombae.com/rest-auth/google/', body: {}));
  // if(response)
  final userGoogle = await GoogleSignInApi.logout();
  if (userGoogle == null) {
    // setState(() {
    //   signedIn = false;
    // });
    // print("Welcome ${userGoogle!.displayName}");
  }
}

// class Services {
//   final String url;

//   Services(this.url);

//   Future fetchData() async {
//     print("$url");
//     Response response = await get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       // OK
//       return jsonEncode(response.body);
//     } else {
//       print(response.statusCode);
//     }
//   }
// }
