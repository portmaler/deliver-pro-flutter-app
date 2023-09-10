import 'package:dilevery/src/controller/fonctions.dart';
import 'package:dilevery/src/model/cardsLeads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shiped extends StatefulWidget {
  const Shiped({super.key});

  @override
  State<Shiped> createState() => _ShipedState();
}

class _ShipedState extends State<Shiped> {
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
              itemCount: controller.List2.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardsLeads(
                    lead: controller.List2[index],
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
