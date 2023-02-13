import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:newscanner/current_location.dart';

class MyCustomWidget extends StatefulWidget {


  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  double? latitude,longitude;

  var getResult = 'QR Code Result';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   ScreenView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  scanQRCode();
                },
                child: Text('Scan QR'),
              ),
              SizedBox(height: 20.0,),
              Text(getResult),

            ],
          )
      ),
    );
  }
  // getCurrentLocation() async {
  //   var p = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.low,
  //     forceAndroidLocationManager: true,
  //   );
  //   if (p != null) {
  //    print('Lat:${p?.latitude}, Long:${p?.longitude}');
  //   } else {
  //     print('Data unavailable');
  //   }
  // }

  void scanQRCode() async {
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }

  }

}