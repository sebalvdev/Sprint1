import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../bloc/qr_scanner_bloc.dart';
import '../../../../injection_container.dart';
import '../widgets/widgets.dart';

class QrScannerPage extends StatelessWidget {
  QrScannerPage({super.key});

  final MobileScannerController cameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    formats: [BarcodeFormat.qrCode]
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escaner QR'),
      ),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<QrScannerBloc> buildBody(BuildContext context) {
    bool isScanEnable = true;
    return BlocProvider(
      create: (_) => sl<QrScannerBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<QrScannerBloc, QrScannerState>(
            builder: (context, state) {
              if (state is QrScannerLoading) {}
              if (state is QrScannerSuccess) {
                WidgetsBinding.instance.addPostFrameCallback((_) async {
                  isScanEnable = false;
                  await scannedQrDialog(context, state.isValidQr);
                  isScanEnable = true;
                });
              }
              return MobileScanner(
                controller: cameraController,
                onDetect: (capture) {
                  if (isScanEnable) {
                    var qrCapture = capture.barcodes[0];
                    if (state is QrScannerInitial) {
                      BlocProvider.of<QrScannerBloc>(context).add(ReviewSerialCodeEvent(serial: qrCapture.displayValue ?? ''));
                      }
                    }
                  },

                  overlay: Container(
                    decoration: ShapeDecoration(
                      shape: QrScannerViewer(
                      borderColor: Colors.white,
                      borderRadius: 10,
                      borderLength: 25,
                      borderWidth: 7.5,
                      cutOutSize: MediaQuery.of(context).size.width * 0.8,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  scannedQrDialog(BuildContext context, isCorrect) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) => 
            QRScannerMessage(isCorrect: isCorrect));
  }
}