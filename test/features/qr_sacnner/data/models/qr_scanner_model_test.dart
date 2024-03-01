import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprint1/features/qr_scanner/data/models/qr_scanner_model.dart';
import 'package:sprint1/features/qr_scanner/domain/entities/qr_scanner.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tQrScannerModel = QrScannerModel(serial: '1234567890');
  const tQrScannerModelList = [
    QrScannerModel(serial: '1234567890'),
    QrScannerModel(serial: '0987654321')
  ];

  test(
    "should be a subclass of AccessPass entity",
    () async {
      // assert
      expect(tQrScannerModel, isA<QrScanner>());
    },
  );

  test(
    "should return a valid model from Json",
    () async {
      // act
      final accessPassJson = json.decode(fixture('qr_example.json'));
      final result = QrScannerModel.fromJson(accessPassJson);
      // assert
      expect(result.serial, tQrScannerModel.serial);
    },
  );

  test(
    "should return a Json from a valid model",
    () async {
      // arrange
      final matcher = json.decode(fixture('qr_example.json'));
      // act
      final result = tQrScannerModel.toJson();
      // assert
      expect(result, matcher);
    },
  );

  test(
    "should be able to convert from JSON to AccessPassModel List",
    () async {
      // act
      final tAccessPassModelJson =
          jsonEncode(jsonDecode(fixture('qr_cache.json')));
      final result = qrScannerModelFromJson(tAccessPassModelJson);
      // assert
      expect(result, tQrScannerModelList);
    },
  );
}