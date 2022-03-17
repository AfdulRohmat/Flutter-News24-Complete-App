import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constants/constan_color.dart';
import '../../widgets/default_text.dart';

class BookmarkPageController extends GetxController {
  // INSTANCE FIRESTORE
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // REALTIME READ DATA
  Stream<QuerySnapshot<Object?>> getDataRealtime() {
    CollectionReference articles = firestore.collection('articles');

    return articles.orderBy("time", descending: true).snapshots();
  }

  // DELETE ALL DATA FROM FIRESTORE
  Future<void> deleteALLDataFromFirestore() async {
    try {
      var articles = await firestore.collection('articles').get();

      for (var doc in articles.docs) {
        await doc.reference.delete();
      }

      //
    } catch (e) {
      print(e);
    }
  }

  // DELETE PARTICULAR DATA FROM FIRESTORE
  Future<void> deleteDataFromFirestore(docsIdParam) async {
    DocumentReference documentReferenceData =
        firestore.collection('articles').doc(docsIdParam);

    try {
      await documentReferenceData.delete();

      Get.defaultDialog(
        title: 'Succeed',
        titleStyle: TextStyle(
          color: cBlack,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        middleText: 'Article Successfully removed from Bookmarks',
        middleTextStyle: TextStyle(
          color: cGrey,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        backgroundColor: cWhite,
        radius: 10,
        actions: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(30, 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              primary: cWhite,
              onPrimary: cBlack,
              elevation: 0,
            ),
            child: DefaultText(
              text: 'Ok',
              fontSize: 14,
              textColor: cBlack,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    } catch (e) {
      print(e);
    }
  }
}
