import 'package:dilevery/src/controller/fonctions.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:get/get.dart';

class ScannerCode extends StatefulWidget {
  ScannerCode();

  @override
  State<ScannerCode> createState() => _ScannerCodeState();
}

class _ScannerCodeState extends State<ScannerCode> {
  List references = [
    '123458678',
    '12g345678',
    '123445678',
    '123456d78',
    '123456r78',
    '123456786',
  ];
  // ScannerCode._();
  // AssigneController controller = Get.find();
  final controllers = Get.put(inzajController());
  void rebuildAllChildren(BuildContext context) {
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }

  MobileScannerController cameraController = MobileScannerController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllers.dispose();
    cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scanner'),
          centerTitle: true,
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              // ignore: sort_child_properties_last
              child: MobileScanner(
                  controller: cameraController,
                  onDetect: (barcode, args) {
                    final String code = barcode.rawValue!;
                    if (references.contains(code)) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('leads not founded'),
                          content:
                              Text('can\'t find leds with reference ${code}'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('anuule'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, 'OK');
                                Navigator.of(context).pop(context);
                              },
                              child: const Text('scan again'),
                            ),
                          ],
                        ),
                      );
                    }
                    controllers.scanner(code, context);
                    print(code);
                    debugPrint('Barcode found! $code');
                  }),
              bottom: 0,
            ),
            Positioned(
              bottom: 60,
              child: _buttons(),
            )
          ],
        ));
  }

  Widget _buttons() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      );
}
