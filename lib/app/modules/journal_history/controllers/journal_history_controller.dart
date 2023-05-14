import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class JournalHistoryController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;

  final isLoading = false.obs;

  final journalList = [].obs;
  final dailyJournalList = [].obs;

  @override
  void onInit() {
    user = auth.currentUser;
    getUserDailyjournal();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getUserDailyjournal() async {
    isLoading.value = true;

    final usersRef = FirebaseFirestore.instance.collection('users');

    final journalData =
        await usersRef.doc(user!.uid).collection("dailyjournal").get();
    journalList.value = journalData.docs.map((doc) => doc.data()).toList();

    var dailyJournal = [];
    var maxItem = journalList.length >= 7 ? 7 : 0;
    for (var i = (journalList.length - 1); i >= maxItem; i--) {
      final dailyJournalData = await usersRef
          .doc(user!.uid)
          .collection("dailyjournal")
          .doc(journalList[i]["date"])
          .collection("data")
          .get();
      dailyJournal
          .addAll(dailyJournalData.docs.map((doc) => doc.data()).toList());
    }

    dailyJournalList.addAll(dailyJournal);

    isLoading.value = false;
  }

  getTotalCalorie(String date) {
    for (var i = 0; i < journalList.length; i++) {
      var x = DateFormat('dd MMMM yyyy')
          .format(DateTime.parse(journalList[i]["createdAt"]));
      if (x == date) {
        return journalList[i]["calorie"];
      }
    }

    return "0";
  }
}
