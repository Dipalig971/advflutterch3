import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'modal/color_list.dart';

class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff3B4964),
        body: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.data!.contains(ConnectivityResult.mobile) ||
                snapshot.data!.contains(ConnectivityResult.wifi)) {
              return CustomScrollView(
                slivers: [
                  const SliverAppBar(
                    backgroundColor: Color(0xff3B4964),
                    expandedHeight: 160,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Service App'),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => ColorContanier(
                        ColorList[index]['color'],
                      ),
                      childCount: ColorList.length,
                    ),
                  )
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
                      )),
                    ),
                  ),
                ],
              );
            }
          },
          stream: Connectivity().onConnectivityChanged,
        ),);
  }
}

Widget ColorContanier(Color color) {
  return Container(
    height: 150,
    width: 200,
    decoration: BoxDecoration(color: color),
  );
}
