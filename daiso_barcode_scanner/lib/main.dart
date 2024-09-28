import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DaisoBarcodeScanner',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'DAISO バーコードスキャナー'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: _buttonScanBarcode(context),
      ),
    );
  }

  Widget _buttonScanBarcode(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      child: FloatingActionButton(
        onPressed: () async {
          await _scanBarcodeAsync(context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.qr_code_scanner,
              size: 80,
            ),
            Text("バーコードを読み込む"),
          ],
        ),
      ),
    );
  }

  Future<void> _scanBarcodeAsync(BuildContext context) async {
    var barcode = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SimpleBarcodeScannerPage(),
    ));
    if (barcode is String) {
      var url = Uri(scheme: 'https', host: 'jp.daisonet.com', path: 'products/' + barcode);
      await launchUrl(url, mode: LaunchMode.inAppBrowserView);
    };
  }
}
