import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dilevery/src/controller/fonctions.dart';
import 'package:dilevery/src/model/cardsLeads.dart';

class AllLeads extends StatefulWidget {
  const AllLeads({super.key});

  @override
  State<AllLeads> createState() => _AllLeadsState();
}

class _AllLeadsState extends State<AllLeads> {
  final controller = Get.put(inzajController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(Duration(seconds: 2));
              controller.insert();
            },
            child: ListView.builder(
              itemCount: controller.ListAll.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardsLeads(
                    lead: controller.ListAll[index],
                    color: Colors.pink,
                    colorname: const Color(0xFF822685),
                  ),
                );
              },
            ),
          )),
    );
  }
}
