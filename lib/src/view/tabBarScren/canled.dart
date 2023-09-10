import 'package:dilevery/src/controller/fonctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dilevery/src/model/cardsLeads.dart';

class Canled extends StatefulWidget {
  const Canled({super.key});

  @override
  State<Canled> createState() => _CanledState();
}

class _CanledState extends State<Canled> {
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
              itemCount: controller.List5.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardsLeads(
                    lead: controller.List5[index],
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
