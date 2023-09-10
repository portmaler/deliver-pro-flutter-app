// ignore: file_names
// ignore_for_file: avoid_unnecessary_containers
import 'package:dilevery/core/responsive.dart';
import 'package:dilevery/src/model/lead.dart';
import 'package:dilevery/src/view/widget/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

SizeConfig size = SizeConfig();

class CardsLeads extends StatelessWidget {
  final color;
  final colorname;
  final Lead lead;

  const CardsLeads({
    super.key,
    required this.color,
    required this.colorname,
    required this.lead,
  });
  @override
  Widget build(BuildContext context) {
    size.init(context);
    return Container(
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.8,
          //closeThreshold: 0.1,
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StatusView(
                            lead: lead,
                            tracking: lead.tracking.toString(),
                            city: lead.city.toString(),
                            products: lead.products!,
                            name: lead.name.toString(),
                            address: lead.address.toString(),
                            phone: lead.phone.toString(),
                            phone2: lead.phone2.toString(),
                            prix: lead.price.toString(),
                            status_livrison: lead.statusLivrison.toString(),
                          )),
                );
              }),
              backgroundColor: Colors.orange,
              icon: Icons.autorenew,
              label: "Change State",

              //borderRadius: BorderRadius.circular(9),
            ),
          ],
        ),

        // The end action pane is the one at the right or the bottom side.
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          dragDismissible: true,
          //openThreshold: 0.5,

          extentRatio: 0.3,
          children: [
            /*
            SlidableActionModel(
                border: -10,
                title: 'Call',
                image: 'assets/images/delivred.png',
                color: Colors.black45),*/
            SlidableAction(
              onPressed: ((context) {}),
              backgroundColor: Colors.blue,
              icon: Icons.call,
              label: "Call",
            )
          ],
        ),
        child: Stack(
          children: [
            Container(
              // margin: const EdgeInsets.only(bottom: 30),
              //  padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              // width: 300,
              // height: 150,
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(color: Colors.grey, blurRadius: 2
                      // spreadRadius: 1,
                      )
                ],

                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${lead.name}',
                          style: GoogleFonts.poppins().copyWith(
                              color: const Color(0xff011842), fontSize: 23),
                        ),
                        Container(
                            height: 35,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 2),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                              color: Color(0xffefc394),
                            ),
                            child: Center(
                              child: Text(
                                "№  : ${lead.tracking}",
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Adress : ${lead.address}',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      'City : ${lead.city}',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Phone : ${lead.phone}',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Price : ${lead.phone2}',
                      style: GoogleFonts.poppins(
                          color: Colors.black, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "${lead.statusLivrison}",
                        style: GoogleFonts.poppins(
                            decoration: TextDecoration.underline,
                            color: const Color(0xff011842),
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   child: Container(
            //     padding: const EdgeInsets.only(left: 2),
            //     height: 35,
            //     width: 190,
            //     color: const Color(0xffefc394),
            //     child: Text.rich(
            //       TextSpan(
            //         children: [
            //         TextSpan(
            //             text: "Addresse :",
            //             style: GoogleFonts.poppins(
            //               color: const Color(0xff011842),
            //             )),
            //         TextSpan(
            //           text: "$address ",
            //           style: GoogleFonts.poppins(
            //               color: Colors.black,
            //               fontWeight: FontWeight.bold,
            //               fontSize: 12),
            //         )
            //       ]),
            //     ),
            //   ),
            // ),

            Positioned(
              top: 80,
              left: 200,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Price :",
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    TextSpan(
                      text: "${lead.price} Dh",
                      style: GoogleFonts.poppins(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

        // Container(
        //   // margin: const EdgeInsets.only(bottom: 30),
        //   padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        //   // width: 300,
        //   // height: 150,
        //   decoration: const BoxDecoration(
        //     color: Colors.white,
        //   ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         name,
        //         style: TextStyle(
        //             color: colorname,
        //             fontSize: 23,
        //             fontWeight: FontWeight.w700),
        //       ),
        //       const SizedBox(
        //         height: 7,
        //       ),
        //       Text('Product : $products_name' ),
        //       const SizedBox(
        //         height: 7,
        //       ),
        //       Text('Référence :$tracking ' ),
        //       const SizedBox(
        //         height: 7,
        //       ),
        //           Text('City : $city' ),
        //       const SizedBox(
        //         height: 7,
        //       ),
        //       Text('Address : $address' ),
        //       const SizedBox(
        //         height: 7,
        //       ),
        //       Text('Phone1 : $phone'),
        //       const SizedBox(
        //         height: 7,
        //       ),
        //       Text('Phone2 :$phone2 ' ),
        //       const SizedBox(
        //         height: 7,
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //                Text('Prix : ' "$prix Dh"),
        //           Text(
        //             status_livrison,
        //             style: TextStyle(
        //                 fontSize: 15,
        //                 fontWeight: FontWeight.bold,
        //                 color: color),
        //           )
        //         ],
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
