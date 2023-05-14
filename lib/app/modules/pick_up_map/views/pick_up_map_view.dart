import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconly/iconly.dart';

import '../../../core/values/app_values.dart';
import '../controllers/pick_up_map_controller.dart';

class PickUpMapView extends GetView<PickUpMapController> {
  const PickUpMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(IconlyLight.arrow_left_2),
            splashRadius: 28,
          ),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            !controller.isLoading.value
                ? SizedBox(
                    height: Get.height,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: controller.userPosition,
                      onMapCreated: (GoogleMapController ctrl) {
                        controller.mapsCtrl.complete(ctrl);
                      },
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
            Container(
              // height: Get.height * 0.45,
              width: Get.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(AppValues.padding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Center(
                        child: Container(
                          width: 48,
                          height: 8.88,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Color(0xfff2f2f2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lagi Dijalan",
                            style: TextStyle(
                              color: Color(0xff05161b),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Color(0xffe7eaf2),
                                width: 1,
                              ),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.watch_later_outlined,
                                    color: Color(0xfff87447),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "10 Min",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff030319),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: 334,
                        height: 30,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 106,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Color(0xff1ec0ce),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Container(
                                      width: 106,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Color(0xffe0e0e0),
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Container(
                                      width: 106,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: Color(0xffe0e0e0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 9,
                              top: 0,
                              child: Text(
                                "Permintaan",
                                style: TextStyle(
                                  color: Color(0xff1ec0ce),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Dijalan",
                                  style: TextStyle(
                                    color: Color(0xff969899),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 261,
                              top: 0,
                              child: Text(
                                "Diambil",
                                style: TextStyle(
                                  color: Color(0xff969899),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                child: SvgPicture.asset(
                                  'assets/images/avatar.svg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Abdulmalik Qasim ",
                                    style: TextStyle(
                                      color: Color(0xff05161b),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "Pickup Hero",
                                    style: TextStyle(
                                      color: Color(0xff969899),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 16),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xfff4f6fb),
                                ),
                                child: Icon(IconlyBold.message),
                              ),
                              SizedBox(width: 16),
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xfff4f6fb),
                                ),
                                child: Icon(IconlyBold.call),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xffff314a),
                                width: 3,
                              ),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pengolah Sampah",
                                style: TextStyle(
                                  color: Color(0xff969899),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Bank Sampah Hijau Selaras Mandiri",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Color(0xff05161b),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 23,
                            child: Icon(
                              Icons.location_on,
                              color: Color(0xff1ec0ce),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lokasimu",
                                style: TextStyle(
                                  color: Color(0xff969899),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "${controller.currentAddress}",
                                maxLines: 1,
                                style: TextStyle(
                                  color: Color(0xff05161b),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
