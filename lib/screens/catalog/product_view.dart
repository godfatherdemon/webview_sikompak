import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Product extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductPageState();
  }
}

class _ProductPageState extends State<Product> {
  var imgList = "assets/images/head-pop.png";
  var titleList = "Itoh Suharto";
  var descList = "Direktur Utama";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PT. Lintas  Sinergi Jabarindo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(
                //   'assets/images/head.png',
                //   fit: BoxFit.contain,
                //   height: 32,
                // ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/head.png',
                    fit: BoxFit.contain,
                    height: 32,
                  ),
                  onPressed: () {
                    showDialogFunc(context, imgList, titleList, descList);
                  },
                ),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('SIKOMPAK - PT. Lintas Sinergi Jabarindo'))
              ],
            ),
          ),
          body: WebView(
            initialUrl: 'https://produk.lintasjabarindo.com/',
            javascriptMode: JavascriptMode.unrestricted,
            // sslConnection: SslConnection.unsecured,
          ),
        ));
  }
}

// onReceivedServerTrustAuthRequest: (controller, challenge) async {
//   return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
// }

showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.9),
            ),
            padding: EdgeInsets.all(15),
            height: 640,
            width: MediaQuery.of(context).size.width * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(55),
                  child: Image.asset(
                    img,
                    width: 480,
                    height: 480,
                  ),
                ),
                // ClipOval(
                //   child: Image.asset(
                //     img,
                //     height: 200,
                //     width: 200,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white70,
                          fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
