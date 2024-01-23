import 'package:az_travel/app/modules/form_mobil/controllers/form_mobil_controller.dart';
import 'package:az_travel/app/routes/app_pages.dart';
import 'package:az_travel/app/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:sizer/sizer.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final c = Get.put(DashboardController());
    final formDataMobilC = Get.put(FormMobilController());
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: 2.5.w, left: 2.5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Data Mobil'),
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.FORM_MOBIL, arguments: ['create']);
                },
                icon: const Icon(PhosphorIconsBold.listPlus),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.FORM_MOBIL, arguments: ['create']);
        },
        child: const Icon(PhosphorIconsBold.listPlus),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            StreamBuilder(
              stream: c.firestoreDataMobilList,
              builder: (context, snap) {
                if (!snap.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final dataMobilList = snap.data!;
                if (dataMobilList.isEmpty) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('Data kosong.'),
                      ),
                    ],
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.only(
                    top: 0.1.h,
                  ),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dataMobilList.length,
                  itemBuilder: (context, index) {
                    var dataMobil = dataMobilList[index];
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: 2.h, right: 5.w, left: 5.w),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.FORM_MOBIL,
                              arguments: ['update', dataMobil]);
                        },
                        child: Container(
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${dataMobil.namaMobil}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('${dataMobil.merek}'),
                                    Text('${dataMobil.noPolisi}'),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      '${dataMobil.tipeBahanBakar}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.defaultDialog(
                                          title: "Peringatan",
                                          middleText:
                                              "Apakah anda yakin untuk menghapus data?",
                                          textConfirm: 'Ya',
                                          textCancel: 'Tidak',
                                          onConfirm: () {
                                            formDataMobilC
                                                .hapusDataMobil(dataMobil.id!);
                                            Get.back();
                                            Get.back();
                                          },
                                          onCancel: () {
                                            Get.back();
                                            Get.back();
                                          },
                                        );
                                      },
                                      icon: Icon(PhosphorIconsBold.trash),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                        'Tahun Kendaraan : ${dataMobil.tahun}'),
                                    Text(
                                        'Harga/Hari : Rp. ${dataMobil.hargaPerHari}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
