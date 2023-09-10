import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dilevery/core/constants.dart';
import 'package:dilevery/src/controller/connectionManager.dart';
import 'package:dilevery/src/model/lead.dart';
import 'package:dilevery/src/view/screen/dashboard.dart';
import 'package:dilevery/src/view/screen/login.dart';
import 'package:dilevery/src/view/widget/state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class inzajController extends GetxController {
  NetworkController networkController = Get.find<NetworkController>();

  RxList<Lead> List1 = <Lead>[].obs;
  RxList<Lead> List2 = <Lead>[].obs;
  RxList<Lead> List3 = <Lead>[].obs;
  RxList<Lead> List4 = <Lead>[].obs;
  RxList<Lead> List5 = <Lead>[].obs;
  RxList<Lead> List6 = <Lead>[].obs;
  RxList<Lead> ListAll = <Lead>[].obs;
  RxList<Lead> List8 = <Lead>[].obs;
  RxList dataDashboard = [0, 0, 0, 0, 0, 0].obs;

  insert() async {
    var token = storage.read('token');
    final response = await http.get(
      Uri.parse('http://192.168.1.13:8000/api/leads'),
      // Send authorization headers to the backend.
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        // 'state': 'ready to ship'
        // 'state': 'shipped'
        // 'state': 'shipped'
        'state': 'all'
      },
    );
    var res = jsonDecode(response.body);
    //  print(res);

    var value = res['data'];
    List1.clear();
    List2.clear();
    List3.clear();
    List4.clear();
    List5.clear();
    List6.clear();
    ListAll.clear();

    for (int i = 0; i < res['data'].length; i++) {
      ListAll.add(Lead.fromJson(value[i]));
      if (res['data'][i]['status_livrison'] == 'delivered') {
        List1.add(Lead.fromJson(value[i]));
      } else if (res['data'][i]['status_livrison'] == 'shipped') {
        List2.add(Lead.fromJson(value[i]));
      } else if (res['data'][i]['status_livrison'] == 'ready to ship') {
        List3.add(Lead.fromJson(value[i]));
      } else if (res['data'][i]['status_livrison'] == 'returned') {
        print(res['data'][i]['products'].length);
        List4.add(Lead.fromJson(value[i]));
      } else if (res['data'][i]['status_livrison'] == 'canceled') {
        List5.add(Lead.fromJson(value[i]));
      } else if (res['data'][i]['status_livrison'] == 'not delivered') {
        List6.add(Lead.fromJson(value[i]));
      }
    }
  }

  changeStatus(ref, status, context, str) async {
    var token = storage.read('token');

    final response = await http
        .post(Uri.parse('https://mobile.palace-agency.com/api/lead'), headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      'reference': ref.toString(),
      'state': status,
      'text': str
    });

    print(response.statusCode);
    print(status);
    print(str);
    print(ref);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => dashboard()),
      );
    }
  }

  profile(email, password, phone, context) async {
    var token = storage.read('token');

    final response = await http.post(
        Uri.parse('https://mobile.palace-agency.com/api/updatuser'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'phone': phone,
          'email': email,
          'password': password
        });

    storage.write('email', email);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const dashboard()),
    );
  }

  disconnect(context) {
    storage.remove('token');
    storage.remove('id_user');
    storage.remove('email');
    storage.remove('name');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  void auth(context, email, password) async {
    var url = Uri.https('http://192.168.1.13:8000', '/api/user');
    var response =
        await http.post(url, body: {'email': email, 'password': password});

    var res = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201 /*just remove this in production*/ || 1 == 1) {
      storage.write('id_user', res['user']['id']);
      storage.write('token', res['token']);
      storage.write('email', res['user']['email']);
      storage.write('name', res['user']['name']);
      storage.write('phone', res['user']['phone']);

      dashboardData(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const dashboard()),
      );
      final snackBar = SnackBar(
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: Text(
          "Information Saved",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: Text(
          "invalid account",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        elevation: 1,
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<bool> checkToken() async {
    var token = storage.read('token');
    var id = storage.read('id_user');
    bool isvalid = true;
    var response = null;
    print(token);
    if (networkController.connectionType == 0) {
      await Future.delayed(
        const Duration(seconds: 3),
      );
      return false;
    }
    try {
      await Future.delayed(const Duration(seconds: 3));

      var url = Uri.https('http://192.168.1.13:8000', '/api/isconnected');
      response = await http.post(url, headers: {
        'Authorization': 'Bearer $token',
      }, body: {
        'token': token,
        'id_user': id.toString(),
      });
    } on TimeoutException catch (e) {
      isvalid = false;
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      isvalid = false;
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error detected: $e');
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      isvalid = true;
    } else {
      isvalid = false;
    }
    return isvalid;
  }

  void dashboardData(
    context,
  ) async {
    var token = storage.read('token');
    final response = await http.get(
      Uri.parse('http://192.168.1.13:8000/api/dashboard'),
      // Send authorization headers to the backend.
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    var res = jsonDecode(response.body);
    print(res);
    if (response.statusCode == 201 || response.statusCode == 200) {
      dataDashboard.clear();

      for (int i = 0; i < res.length; i++) {
        dataDashboard.add(res[i]['total']);
      }
    }
  }

  scanner(ref, context) {
    {
      
      var t = 1;
      for (int i = 0; i < ListAll.length; i++) {
        if (ListAll[i].tracking == ref.toString()) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StatusView(
                      lead: ListAll[i],
                      tracking: ListAll[i].tracking!,
                      city: ListAll[i].city!,
                      products: ListAll[i].products!,
                      name: ListAll[i].name!,
                      address: ListAll[i].address!,
                      phone: ListAll[i].phone!,
                      phone2: ListAll[i].phone2!,
                      prix: ListAll[i].price.toString(),
                      status_livrison: ListAll[i].statusLivrison!,
                    )),
          );
          t = 0;
          //
        }
      }
      //
      if (t == 1)
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('leads not founded'),
            content: Text('can\'t find leds with reference ${ref}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                },
                child: const Text('ok'),
              ),
            ],
          ),
        );
    }
  }

  scanner2(ref, context) async {
    {
      var t = 1;
      for (int i = 0; i < List3.length; i++) {
        print(List3[i].tracking);
        if (List3[i].tracking == ref.toString()) {
          _displayTextScanAssign(context, ref);
          t = 0;
          //
        }
      }

      /*if (t == 1)
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('leads not founded'),
            content: Text('can\'t find leds with reference ${ref}'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                },
                child: const Text('ok'),
              ),
            ],
          ),
        );*/
    }
  }

  Future<void> _displayTextScanAssign(BuildContext context, String ref) async {
    TextEditingController _textFieldController = TextEditingController();
    var text = RichText(
      text: TextSpan(
        // Note: Styles for TextSpans must be explicitly defined.
        // Child text spans will inherit styles from parent
        style: const TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: "The lead with tracking num: "),
          TextSpan(
              text: ' ${ref} ',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
            text: "is now assinged to you!",
          ),
        ],
      ),
    );
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: text,
            actions: <Widget>[
              MaterialButton(
                color: Colors.orange,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  // codeDialog = valueText;
                  changeStatus(
                      ref, 'shipped', context, _textFieldController.text);
                  // Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Future<void> _displayTextInputDialog(BuildContext context, String ref) async {
    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Raison'),
            content: TextField(
              onChanged: (value) {},
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "...."),
            ),
            actions: <Widget>[
              MaterialButton(
                color: Colors.orange,
                textColor: Colors.white,
                child: const Text('OK'),
                onPressed: () {
                  // codeDialog = valueText;
                  changeStatus(
                      ref, 'shipped', context, _textFieldController.text);
                  // Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Image.asset(
              'assets/images/warning.png',
              height: 60,
            ),
            content: Text(
              'Do you want to exit an App?',
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            actions: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: Text(
                    'No',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    storage.remove('token');
                    storage.remove('id_user');
                    storage.remove('email');
                    storage.remove('name');

                    Navigator.of(context).pop(true);
                  },
                  //return true when click on "Yes"
                  child: Text(
                    'Yes',
                    style: GoogleFonts.poppins(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  showExitPopup2(context) async {
    return await showDialog(
      //show confirm dialogue
      //the return value will be from "Yes" or "No" options
      context: context,
      builder: (context) => AlertDialog(
        title: Image.asset(
          'assets/images/warning.png',
          height: 60,
        ),
        content: Text(
          'Do you want to exit an App?',
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        actions: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child: Text(
                'No',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
          ),
          Spacer(),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                storage.remove('token');
                storage.remove('id_user');
                storage.remove('email');
                storage.remove('name');

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Login()),
                    (Route<dynamic> route) => false);
              },
              //return true when click on "Yes"
              child: Text(
                'Yes',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    ); //if showDialouge had returned null, then return false
  }
}
