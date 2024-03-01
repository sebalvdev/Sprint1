import 'dart:convert';

import '../../domain/entities/qr_scanner.dart';

List<QrScannerModel> qrScannerModelFromJson(String str) =>
    List<QrScannerModel>.from(json.decode(str).map((x) =>
      QrScannerModel.fromJson(x)));

class QrScannerModel extends QrScanner {
  const QrScannerModel({
    required String serial
  }) : super(serial: serial);

  factory QrScannerModel.fromJson(Map<String, dynamic> json) {
    return QrScannerModel(serial: json['serial']);
  }

  Map<String, dynamic> toJson() {
    return {
      'serial': serial,
    };
  }
}