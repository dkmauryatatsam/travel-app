import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_travel_app_ui/colors.dart';
import 'package:flutter_travel_app_ui/constant.dart';
import 'package:flutter_travel_app_ui/hot_destination_detail.dart';
import 'package:flutter_travel_app_ui/style.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        width: Get.width - 80,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColor.darkSecondaryColor,
                AppColor.darkSecondaryColor
              ],
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.home,
                color: Colors.white38,
              ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.place,
                color: AppColor.primaryColor,
              ),
            ),
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.person,
                color: Colors.white38,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColor.secondaryColor, AppColor.tertiaryColor],
        )),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            customAppBar(),
            SizedBox(
                height: 180,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: destination.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                      child: destinationCard(
                          context, destination[index]['imagePath']!),
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, bottom: 25, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  TextStyleWidget(
                    title: "Hot Destination",
                    size: 24,
                  ),
                  TextStyleWidget(
                    color: Colors.white38,
                    title: "More",
                    size: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: hotDestination.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 25 : 0),
                      child: hotDestinationCard(
                          context,
                          hotDestination[index]['imagePath']!,
                          hotDestination[index]['placeName']!,
                          hotDestination[index]['placeCount']!),
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, bottom: 25, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  TextStyleWidget(
                    title: "Visiters Reviews",
                    size: 18,
                  ),
                  TextStyleWidget(
                    color: Colors.white38,
                    title: "22 Reviews",
                    size: 16,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                bottom: 60,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/man.jpeg'),
                    radius: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: Get.width - 110,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            TextStyleWidget(
                              title: "Arjun Anni",
                              size: 14,
                            ),
                            TextStyleWidget(
                              title: "Jan 25",
                              size: 12,
                              color: Colors.white38,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextStyleWidget(
                          title:
                              "jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki.",
                          size: 12,
                          color: Colors.white38,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Stack destinationCard(BuildContext context, String imagePath) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: Get.width - 60,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            height: 200,
            width: Get.width - 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [AppColor.secondaryColor, Colors.transparent],
                )),
          ),
        )
      ],
    );
  }
}

Widget hotDestinationCard(BuildContext context, String imagePath,
    String placeName, String placeCount) {
  return GestureDetector(
    onTap: () {
      Get.to(DestinationDetail(imagePath));
    },
    child: Stack(
      children: [
        Container(
          height: 180,
          width: 140,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            height: 200,
            width: 140,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [AppColor.secondaryColor, Colors.transparent],
                )),
          ),
        ),
        Positioned(
          left: 25,
          bottom: 25,
          child: Column(
            children: [
              TextStyleWidget(
                title: placeName,
                size: 14,
              ),
              const SizedBox(
                height: 5,
              ),
              TextStyleWidget(
                title: placeCount,
                size: 10,
                color: Colors.white54,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Padding customAppBar() {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        TextStyleWidget(
          fontWeight: FontWeight.w700,
          title: "Destination",
          size: 32,
        ),
        RawMaterialButton(
          elevation: 2.0,
          onPressed: null,
          fillColor: Colors.white30,
          shape: CircleBorder(),
          padding: EdgeInsets.all(8),
          child: Icon(
            Icons.search,
            color: AppColor.primaryColor,
          ),
        )
      ],
    ),
  );
}
