import 'package:SIKOMPAK/screens/catalog/product_view.dart';
import 'package:SIKOMPAK/screens/register/register.dart';
import 'package:floating_navbar/floating_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        title: 'PT. Lintas  Sinergi Jabarindo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FloatingNavBar(
          color: Colors.green,
          pages: <Widget>[Product(), Register()],
          icons: [
            Icon(
              Icons.home,
              semanticLabel: 'Produk',
              color: Colors.white,
            ),
            Icon(
              Icons.account_circle,
              semanticLabel: 'Pendaftaran',
              color: Colors.white,
            )
          ],
        ));
  }
}
// class MyBottomNavigationBar extends StatefulWidget {
//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(icon: new Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: new Icon(Icons.note), label: "Produk"),
//           BottomNavigationBarItem(icon: new Icon(Icons.people), label: "Daftar"),
//         ],
//       ),
//     );
//   }
// }
