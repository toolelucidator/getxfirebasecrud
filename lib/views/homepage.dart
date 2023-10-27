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
                  : Obx(
                      () => ListView.separated(
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Obx(
                                  () => SizedBox(
                                    height:
                                        homeScreenController.cardHeight.value,
                                    width: double.infinity,
                                    child: Card(
                                      color: Colors.deepOrangeAccent.shade100,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text(homeScreenController
                                                  .wordList[index].title, style: TextStyle(fontSize: 24),),
                                              Text(homeScreenController
                                                  .wordList[index].meaning,style: TextStyle(fontSize: 24)),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Visibility(
                                            visible: homeScreenController
                                                .isEditing.value,
                                            child: const Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Expanded(
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "Update Title"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Expanded(
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                          hintText:
                                                              "Update Meaning"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  // homeScreenController.deleteData(
                                                  //     homeScreenController
                                                  //         .wordList[index].id);
                                                },
                                                icon: const Icon(Icons.delete),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  homeScreenController.isEditing
                                                      .toggle();
                                                  homeScreenController
                                                          .cardHeight.value =
                                                      homeScreenController
                                                              .isEditing.value
                                                          ? 150
                                                          : 100;

                                                  print(homeScreenController
                                                      .isEditing.value);
                                                  // homeScreenController.updateData(
                                                  //     homeScreenController
                                                  //         .wordList[index].id);
                                                },
                                                icon: const Icon(Icons.update),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                          },
                          separatorBuilder: (BuildContext context, index) {
                            return const Divider(
                                thickness: 2, color: Colors.black);
                          },
                          itemCount:
                              homeScreenController.wordList.value.length),
                    ),
            ),
          );
        });
  }
}
