import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provide.dart';
import 'package:qr_scanner/utils/util.dart';

class ScannButton extends StatelessWidget {
  final Color? elcolor;
  const ScannButton({super.key, this.elcolor});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //     '#3D8BEF', 'Cancelar', false, ScanMode.QR);
        const barcodeScanRes = 'http://google.com';

        if (barcodeScanRes == '-1') {
          return;
        }
        final scanlistprovider =
            Provider.of<ScanListProvider>(context, listen: false);
        debugPrint(barcodeScanRes);

        scanlistprovider.nuevoScan(barcodeScanRes);

        scanlistprovider.nuevoScan('geo:12.953653,-84.932417');

        final nuevoscan = await scanlistprovider.nuevoScan(barcodeScanRes);

        launchurl(context, nuevoscan);

        //scanlistprovider.nuevoScan('geo:15.33,16.99');
      },
      child: Icon(Icons.qr_code, color: elcolor ?? Colors.amber),
    );
  }
}
