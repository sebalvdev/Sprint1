import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sprint1/features/qr_scanner/domain/repositories/qr_scanner_repository.dart';
import 'package:sprint1/features/qr_scanner/domain/usecases/get_qr_code.dart';
import 'package:mocktail/mocktail.dart';

class MockQrScannerRepository extends Mock implements QrScannerRepository {}

void main() {
  late GetQrCode getQcCode;
  late MockQrScannerRepository qrScannerRepository;

 setUp(() {
  qrScannerRepository = MockQrScannerRepository();
  getQcCode = GetQrCode(qrScannerRepository);
 });

  const tSerial = '123';

 test('Should return QrScanner when success', () async {
  //  arrange
  when(() => qrScannerRepository.getSerialNumber(tSerial)).thenAnswer((_) async => const Right(true));
  // act
final result = await getQcCode(const Params(serial: tSerial));
  // assert
  expect(result, const Right(true));
  verify(() => qrScannerRepository.getSerialNumber(tSerial));
  verifyNoMoreInteractions(qrScannerRepository);
 });
}