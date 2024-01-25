import 'package:az_travel/app/data/models/datamobilmodel.dart';
import 'package:az_travel/app/utils/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

import '../controllers/form_mobil_controller.dart';

class FormMobilView extends GetView<FormMobilController> {
  const FormMobilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FormMobilController());
    final updateStatus = Get.arguments[0];
    final updateData =
        updateStatus == 'update' ? Get.arguments[1] as DataMobilModel : null;

    if (updateStatus == 'update') {
      controller.namaMobilC.text = updateData!.namaMobil!;
      controller.merekC.text = updateData.merek!;
      controller.noPolisiC.text = updateData.noPolisi!;
      controller.hargaPerHariC.text = updateData.hargaPerHari!;
      controller.tipeBahanBakarC.text = updateData.tipeBahanBakar!;
      controller.tahunC.text = updateData.tahun!;
    } else if (updateStatus == 'create') {
      controller.namaMobilC.text = '';
      controller.merekC.text = '';
      controller.noPolisiC.text = '';
      controller.hargaPerHariC.text = '';
      controller.tipeBahanBakarC.text = '';
      controller.tahunC.text = '';
    }

    return Scaffold(
      appBar: AppBar(
        title:
            Text("${updateStatus == 'update' ? 'Ubah' : 'Tambah'} Data Mobil"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 6.w, left: 6.w, top: 2.h),
              child: Column(
                children: [
                  formInput(
                    key: controller.namaMobilFormKey.value,
                    textEditingController: controller.namaMobilC,
                    hintText: 'Nama Mobil',
                    iconPrefix: PhosphorIconsBold.car,
                    keyboardType: TextInputType.name,
                    validator: controller.normalValidator,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  formInput(
                    key: controller.merekFormKey.value,
                    textEditingController: controller.merekC,
                    hintText: 'Merek',
                    iconPrefix: PhosphorIconsBold.brandy,
                    keyboardType: TextInputType.name,
                    validator: controller.normalValidator,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  formInput(
                    key: controller.noPolisiFormKey.value,
                    textEditingController: controller.noPolisiC,
                    hintText: 'Nomor Polisi',
                    iconPrefix: PhosphorIconsBold.numberCircleFour,
                    keyboardType: TextInputType.text,
                    validator: controller.normalValidator,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  formInput(
                    key: controller.hargaPerHariFormKey.value,
                    textEditingController: controller.hargaPerHariC,
                    hintText: 'Harga per Hari',
                    iconPrefix: PhosphorIconsBold.currencyDollarSimple,
                    keyboardType: TextInputType.number,
                    validator: controller.normalValidator,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  formInput(
                    key: controller.tipeBahanBakarFormKey.value,
                    textEditingController: controller.tipeBahanBakarC,
                    hintText: 'Tipe Bahan Bakar',
                    iconPrefix: PhosphorIconsBold.engine,
                    keyboardType: TextInputType.name,
                    validator: controller.normalValidator,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  formInput(
                    key: controller.tahunFormKey.value,
                    textEditingController: controller.tahunC,
                    hintText: 'Tahun Mobil',
                    iconPrefix: PhosphorIconsBold.calendar,
                    keyboardType: TextInputType.number,
                    validator: controller.normalValidator,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.namaMobilFormKey.value.currentState!
                        .validate() &&
                    controller.merekFormKey.value.currentState!.validate() &&
                    controller.noPolisiFormKey.value.currentState!.validate() &&
                    controller.hargaPerHariFormKey.value.currentState!
                        .validate() &&
                    controller.tipeBahanBakarFormKey.value.currentState!
                        .validate() &&
                    controller.tahunFormKey.value.currentState!.validate()) {
                  if (updateStatus == 'update') {
                    controller.editDataMobil(
                      updateData!.id!,
                      controller.namaMobilC.text,
                      controller.merekC.text,
                      controller.noPolisiC.text,
                      controller.hargaPerHariC.text,
                      controller.tipeBahanBakarC.text,
                      controller.tahunC.text,
                    );
                  } else {
                    controller.tambahDataMobil(
                      controller.namaMobilC.text,
                      controller.merekC.text,
                      controller.noPolisiC.text,
                      controller.hargaPerHariC.text,
                      controller.tipeBahanBakarC.text,
                      controller.tahunC.text,
                    );
                  }
                }
              },
              child: const Text('Kirim'),
            )
          ],
        ),
      ),
    );
  }
}
