import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/values/app_values.dart';
import '../../../core/widget/journal_card.dart';
import '../controllers/journal_history_controller.dart';

class JournalHistoryView extends GetView<JournalHistoryController> {
  const JournalHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: const Color(0xff69BE56),
          elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              IconlyLight.arrow_left_2,
              color: Color(0xffffffff),
            ),
            splashRadius: 28,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.calendar,
                color: Color(0xffffffff),
              ),
              splashRadius: 28,
            ),
          ],
          centerTitle: true,
          title: const Text(
            "Riwayat Nutrisi",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 32),
              color: const Color(0xff69BE56),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                headerVisible: false,
                daysOfWeekVisible: false,
                rowHeight: Get.height * 0.1,
                calendarFormat: CalendarFormat.week,
                calendarBuilders: CalendarBuilders(
                  todayBuilder: (context, datetime, events) {
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.fromLTRB(4, 16, 4, 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xffffede8),
                          width: 1,
                        ),
                        color: const Color(0xfffe860a),
                      ),
                      child: Column(children: [
                        Text(
                          DateFormat("E").format(datetime),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          DateFormat("dd").format(datetime),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                    );
                  },
                  defaultBuilder: (context, datetime, events) {
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.fromLTRB(4, 16, 4, 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xffffede8),
                          width: 1,
                        ),
                        color: const Color(0xfff1f3f4),
                      ),
                      child: Column(children: [
                        Text(
                          DateFormat("E").format(datetime),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xff979797),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          DateFormat("dd").format(datetime),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xff25293c),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: Get.height * 0.7,
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
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  Center(
                    child: Container(
                      width: 48,
                      height: 8.88,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xfff2f2f2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : controller.dailyJournalList.isNotEmpty
                            ? SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppValues.padding),
                                  child: GroupedListView<dynamic, String>(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    elements: controller.dailyJournalList,
                                    groupBy: (element) =>
                                        DateFormat('dd MMMM yyyy').format(
                                            DateTime.parse(
                                                element['createdAt'])),
                                    groupComparator: (value1, value2) =>
                                        value2.compareTo(value1),
                                    groupSeparatorBuilder: (String value) =>
                                        Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: AppValues.padding),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            value,
                                            style: const TextStyle(
                                              color: Color(0xff030319),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Text(
                                            "${controller.getTotalCalorie(value)} kalori",
                                            style: const TextStyle(
                                              color: Color(0xfffe860a),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    itemBuilder: (context, element) {
                                      return JournalCard(
                                        data: element,
                                      );
                                    },
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "Belum ada riwayat",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff030319),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
