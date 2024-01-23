// ignore_for_file: unnecessary_overrides

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class FormMobilController extends GetxController {
  TextEditingController namaMobilC = TextEditingController();
  var namaMobilFormKey = GlobalKey<FormState>().obs;
  TextEditingController merekC = TextEditingController();
  var merekFormKey = GlobalKey<FormState>().obs;
  TextEditingController noPolisiC = TextEditingController();
  var noPolisiFormKey = GlobalKey<FormState>().obs;
  TextEditingController hargaPerHariC = TextEditingController();
  var hargaPerHariFormKey = GlobalKey<FormState>().obs;
  TextEditingController tipeBahanBakarC = TextEditingController();
  var tipeBahanBakarFormKey = GlobalKey<FormState>().obs;
  TextEditingController tahunC = TextEditingController();
  var tahunFormKey = GlobalKey<FormState>().obs;

  final normalValidator =
      MultiValidator([RequiredValidator(errorText: "Kolom harus diisi")]);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> tambahDataMobil(String namaMobil, String merek, String noPolisi,
      String hargaPerHari, String tipeBahanBakar, String tahun) async {
    try {
      var dataMobilReference = firestore.collection('DataMobil');
      final docRef = dataMobilReference.doc();
      final checkData = await docRef.get();

      if (checkData.exists == false) {
        await docRef.set({
          'id': docRef.id,
          'namaMobil': namaMobil,
          'merek': merek,
          'noPolisi': noPolisi,
          'hargaPerHari': hargaPerHari,
          'tipeBahanBakar': tipeBahanBakar,
          'tahun': tahun,
        });

        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Data berhasil ditambahkan.",
          textConfirm: 'Ya',
          onConfirm: () {
            Get.back();
            Get.back();
          },
        );
      } else {
        Get.snackbar("Error", "Data sudah ada!");
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.snackbar("Error", "Data tidak berhasil ditambahkan.");
    }
  }

  Future<void> editDataMobil(
      String id,
      String namaMobil,
      String merek,
      String noPolisi,
      String hargaPerHari,
      String tipeBahanBakar,
      String tahun) async {
    try {
      var dataMobilReference = firestore.collection('DataMobil');
      final docRef = dataMobilReference.doc(id);

      await docRef.update({
        'id': docRef.id,
        'namaMobil': namaMobil,
        'merek': merek,
        'noPolisi': noPolisi,
        'hargaPerHari': hargaPerHari,
        'tipeBahanBakar': tipeBahanBakar,
        'tahun': tahun,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Data berhasil diubah.",
        textConfirm: 'Ya',
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.snackbar("Error", "Data tidak berhasil ditambahkan.");
    }
  }

  Future<void> hapusDataMobil(
    String id,
  ) async {
    try {
      await firestore.collection('DataMobil').doc(id).delete();

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Data berhasil dihapus.",
        textConfirm: 'Ya',
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Get.snackbar("Error", "Data tidak berhasil ditambahkan.");
    }
  }

  @override
  void onInit() {
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
}
