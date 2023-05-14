import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../values/app_colors.dart';

class JournalCard extends StatelessWidget {
  final data;

  const JournalCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: Container(
        width: Get.width * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color(0xffe7eaf2),
            width: 1,
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data["foodName"],
                      maxLines: 1,
                      style: const TextStyle(
                        color: AppColors.textSubtitleColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      DateFormat('hh.mm')
                          .format(DateTime.parse(data["createdAt"])),
                      style: const TextStyle(
                        color: Color(0xffbdbdbd),
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/ic_fire.svg"),
                    const SizedBox(width: 4),
                    Text(
                      "${data["calorie"]} kalori",
                      style: const TextStyle(
                        color: Color(0xff3e5959),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 12,
                      width: 2,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      color: const Color(0xffF6F4F4),
                    ),
                    Text(
                      "${data["weight"] ?? 0}gr",
                      style: const TextStyle(
                        color: Color(0xff3e5959),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 6,
                          height: 34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: const Color(0xffe7eaf2),
                          ),
                          padding: const EdgeInsets.only(
                            top: 16,
                          ),
                          child: Container(
                            width: 6,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: const Color(0xffe95f67),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data["carbohydrates"]}",
                              style: const TextStyle(
                                color: Color(0xff575c55),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Text(
                              "Karbo",
                              style: TextStyle(
                                color: Color(0xff979797),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 6,
                          height: 34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: const Color(0xffe7eaf2),
                          ),
                          padding: const EdgeInsets.only(
                            top: 25,
                          ),
                          child: Container(
                            width: 6,
                            height: 9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: const Color(0xff7b6bdb),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data["protein"]}",
                              style: const TextStyle(
                                color: Color(0xff575c55),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Text(
                              "Protein",
                              style: TextStyle(
                                color: Color(0xff979797),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 6,
                          height: 34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            color: const Color(0xffe7eaf2),
                          ),
                          padding: const EdgeInsets.only(
                            top: 25,
                          ),
                          child: Container(
                            width: 6,
                            height: 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: const Color(0xff64a6ff),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data["fat"]}",
                              style: const TextStyle(
                                color: Color(0xff575c55),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Text(
                              "Lemak",
                              style: TextStyle(
                                color: Color(0xff979797),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
