import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dilevery/src/controller/fonctions.dart';
import 'package:dilevery/src/model/cardsLeads.dart';

class Returned extends StatefulWidget {
  const Returned({super.key});

  @override
  State<Returned> createState() => _ReturnedState();
}

class _ReturnedState extends State<Returned> {
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
              itemCount: controller.List4.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardsLeads(
                    lead: controller.List4[index],
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
