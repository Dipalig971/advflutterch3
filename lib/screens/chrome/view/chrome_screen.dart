import 'package:advflutterch3/screens/chrome/provider/chrome_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

late InAppWebViewController inAppWebViewController;
TextEditingController txtsearch = TextEditingController();

class ChromeScreen extends StatelessWidget {
  const ChromeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtsearch,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        Provider.of<ChromeProvider>(context, listen: false)
                            .onsearch(txtsearch.text);
                        inAppWebViewController.loadUrl(
                            urlRequest: URLRequest(
                                url: WebUri(
                                    'https://www.google.com/search?q=${Provider.of<ChromeProvider>(context, listen: false).search}&rlz=1C1VDKB_enIN1087IN1087&oq=flutter&gs_lcrp=EgZjaHJvbWUyDwgAEEUYORiDARixAxiABDIOCAEQRRgnGDsYgAQYigUyBggCEEUYOzIKCAMQABixAxiABDINCAQQABiDARixAxiABDIGCAUQRRg8MgYIBhBFGDwyBggHEEUYPNIBCDU0MzFqMGo3qAIIsAIB&sourceid=chrome&ie=UTF-8')));
                      },
                      icon: const Icon(Icons.search))),
            ),
          ),
        ),
      ),
      body: StreamBuilder(
        builder: (context, snapshot) {
          if (snapshot.data!.contains(ConnectivityResult.mobile) ||
              snapshot.data!.contains(ConnectivityResult.wifi)) {
            return Stack(
              children: [
                InAppWebView(
                  initialUrlRequest: URLRequest(
                      url: WebUri(
                          'https://www.google.com/search?q=${Provider.of<ChromeProvider>(context, listen: false).search}&rlz=1C1VDKB_enIN1087IN1087&oq=flutter&gs_lcrp=EgZjaHJvbWUyDwgAEEUYORiDARixAxiABDIOCAEQRRgnGDsYgAQYigUyBggCEEUYOzIKCAMQABixAxiABDINCAQQABiDARixAxiABDIGCAUQRRg8MgYIBhBFGDwyBggHEEUYPNIBCDU0MzFqMGo3qAIIsAIB&sourceid=chrome&ie=UTF-8')),
                  onWebViewCreated: (controller) {
                    inAppWebViewController = controller;
                  },
                  onProgressChanged: (controller, progress) {
                    Provider.of<ChromeProvider>(context,listen: false).progressChange(progress);
                  },
                ),
                (Provider.of<ChromeProvider>(context).progress<1)?
                Align(
                  alignment: Alignment.bottomCenter,
                  child: LinearProgressIndicator(
                    value: Provider.of<ChromeProvider>(context).progress,
                  ),
                ) : const Column()

              ],
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
                        color: Colors.black,
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
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                inAppWebViewController.goBack();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          IconButton(
              onPressed: () {
                inAppWebViewController.goForward();
              },
              icon: const Icon(Icons.arrow_forward_ios_outlined)),
          IconButton(
              onPressed: () {
                inAppWebViewController.reload();
              },
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.add_box_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        ],
      ),
    );
  }
}