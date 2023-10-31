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
      QuerySnapshot words = await FirebaseFirestore.instance
          .collection('word_bank')
          .orderBy('title')
          .get();
      wordList.clear();
      words.docs.forEach((element) {
        //wordList.add(WordModel.fromJson(element.data()));
        wordList
            .add(WordModel(element['title'], element['meaning'], element.id));
        print(element.id);
      });
      //for (var word in words.docs) {
      //wordList.add(WordModel(word['title'], word['meaning'], word['id']));
      //}
      isLoading.value = false;
    } catch (e) {
      Get.snackbar("Error", '${e.toString()}');
    }
  }

  Future<void> SendData() async {
    var collection = FirebaseFirestore.instance.collection('word_bank');
    WordModel someData = WordModel('title', 'meaning', 'id');
    collection.add(someData.toJson());
  }

  Future<void> UpdateData(String docId) async {
    WordModel someData = WordModel('this is an update', 'meaning', docId);

    var collection = FirebaseFirestore.instance.collection('word_bank');
    collection
        .doc(docId) // <-- Doc ID where data should be updated.
        .update(someData.toJson());
  }
}
