import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/Sidemenu.dart';
import 'package:flutter_application_project/views/owner/MapShop.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../config/api.dart';

class PRshop extends StatefulWidget {
  PRshop({Key? key}) : super(key: key);

  @override
  State<PRshop> createState() => _PRshopState();
}

class _PRshopState extends State<PRshop> {
  dynamic data;
  void initState() {
    super.initState();
    startApi();
  }

  startApi() async {
    var item = await getPR();
    setState(() {
      data = item;
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('หน้าแรก'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
          child: Column(
            children: [
              Text(
                'ประชาสัมพันธ์',
                style: TextStyle(
                  color: Color.fromARGB(255, 28, 122, 255),
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              data != null
                  ? CarouselSlider.builder(
                      options: CarouselOptions(height: 250),
                      itemCount: data?.length ?? 0,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = data[index]['pr_photo'];

                        return buildImage(urlImage, index);
                      },
                    )
                  : Text('0'),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) => MapShop()));
                      },
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Icon(Icons.business_sharp),
                          // ignore: prefer_const_constructors
                          SizedBox(
                            width: 20,
                          ),
                          const Text('ที่อยู่ของร้าน',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 40),
                        primary: Color.fromARGB(255, 28, 122, 255),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 350,
                    child: MapShop(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: SideMenu(),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image(
          image: NetworkImage(urlImage),
        ),
      );
}
