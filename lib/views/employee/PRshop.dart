import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_project/model/Sidemenu.dart';
import 'package:flutter_application_project/views/employee/MapOS.dart';
import 'package:flutter_application_project/views/owner/MapShop.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../config/api.dart';

class PRshop extends StatefulWidget {
  PRshop({Key? key}) : super(key: key);

  @override
  State<PRshop> createState() => _PRshopState();
}

class _PRshopState extends State<PRshop> {
  int activeIndex = 0;
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
        backgroundColor: const Color.fromARGB(255, 77, 158, 88),
        title: Text('หน้าแรก'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 20, 35, 10),
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
                      options: CarouselOptions(
                          height: 250,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) => setState(
                                () => activeIndex = index,
                              )),
                      itemCount: data?.length ?? 0,
                      itemBuilder: (context, index, realIndex) {
                        final urlImage = data[index]['pr_photo'];
                        activeIndex = index;
                        return buildImage(urlImage, index);
                      },
                    )
                  : const Center(
                      child: CupertinoActivityIndicator(),
                    ),
              SizedBox(
                height: 10,
              ),
              data != null
                  ? buildIndicator(
                      activeIndex,
                      data?.length ?? 0,
                    )
                  : const Center(
                      child: CupertinoActivityIndicator(),
                    ), //
              SizedBox(
                height: 10,
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
                    child: MapShopOS(),
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
          fit: BoxFit.cover,
        ),
      );
}

Widget buildIndicator(int activeIndex, int length) => AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: length,
      effect: SwapEffect(dotWidth: 20, dotHeight: 20),
    );
