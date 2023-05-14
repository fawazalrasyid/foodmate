import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../../../core/widget/journal_card.dart';
import '../../../core/widget/menu_small_card.dart';
import '../controllers/program_controller.dart';

class ProgramView extends GetView<ProgramController> {
  ProgramView({Key? key}) : super(key: key);

  @override
  ProgramController controller = Get.put(ProgramController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isProgramSelected.value
          ? DefaultTabController(
              length: 2,
              child: Scaffold(
                backgroundColor: AppColors.colorPrimary,
                body: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Image.asset(
                      "assets/images/program_ornament.png",
                      width: Get.width,
                    ),
                    SafeArea(
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          const Text(
                            "HealthyMate",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: AppValues.padding,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.tabBarColor,
                            ),
                            child: TabBar(
                              unselectedLabelColor: AppColors.tabBarTextColor,
                              labelColor: AppColors.selectedTabBarTextColor,
                              labelPadding:
                                  const EdgeInsets.fromLTRB(20, 16, 20, 16),
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color(0xff25293C),
                              ),
                              indicatorColor: AppColors.selectedTabBarColor,
                              indicatorWeight: 3,
                              tabs: const [
                                Text(
                                  "Meal Plan",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  "Riwayat",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Expanded(
                            child: TabBarView(
                              children: [
                                ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Container(
                                      width: Get.width,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: AppValues.margin,
                                      ),
                                      padding: const EdgeInsets.all(
                                        AppValues.padding,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: const Color(0xffEFF8ED),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller
                                                    .selectedProgram.value,
                                                style: const TextStyle(
                                                  color: Color(0xff030319),
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () => controller
                                                    .isProgramSelected
                                                    .value = false,
                                                child: const Text(
                                                  "Edit Program",
                                                  style: TextStyle(
                                                    color: AppColors
                                                        .textPrimaryColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 24),
                                          Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              SizedBox(
                                                height: 170,
                                                child: SfCircularChart(
                                                  centerY: '95%',
                                                  series: controller
                                                      .getSemiDoughnutSeries(),
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "${controller.userDailyJournal['calorie'] ?? 0}",
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff030319),
                                                          fontSize: 32,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const Text(
                                                        " kcal",
                                                        // textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff030319),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    "dari ${controller.dailyCalorieIntake.value.toInt()} kalori harian",
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      color: Color(0xff8f92a1),
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 24),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xfff6c8cb),
                                                      width: 1,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "${controller.userDailyJournal['carbohydrates'] ?? 0}g",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff030319),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      const Text(
                                                        "Karbohidrat",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff8f92a1),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xff9e92e9),
                                                      width: 1,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "${controller.userDailyJournal['protein'] ?? 0}g",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff030319),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      const Text(
                                                        "Protein",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff8f92a1),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xff84baff),
                                                      width: 1,
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "${controller.userDailyJournal['fat'] ?? 0}g",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff030319),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      const Text(
                                                        "Lemak",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xff8f92a1),
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Container(
                                      width: Get.width,
                                      padding: const EdgeInsets.all(16),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                        ),
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 8),
                                          const Text(
                                            "Rekomendasi Makanan",
                                            style: TextStyle(
                                              color: Color(0xff030319),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            "Berikut adalah personalisasi rekomendasi berdasarkan preferensi kamu.",
                                            style: TextStyle(
                                              color: Color(0xff8f92a1),
                                              fontSize: 14,
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: const Color(0x19fd4754),
                                            ),
                                            child: ListTileTheme(
                                              dense: true,
                                              horizontalTitleGap: 0,
                                              minLeadingWidth: 0,
                                              minVerticalPadding: 0,
                                              contentPadding: EdgeInsets.zero,
                                              child: ExpansionTile(
                                                shape: const Border(),
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Sarapan",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff25293c),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text(
                                                          "440 kcal",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xfffd4755),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                children: <Widget>[
                                                  ListView.builder(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 8,
                                                    ),
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount: controller
                                                        .foodList.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return MenuSmallCard(
                                                        name: controller
                                                                .foodList[index]
                                                            ["name"]!,
                                                        calorie: controller
                                                                .foodList[index]
                                                            ["calorie"]!,
                                                        image: controller
                                                                .foodList[index]
                                                            ["img"]!,
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: const Color(0xffd0e8ff),
                                            ),
                                            child: ListTileTheme(
                                              dense: true,
                                              horizontalTitleGap: 0,
                                              minLeadingWidth: 0,
                                              minVerticalPadding: 0,
                                              contentPadding: EdgeInsets.zero,
                                              child: ExpansionTile(
                                                shape: const Border(),
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Makan Siang",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff25293c),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text(
                                                          "440 kcal",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff1288ef),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                children: <Widget>[
                                                  ListView.builder(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 8,
                                                    ),
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount: controller
                                                        .foodList.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return MenuSmallCard(
                                                        name: controller
                                                                .foodList[index]
                                                            ["name"]!,
                                                        calorie: controller
                                                                .foodList[index]
                                                            ["calorie"]!,
                                                        image: controller
                                                                .foodList[index]
                                                            ["img"]!,
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: const Color(0x33fe8609),
                                            ),
                                            child: ListTileTheme(
                                              dense: true,
                                              horizontalTitleGap: 0,
                                              minLeadingWidth: 0,
                                              minVerticalPadding: 0,
                                              contentPadding: EdgeInsets.zero,
                                              child: ExpansionTile(
                                                shape: const Border(),
                                                title: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                      "Makan Malam",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xff25293c),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: const [
                                                        Text(
                                                          "440 kcal",
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xfffe860a),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                children: <Widget>[
                                                  ListView.builder(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 8,
                                                    ),
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount: controller
                                                        .foodList.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return MenuSmallCard(
                                                        name: controller
                                                                .foodList[index]
                                                            ["name"]!,
                                                        calorie: controller
                                                                .foodList[index]
                                                            ["calorie"]!,
                                                        image: controller
                                                                .foodList[index]
                                                            ["img"]!,
                                                      );
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          color: const Color(0xff69BE56),
                                          child: TableCalendar(
                                            firstDay:
                                                DateTime.utc(2010, 10, 16),
                                            lastDay: DateTime.utc(2030, 3, 14),
                                            focusedDay: DateTime.now(),
                                            headerVisible: false,
                                            daysOfWeekVisible: false,
                                            rowHeight: Get.height * 0.1,
                                            calendarFormat: CalendarFormat.week,
                                            calendarBuilders: CalendarBuilders(
                                              todayBuilder:
                                                  (context, datetime, events) {
                                                return Container(
                                                  width: 100,
                                                  margin: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          4, 16, 4, 16),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xffffede8),
                                                      width: 1,
                                                    ),
                                                    color:
                                                        const Color(0xfffe860a),
                                                  ),
                                                  child: Column(children: [
                                                    Text(
                                                      DateFormat("E")
                                                          .format(datetime),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      DateFormat("dd")
                                                          .format(datetime),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ]),
                                                );
                                              },
                                              defaultBuilder:
                                                  (context, datetime, events) {
                                                return Container(
                                                  width: 100,
                                                  margin: const EdgeInsets
                                                      .symmetric(horizontal: 4),
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          4, 16, 4, 16),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xffffede8),
                                                      width: 1,
                                                    ),
                                                    color:
                                                        const Color(0xfff1f3f4),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        DateFormat("E")
                                                            .format(datetime),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff979797),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Text(
                                                        DateFormat("dd")
                                                            .format(datetime),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                          color:
                                                              Color(0xff25293c),
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        controller.isLoading.value
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator())
                                            : controller
                                                    .dailyJournalList.isNotEmpty
                                                ? Container(
                                                    height: controller
                                                                .dailyJournalList
                                                                .length <
                                                            3
                                                        ? Get.height * 0.6
                                                        : null,
                                                    width: Get.width,
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(32),
                                                        topRight:
                                                            Radius.circular(32),
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(0),
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                            height: 8),
                                                        Container(
                                                          padding: const EdgeInsets
                                                                  .symmetric(
                                                              horizontal:
                                                                  AppValues
                                                                      .padding),
                                                          child:
                                                              GroupedListView<
                                                                  dynamic,
                                                                  String>(
                                                            shrinkWrap: true,
                                                            physics:
                                                                const NeverScrollableScrollPhysics(),
                                                            elements: controller
                                                                .dailyJournalList,
                                                            groupBy: (element) => DateFormat(
                                                                    'dd MMMM yyyy')
                                                                .format(DateTime
                                                                    .parse(element[
                                                                        'createdAt'])),
                                                            groupComparator: (value1,
                                                                    value2) =>
                                                                value2
                                                                    .compareTo(
                                                                        value1),
                                                            groupSeparatorBuilder:
                                                                (String value) =>
                                                                    Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  vertical:
                                                                      AppValues
                                                                          .padding),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    value,
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Color(
                                                                          0xff030319),
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "${controller.getTotalCalorie(value)} kalori",
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Color(
                                                                          0xfffe860a),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            itemBuilder:
                                                                (context,
                                                                    element) {
                                                              return JournalCard(
                                                                data: element,
                                                              );
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : const Center(
                                                    child: Text(
                                                      "Belum ada riwayat",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Scaffold(
              body: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Image.asset(
                    "assets/images/program_ornament.png",
                    width: Get.width,
                  ),
                  SafeArea(
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        const Center(
                          child: Text(
                            "HealthyMate",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textTitleColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 72),
                        GestureDetector(
                          onTap: () =>
                              controller.navigateAndRefresh("Hidup Sehat"),
                          child: Container(
                            width: Get.width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppValues.margin),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xfff4f6fb),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Hidup Sehat",
                                    style: TextStyle(
                                      color: Color(0xff030319),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      "assets/images/healthy_life.png",
                                      height: 90,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () =>
                              controller.navigateAndRefresh("Vegetarian"),
                          child: Container(
                            width: Get.width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppValues.margin),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xfff4f6fb),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Vagetarian",
                                    style: TextStyle(
                                      color: Color(0xff030319),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      "assets/images/vegetarian.png",
                                      height: 90,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () =>
                              controller.navigateAndRefresh("Diet Keto"),
                          child: Container(
                            width: Get.width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppValues.margin),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xfff4f6fb),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Diet Keto",
                                    style: TextStyle(
                                      color: Color(0xff030319),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      "assets/images/keto.png",
                                      height: 90,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () =>
                              controller.navigateAndRefresh("Diet Klasik"),
                          child: Container(
                            width: Get.width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppValues.margin),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color(0xfff4f6fb),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Diet Klasik",
                                    style: TextStyle(
                                      color: Color(0xff030319),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(
                                      "assets/images/classic.png",
                                      height: 90,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
