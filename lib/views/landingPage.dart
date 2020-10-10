import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:team7_app/views/caregivers/ClientList.dart';
import 'package:team7_app/views/clientList.dart';
import 'package:team7_app/views/login.dart';

// bool logined = false;
// bool isManager = false;

// Future<int> f() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   FirebaseAuth.instance.setPersistence(Persistence.NONE);
//   FirebaseAuth.instance.signOut();
//   User u = FirebaseAuth.instance.currentUser;
//   if (u == null) return 0;
// FirebaseAuth.instance.authStateChanges().listen((User user) {
//   u = user;
//   if (user == null) {
//     logined = false;
//   } else {
//     logined = true;
//   }
// });

//   String email = u.email;
//   DocumentSnapshot ds = await FirebaseFirestore.instance
//       .collection("serviceWorker")
//       .doc(email)
//       .get();
//   if (ds.exists) {
//     return 1;
//   } else {
//     return 2;
//   }
// }

// class LandingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: logined == false
//           ? '/login'
//           : isManager == true
//               ? "/manager"
//               : "/profile",
//       routes: {
//         '/login': (context) => LoginForm(),
//         '/profile': (context) => CareGiverClientListPage(),
//         "/manager": (context) => ClientList(),
//       },
//     );

// class LandingPage extends StatefulWidget {
//   @override
//   _MyState createState() => _MyState();
// }

// class _MyState extends State<LandingPage> {
//   bool isNull = false;
//   bool isManager = false;
//   bool isCaregiver = false;

//   @override
//   void initState() {
//     User u;
//     FirebaseAuth.instance
//       .authStateChanges()
//       .listen((User user) {
//         if (user == null) {
//           isNull = true;
//         } else {
//           u = user;
//         }
//       });

//     DocumentSnapshot ds = await FirebaseFirestore.instance
//         .collection("serviceWorker")
//         .doc(email)
//         .get();
//         }
//   }
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.signOut();
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return LoginForm();
          }

          if (isManager(user)) {
            return ClientList();
          } else {
            return CareGiverClientListPage();
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  bool isManager(User user) {
    if (user.email.substring(0, 1) == "1") {
      return false;
    }
    return true;
  }
}

// static Widget f(User user) {
//   String email = user.email;
//   DocumentSnapshot ds = await FirebaseFirestore.instance
//       .collection("serviceWorker")
//       .doc(email)
//       .get();
//   if (ds.exists) {
//     return ClientList();
//   } else {
//     return CareGiverClientListPage();
//   }
// }
