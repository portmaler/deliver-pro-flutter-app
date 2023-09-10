// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:dilevery/core/responsive.dart';
import 'package:dilevery/src/controller/fonctions.dart';
import 'package:dilevery/src/model/lead.dart';
import 'package:dilevery/src/model/product.dart';
import 'package:dilevery/src/view/widget/button_login.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

class StatusView extends StatefulWidget {
  final Lead lead;
  final String city;
  final String tracking;
  final List<Product> products;
  final String name;
  final String address;
  final String phone;
  final String phone2;
  final String prix;
  final String status_livrison;

  const StatusView(
      {super.key,
      required this.lead,
      required this.tracking,
      required this.city,
      required this.products,
      required this.name,
      required this.address,
      required this.phone,
      required this.phone2,
      required this.prix,
      required this.status_livrison});

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  SizeConfig size = SizeConfig();
  final controller = Get.put(inzajController());
  TextEditingController _textFieldController = TextEditingController();
  var t = false;
  TabController? controllers;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // controllers.List1.clear();
    // controllers.List3.clear();
    // controllers.List4.clear();
    // controllers.List5.clear();
    // controllers.List7.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heightsize = MediaQuery.of(context).size.height;
    size.init(context);
    return Scaffold(
      backgroundColor: const Color(0xffEDF5F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEF5F9),
        foregroundColor: const Color(0xff011842),
        title: Text(
          'Change Status',
          style: GoogleFonts.poppins(
              color: const Color(0xff011842), fontSize: SizeConfig.H * 3.5),
        ),
        elevation: 1,
        centerTitle: true,
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          launch("tel://${widget.phone}");
        },
        child: Container(
          height: 50,
          margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
          decoration: BoxDecoration(
            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
            color: const Color(0xff011842),
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              color: const Color(0xff011842),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.phone,
                color: Colors.white,
              ),
              AutoSizeText(
                "Call Clients",
                maxLines: 1,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 12, top: 12),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Client :  ",
                          style: GoogleFonts.poppins(
                              color: const Color(0xff011842),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        TextSpan(
                          text: widget.name,
                          //                             ",
                          style: GoogleFonts.poppins(
                              color: const Color(0xffefc394),
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  height: 35,
                  width: 150,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 5),
                    color: const Color(0xffefc394),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Tracking Num : ",
                            style: GoogleFonts.poppins(
                                color: const Color(0xff011842),
                                fontWeight: FontWeight.w700,
                                fontSize: 12),
                          ),
                          TextSpan(
                            text: widget.tracking,
                            //                             ",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8))),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 12, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "City : ",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff011842),
                                    // fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                              TextSpan(
                                text: widget.city,
                                //                             ",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xff011842),
                          thickness: 2,
                          height: 15,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Products  : ",
                                    style: GoogleFonts.poppins(
                                        color: const Color(0xff011842),
                                        // fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (() => showModalBottomSheet<void>(
                                    // context and builder are
                                    // required properties in this widget
                                    context: context,
                                    isScrollControlled: true,

                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(30),
                                    )),
                                    builder: (context) =>
                                        DraggableScrollableSheet(
                                      initialChildSize: 0.7,
                                      //maxChildSize: 0.8,
                                      //minChildSize: 0.32,
                                      expand: false,
                                      builder: (context, scrollController) {
                                        return SingleChildScrollView(
                                          // controller: scrollController,
                                          child: Container(
                                            height: heightsize * 0.8,
                                            child: ListView.builder(
                                              scrollDirection: Axis.vertical,
                                              itemCount: widget.products.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      Container(
                                                height: 350,
                                                padding: EdgeInsets.all(15),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text.rich(
                                                          TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    "Product name  :  ",
                                                                style: GoogleFonts.poppins(
                                                                    color: const Color(
                                                                        0xffefc394),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    "${widget.lead.products![index].name}",

                                                                //                             ",
                                                                style: GoogleFonts.poppins(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        18),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text.rich(
                                                          TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    "Quantity  :  ",
                                                                style: GoogleFonts.poppins(
                                                                    color: const Color(
                                                                        0xffefc394),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    "${widget.lead.products![index].quantity}",
                                                                //                             ",
                                                                style: GoogleFonts.poppins(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        18),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text.rich(
                                                          TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    "Price  :  ",
                                                                style: GoogleFonts.poppins(
                                                                    color: const Color(
                                                                        0xffefc394),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        18),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    "${widget.lead.products![index].price}",
                                                                //                             ",
                                                                style: GoogleFonts.poppins(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    fontSize:
                                                                        18),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Container(
                                                        height: 200,
                                                        child: Image.network(
                                                            '${widget.lead.products![index].image}'),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    // we set up a container inside which
                                    // we create center column and display text

                                    // Returning SizedBox instead of a Container
                                  )),
                              child: Text(
                                "View All",
                                style:
                                    GoogleFonts.poppins(color: Colors.orange),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xff011842),
                          thickness: 2,
                          height: 15,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Phone : ",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff011842),
                                    // fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                              TextSpan(
                                text: widget.phone,
                                //                             ",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xff011842),
                          thickness: 2,
                          height: 15,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Adesse  : ",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff011842),
                                    // fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                              TextSpan(
                                text: widget.address,
                                //                             ",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          color: Color(0xff011842),
                          thickness: 2,
                          height: 15,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "State of Command  : ",
                                style: GoogleFonts.poppins(
                                    color: const Color(0xff011842),
                                    // fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              ),
                              TextSpan(
                                text: widget.status_livrison,
                                //                             ",
                                style: GoogleFonts.poppins(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  bottom: 0,
                  height: 35,
                  width: 150,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 5),
                    // color: const Color(0xffefc394),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 3)
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      border: Border.all(
                        color: const Color(0xff011842),
                        width: 1,
                      ),
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Totale Price: ",
                            style: GoogleFonts.poppins(
                                color: const Color(0xff011842), fontSize: 15),
                          ),
                          TextSpan(
                            text: widget.prix,
                            //                             ",
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ButtonLynda(
              coloshadow: Colors.grey,
              margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
              width: double.infinity,
              colotBorder: const Color(0xffefc394),
              mainAxisAlignment: MainAxisAlignment.center,
              onPress: () {
                _displayTextInputDialog(context, "delivered", widget.tracking);
              },
              colorBackground: const Color(0xffefc394),
              textButton: "Delivered",
              colorText: Colors.white,
            ),
            Wrap(
              children: [
                ButtonLynda(
                  coloshadow: Colors.grey,
                  margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
                  width: 130,
                  colotBorder: const Color(0xff79b29f),
                  mainAxisAlignment: MainAxisAlignment.center,
                  onPress: () {
                    _displayTextInputDialog(
                        context, 'shipped', widget.tracking);
                  },
                  colorBackground: const Color(0xff79b29f),
                  textButton: "Shipped",
                  colorText: Colors.white,
                ),
                ButtonLynda(
                  coloshadow: Colors.grey,
                  margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
                  width: 130,
                  colotBorder: const Color(0xffc1b29d),
                  mainAxisAlignment: MainAxisAlignment.center,
                  onPress: () {
                    _displayTextInputDialog(
                        context, 'returned', widget.tracking);
                  },
                  colorBackground: const Color(0xffc1b29d),
                  textButton: "Returned",
                  colorText: Colors.white,
                ),
              ],
            ),
            Wrap(
              children: [
                ButtonLynda(
                  coloshadow: Colors.grey,
                  margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
                  width: 130,
                  colotBorder: const Color(0xff99afc7),
                  mainAxisAlignment: MainAxisAlignment.center,
                  onPress: () {
                    _displayTextInputDialog(
                        context, 'canceled', widget.tracking);
                  },
                  colorBackground: const Color(0xff99afc7),
                  textButton: "Canceled",
                  colorText: Colors.white,
                ),
                ButtonLynda(
                  coloshadow: Colors.grey,
                  margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
                  width: 130,
                  colotBorder: const Color(0xffc19cc7),
                  mainAxisAlignment: MainAxisAlignment.center,
                  onPress: () async {
                    _displayTextInputDialog(
                        context, 'no answer', widget.tracking);
                  },
                  colorBackground: const Color(0xffc19cc7),
                  textButton: "No Answer",
                  colorText: Colors.white,
                ),
              ],
            ),
            // ButtonLynda(
            //    coloshadow: Colors.grey,
            //   margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
            //   width: double.infinity,
            //   colotBorder: const Color(0xffefc394),
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   onPress: () {},
            //   colorBackground: const Color(0xffefc394),
            //   textButton: "",
            //   colorText: Colors.white,
            // ),
          ],
        ),
      ),
    );

    // Scaffold(
    //     // appBar: AppBar(),

    //     appBar: AppBar(

    //       backgroundColor: const Color(0xFFEEF5F9),
    //       title: Text(
    //         "Change status",
    //         style: TextStyle(color: Colors.black, fontSize: SizeConfig.H * 4),
    //       ),
    //       centerTitle: true,
    //       elevation: 0.5,
    //     ),

    //     // backgroundColor: Colors.white,
    //     body: Container(
    //       decoration: const BoxDecoration(
    //           color: Colors.white38,
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       width: double.infinity,
    //       height: double.infinity,
    //       child: SingleChildScrollView(
    //         child: Stack(
    //           children: [
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.only(
    //                     top: 35.22,
    //                     left: 20,
    //                     right: 20,
    //                   ),
    //                   child: Row(
    //                     children: [
    //                       AutoSizeText(
    //                         "Tracking :  ",
    //                         maxLines: 1,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: SizeConfig.W * 6),
    //                       ),
    //                       AutoSizeText(
    //                         widget.tracking,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontSize: SizeConfig.W * 5),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding:
    //                       const EdgeInsets.only(top: 8.13, right: 20, left: 20),
    //                   child: Row(
    //                     // ignore: prefer_const_literals_to_create_immutables
    //                     children: [
    //                       AutoSizeText(
    //                         "Product name :  ",
    //                         maxLines: 1,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: SizeConfig.W * 6),
    //                       ),
    //                       AutoSizeText(
    //                         widget.products_name,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontSize: SizeConfig.W * 5),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding:
    //                       const EdgeInsets.only(top: 8.13, right: 20, left: 20),
    //                   child: Row(
    //                     // ignore: prefer_const_literals_to_create_immutables
    //                     children: [
    //                       AutoSizeText(
    //                         "Product quantity :  ",
    //                         maxLines: 1,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: SizeConfig.W * 6),
    //                       ),
    //                       AutoSizeText(
    //                         widget.products_qt,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontSize: SizeConfig.W * 5),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding:
    //                       const EdgeInsets.only(top: 8.13, right: 20, left: 20),
    //                   child: Row(
    //                     // ignore: prefer_const_literals_to_create_immutables
    //                     children: [
    //                       AutoSizeText(
    //                               "Name :  ",
    //                         maxLines: 1,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: SizeConfig.W * 6),
    //                       ),
    //                       AutoSizeText(
    //                         widget.name,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontSize: SizeConfig.W * 5),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding:
    //                       const EdgeInsets.only(top: 8.13, right: 20, left: 20),
    //                   child: Row(
    //                     children: [
    //                       AutoSizeText(
    //                         "Address :  ",
    //                         maxLines: 1,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: SizeConfig.W * 6),
    //                       ),
    //                       AutoSizeText(
    //                         widget.prix,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontSize: SizeConfig.W * 5),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding:
    //                       const EdgeInsets.only(top: 8.13, right: 20, left: 20),
    //                   child: Row(
    //                     children: [
    //                       AutoSizeText(
    //                         "Phone 1 :  ",
    //                         maxLines: 1,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: SizeConfig.W * 6),
    //                       ),
    //                       AutoSizeText(
    //                         widget.phone,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontSize: SizeConfig.W * 5),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding:
    //                       const EdgeInsets.only(top: 8.13, right: 20, left: 20),
    //                   child: Row(
    //                     children: [
    //                       AutoSizeText(
    //                         "Phone 2 :  ",
    //                         maxLines: 1,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: SizeConfig.W * 6),
    //                       ),
    //                       AutoSizeText(
    //                         widget.phone2,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontSize: SizeConfig.W * 5),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding:
    //                       const EdgeInsets.only(top: 8.13, right: 20, left: 20),
    //                   child: Row(
    //                     children: [
    //                       AutoSizeText(
    //                         "Lead Value :  ",
    //                         maxLines: 1,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: SizeConfig.W * 6),
    //                       ),
    //                       AutoSizeText(
    //                         widget.prix,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontSize: SizeConfig.W * 5),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding:
    //                       const EdgeInsets.only(top: 8.13, right: 20, left: 20),
    //                   child: Row(
    //                     children: [
    //                       AutoSizeText(
    //                         "Status Delivred :  ",
    //                         maxLines: 1,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: SizeConfig.W * 6),
    //                       ),
    //                       AutoSizeText(
    //                         widget.status_livrison,
    //                         style: TextStyle(
    //                             fontFamily: 'Jannat',
    //                             fontSize: SizeConfig.W * 5),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.only(
    //                     top: 31,
    //                     left: 20,
    //                     right: 20,
    //                   ),
    //                   child: Row(
    //                     children: [
    //                       AutoSizeText(
    //                         "Changé l’état :  ",
    //                         maxLines: 1,
    //                         style: TextStyle(
    //                           fontFamily: 'Jannat',
    //                           fontSize: SizeConfig.W * 6,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.only(
    //                       left: SizeConfig.W * 1,
    //                       top: SizeConfig.H * 2,
    //                       right: SizeConfig.W * 1),
    //                   child: MaterialButton(
    //                     height: SizeConfig.H * 6,
    //                     color: Colors.green,
    //                     //     color: Helper.getColorFromHex("#E77A13"),
    //                     minWidth: 353,
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(4.0),
    //                     ),
    //                     onPressed: () {
    //                       // controller.changeStatus(
    //                       //     widget.ref, "delivered", context);
    //                       _displayTextInputDialog(
    //                           context, "delivered", widget.tracking);
    //                       // insert();

    //                       // _displayTextInputDialog(
    //                       //     context, 'status', 'auth', 'id_leads');
    //                     },
    //                     child: AutoSizeText(
    //                       "Delivered",
    //                       maxLines: 1,
    //                       style: TextStyle(
    //                         color: Colors.white,
    //                         fontFamily: 'Jannat',
    //                         fontSize: 14,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.only(
    //                       left: SizeConfig.W * 1,
    //                       top: SizeConfig.H * 2,
    //                       right: SizeConfig.W * 1),
    //                   child: MaterialButton(
    //                     height: SizeConfig.H * 6,
    //                     color: Colors.red,
    //                     //     color: Helper.getColorFromHex("#E77A13"),
    //                     minWidth: 353,
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(4.0),
    //                     ),
    //                     onPressed: () {
    //                       // controller.changeStatus(
    //                       //     widget.ref, "returned", context);
    //                       _displayTextInputDialog(
    //                           context, 'returned', widget.tracking);
    //                       // insert();
    //                     },
    //                     child: AutoSizeText(
    //                       "Return",
    //                       maxLines: 1,
    //                       style: TextStyle(
    //                         fontFamily: 'Jannat',
    //                         color: Colors.white,
    //                         fontSize: 14,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.only(
    //                       left: SizeConfig.W * 1,
    //                       top: SizeConfig.H * 2,
    //                       right: SizeConfig.W * 1),
    //                   child: MaterialButton(
    //                     height: SizeConfig.H * 6,
    //                     color: Colors.redAccent,
    //                     //     color: Helper.getColorFromHex("#E77A13"),
    //                     minWidth: 353,
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(4.0),
    //                     ),
    //                     onPressed: () {
    //                       // controller.changeStatus(
    //                       //     widget.ref, "not delivered", context);
    //                       _displayTextInputDialog(
    //                           context, 'not delivered', widget.tracking);
    //                       // insert();

    //                       // _displayTextInputDialog(
    //                       //     context, 'status', 'auth', 'id_leads');
    //                     },
    //                     child: AutoSizeText(
    //                       "Not Delivered",
    //                       maxLines: 1,
    //                       style: TextStyle(
    //                         fontFamily: 'Jannat',
    //                         color: Colors.white,
    //                         fontSize: 14,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.only(
    //                       left: SizeConfig.W * 1,
    //                       top: SizeConfig.H * 2,
    //                       right: SizeConfig.W * 1),
    //                   child: MaterialButton(
    //                     height: SizeConfig.H * 6,
    //                     color: Colors.pink,
    //                     //     color: Helper.getColorFromHex("#E77A13"),
    //                     minWidth: 353,
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(4.0),
    //                     ),
    //                     onPressed: () {
    //                       // controller.changeStatus(
    //                       //     widget.ref, "canceled", context);
    //                       _displayTextInputDialog(
    //                           context, 'canceled', widget.tracking);
    //                       // insert();

    //                       // _displayTextInputDialog(
    //                       //     context, 'status', 'auth', 'id_leads');
    //                     },
    //                     child: AutoSizeText(
    //                       "Canceled",
    //                       maxLines: 1,
    //                       style: TextStyle(
    //                         color: Colors.white,
    //                         fontFamily: 'Jannat',
    //                         fontSize: 14,
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.only(
    //                       left: SizeConfig.W * 1,
    //                       top: SizeConfig.H * 2,
    //                       right: SizeConfig.W * 1),
    //                   child: MaterialButton(
    //                     height: 60,
    //                     onPressed: () {},
    //                     color: Color.fromARGB(255, 153, 7, 186),
    //                     textColor: Colors.white,
    //                     child: Padding(
    //                       padding: EdgeInsets.all(8.0),
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           const Icon(Icons.phone),
    //                           const SizedBox(
    //                             width: 0,
    //                           ),
    //                           AutoSizeText(
    //                             "Appeler Clients",
    //                             maxLines: 1,
    //                             style: TextStyle(
    //                               fontFamily: 'Jannat',
    //                               fontSize: 10,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ));
  }

  Future<void> _displayTextInputDialog(
      BuildContext context, String status, String idLead) async {
    return status == "delivered"
        ? controller.changeStatus(idLead, status, context, '')
        : showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Raison', style: GoogleFonts.poppins()),
                content: TextField(
                  onChanged: (value) {
                    setState(() {
                      if (value.length == 0) {
                        t = false;
                      } else
                        t = true;
                    });
                  },
                  controller: _textFieldController,
                  decoration: InputDecoration(
                      hintText: "Why ?${widget.tracking}",
                      hintStyle: GoogleFonts.poppins()),
                ),
                actions: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        child: MaterialButton(
                          color: Colors.orange,
                          textColor: Colors.white,
                          child: const Text('OK'),
                          onPressed: () async {
                            final snackBar = SnackBar(
                              duration: const Duration(seconds: 3),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              content: Text(
                                "Please add text!",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                              elevation: 1,
                              backgroundColor: Colors.red,
                            );
                            // codeDialog = valueText;
                            t == true
                                ? controller.changeStatus(idLead, status,
                                    context, _textFieldController.text)
                                : ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                            ;
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              );
            });
  }
}
