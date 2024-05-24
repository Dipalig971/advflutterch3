import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

late InAppWebViewController inAppWebViewController;
TextEditingController txtsearch = TextEditingController();

class ChromeScreen extends StatelessWidget {
  const ChromeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom:PreferredSize(preferredSize: Size.fromHeight(20), child: Row(
          children: [
            IconButton(onPressed: () {
              
            }, icon: Icon(Icons.arrow_back_ios))
          ],
        )) ,
      ),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.data!.contains(ConnectivityResult.mobile) ||
              snapshot.data!.contains(ConnectivityResult.wifi)) {
            return InAppWebView(
              initialUrlRequest: URLRequest(
                  url: WebUri(
                      'https://www.google.com/search?q=flutter&rlz=1C1VDKB_enIN1087IN1087&oq=flutter&gs_lcrp=EgZjaHJvbWUyDwgAEEUYORiDARixAxiABDIOCAEQRRgnGDsYgAQYigUyBggCEEUYOzIKCAMQABixAxiABDINCAQQABiDARixAxiABDIGCAUQRRg8MgYIBhBFGDwyBggHEEUYPNIBCDU0MzFqMGo3qAIIsAIB&sourceid=chrome&ie=UTF-8')),
              onProgressChanged: (controller, progress) {},
              onWebViewCreated: (controller) {
                inAppWebViewController = controller;
              },
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 50, left: 90),
                  child: Image(image: AssetImage('assets/image/network.png')),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 80),
                  child: Text(
                    'Whoops!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 80),
                  child: Text(
                    'No Internet Connection Found \n Check Your Connection',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80, top: 50),
                  child: Container(
                    height: 60,
                    width: 180,
                    decoration: BoxDecoration(
                        color: const Color(0xffFE3D6A),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Try Again',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
        stream: Connectivity().onConnectivityChanged,
      ),
    );
  }
}
