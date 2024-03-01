import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprint1/core/error/failures.dart';
import 'package:sprint1/features/qr_scanner/domain/repositories/qr_scanner_repository.dart';
import 'package:sprint1/features/qr_scanner/domain/usecases/review_serial_code.dart';
import 'package:mocktail/mocktail.dart';

class MockQrScannerRepository extends Mock implements QrScannerRepository {}

void main() {
  late ReviewSerialCode getQcCode;
  late MockQrScannerRepository qrScannerRepository;

 setUp(() {
  qrScannerRepository = MockQrScannerRepository();
  getQcCode = ReviewSerialCode(qrScannerRepository);
 });

  const tSerial = '123';

 test('Should return QrScanner when success', () async {
  //  arrange
  when(() => qrScannerRepository.reviewSerial(tSerial)).thenAnswer((_) async => const Right(true));
  // act
final result = await getQcCode(const Params(serial: tSerial));
  // assert
  expect(result, const Right(true));
  verify(() => qrScannerRepository.reviewSerial(tSerial));
  verifyNoMoreInteractions(qrScannerRepository);
 });

 test(
    "should return failure when the repository fails",
    () async {
      // arrange
      final Failure failure = UnkownFailure();
      when(() => qrScannerRepository.reviewSerial(tSerial))
          .thenAnswer((_) async => Left(failure));
      // act
      final result = await getQcCode(const Params(serial: tSerial));
      // assert
      expect(result, Left(failure));
      verify(() => qrScannerRepository.reviewSerial(tSerial));
      verifyNoMoreInteractions(qrScannerRepository);
    },
  );
}