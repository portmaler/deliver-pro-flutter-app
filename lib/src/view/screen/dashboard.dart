// ignore_for_file: camel_case_types
import 'package:dilevery/src/controller/bottom_bar.dart';
import 'package:dilevery/src/controller/fonctions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../widget/bottom_nav.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  final controller = Get.put(inzajController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarController screenindexcontroller = Get.find();
    return SafeArea(
      child: Obx(() => Scaffold(
        bottomNavigationBar: BottomNav(),
        body: screens[screenindexcontroller.fetchCurrentScreenIndex.value],
        floatingActionButton: screenindexcontroller.fetchCurrentScreenIndex.value == 0
            ? FloatingActionButton.extended(
                onPressed: () {
                  // Add your onPressed code here!
                },
                label: Text(
                  'There are ${controller.List3.length} leads waitting for you!',
                  style: GoogleFonts.poppins(),
                ),
                icon: const Icon(Icons.search),
                backgroundColor: const Color(0xff011842),
              )
            : const SizedBox(),
      ),),
    );
  }
}
