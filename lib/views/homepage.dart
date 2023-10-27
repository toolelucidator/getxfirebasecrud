import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:getxfirebasecrud/controller/home_screen_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        initState: (_) {},
        builder: (homeScreenController) {
          homeScreenController.getData();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow,
              title: Text("Firebase TEST"),
            ),
            body: Center(
              child: homeScreenController.isLoading.value == true
                  ? CircularProgressIndicator()
                  : Obx(()=>
                    ListView.separated(
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Card(
                              color: Colors.deepOrangeAccent.shade100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(homeScreenController
                                          .wordList[index].title),
                                      Text(homeScreenController
                                          .wordList[index].meaning),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, index) {
                          return Divider(thickness: 2, color: Colors.black);},
                        itemCount: homeScreenController.wordList.value.length),
                  ),
            ),
          );
        });
  }
}
