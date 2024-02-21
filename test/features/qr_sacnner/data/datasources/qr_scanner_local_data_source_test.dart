import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sprint1/features/qr_scanner/data/datasource/qr_scanner_local_data_source.dart';

import '../../../../fixtures/fixture_reader.dart';

const cacheQrScanner = 'CACHE_ESCANER_QR';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late QrScannerLocalDataSourceImpl localDataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSource = QrScannerLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group("reviewSerial", () {
    final tQrScannerModel = fixture('qr_cache.json');

    test(
      "Should return false if the cache is empty",
      () async {
        // arrange
        when(() => mockSharedPreferences.getString(cacheQrScanner))
            .thenReturn(null);
        // act
        final result = await localDataSource.reviewSerial('1234567890');
        // assert
        verify(() => mockSharedPreferences.getString(cacheQrScanner));
        expect(result, false);
      },
    );

    test(
      "Should return true if the qrCode is valid",
      () async {
        // arrange
        when(() => mockSharedPreferences.getString(cacheQrScanner))
            .thenReturn(tQrScannerModel);
        // act
        final result = await localDataSource.reviewSerial('1234567890');
        // assert
        verify(() => mockSharedPreferences.getString(cacheQrScanner));
        expect(result, true);
      },
    );

    test(
      "Should return false if the qrCode is invalid",
      () async {
        // arrange
        when(() => mockSharedPreferences.getString(cacheQrScanner))
            .thenReturn(tQrScannerModel);
        // act
        final result = await localDataSource.reviewSerial('12333');
        // assert
        verify(() => mockSharedPreferences.getString(cacheQrScanner));
        expect(result, false);
      },
    );
  });
}

