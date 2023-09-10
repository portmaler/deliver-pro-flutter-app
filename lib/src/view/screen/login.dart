import 'package:dilevery/src/controller/fonctions.dart';
import 'package:dilevery/src/view/screen/dashboard.dart';
import 'package:dilevery/src/view/widget/button_login.dart';
import 'package:dilevery/src/view/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:line_icons/line_icons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool tokenvalid = false;
  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
   /*  controller.checkToken().then((val) {
      if (val == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const dashboard()),
        );
      } else {
        setState(() {
          tokenvalid = false;
        });
      }
    }).catchError((error, stackTrace) {
      print("outer: $error");
    });*/
  }

 /* Future<bool> checktoken() async {
    var token = await controller.checkToken();
    //await controller.insert();
    print(token);
    Future.delayed(const Duration(seconds: 3));
   
    return token;
  }*/

  final controller = Get.put(inzajController());
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool test1 =false;

  changeState(test) {
    setState(() {
      test1 = test;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff011842),
      body: SafeArea(
        child: tokenvalid
            ? Center(
                child: Image.asset('assets/images/logo.png', height: 200),
              )
            : SingleChildScrollView(
                child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 300,
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          margin: const EdgeInsets.only(left: 5, right: 5),
                          height: 450,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    right: 50, left: 50, top: 34),
                                child: Text('Login',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 2, 20, 36),
                                        fontSize: 40,
                                        fontFamily: 'RobotoMono',
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 50, left: 50, top: 34),

                                // child: Container(
                                //   width: 350,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(20),
                                //     border: Border.all(
                                //       color: Colors.black,
                                //       width: 1.5,
                                //       // style: BorderStyle.solid,
                                //     ),
                                //   ),
                                child: TextFieldeLynda(
                                  controller: email,
                                  type: TextInputType.emailAddress,
                                  hintText: "E-mail",
                                  icon: const Icon(Icons.email_outlined),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Veuillez entrer votre adresse e-mail';
                                    }
                                    final bool isvalid =
                                        EmailValidator.validate(email.text);
                                    if (!isvalid) {
                                      return "L'adresse électronique est  incorrectement";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 50, left: 50, top: 34, bottom: 30),
                                child: TextFieldeLynda(
                                  prefexicon: null,
                                  obscureText: !test1,
                                  hintText: "Mot de passe ",
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'mot de passe requis';
                                    }
                                    return null;
                                  },
                                  controller: password,
                                  type: TextInputType.text,
                                  icon: IconButton(
                                      icon: !test1
                                          ? const Icon(LineIcons.eye)
                                          : const Icon(
                                              Icons.visibility_off_outlined,
                                              color: Colors.black,
                                            ),
                                      onPressed: () {
                                        // logcontroller.update();

                                         setState(() {
                                        changeState(!test1);
                                         });
                                      }),
                                ),

                                //   child: Container(
                                //     width: 350,
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(20),
                                //         border: Border.all(
                                //           color: Colors.black,
                                //           width: 1.5,
                                //           // style: BorderStyle.solid,
                                //         )),
                                //     child: TextFormField(
                                //       // focusNode: FocusNode(descendantsAreFocusable: false),
                                //       controller: password,
                                //       keyboardType: TextInputType.visiblePassword,
                                //       obscureText: !test1,
                                //       decoration: InputDecoration(
                                //         enabledBorder: InputBorder.none,
                                //         hintText: 'Password',
                                //         suffixIcon: IconButton(
                                //             icon: !test1
                                //                 ? const Icon(LineIcons.eye)
                                //                 : const Icon(
                                //                     Icons.visibility_off_outlined,
                                //                     color: Colors.blue,
                                //                   ),
                                //                onPressed: () {
                                //               // logcontroller.update();

                                //               // setState(() {
                                //               changeState(!test1);
                                //               // });
                                //                }
                                // ),
                                //         focusedBorder: InputBorder.none,
                                //         prefixIcon: const Icon(Icons.lock_open),
                                //         focusColor: Colors.purple,
                                //         labelStyle: const TextStyle(
                                //             fontFamily: 'RobotoMono',
                                //             color: Colors.black,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //     ),
                                //   ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 12),
                                child: ButtonLynda(
                                  width: 120,
                                  colotBorder: const Color(0xffFEA406),
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  onPress: () {
                                    if (_formKey.currentState!.validate()) {
                                      controller.auth(
                                          context, email.text, password.text);
                                    }
                                  },
                                  colorBackground: const Color(0xffFEA406),
                                  textButton: "Se connecte",
                                  colorText: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
      ),
    );
  }
}
