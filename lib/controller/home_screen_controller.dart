import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getxfirebasecrud/model/base_model.dart';

class HomeScreenController extends GetxController {
  var isLoading = false.obs;
  var wordList = <WordModel>[].obs;
  var isEditing = false.obs;
  var cardHeight = 100.0.obs;
  Future<void> getData() async {
    try {
      QuerySnapshot words = await
      FirebaseFirestore.instance.collection('word_bank').orderBy('title').get();
      wordList.clear();
      for (var word in words.docs) {
        wordList.add(WordModel(word['title'], word['meaning'], word['id']));
      }
      isLoading.value = false;
    }
    catch (e) {
      Get.snackbar("Error", '${e.toString()}');
    }
  }
}