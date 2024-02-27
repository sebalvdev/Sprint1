import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sprint1/core/error/failures.dart';
import 'package:sprint1/features/qr_scanner/domain/usecases/review_serial_code.dart';
import 'package:sprint1/features/qr_scanner/presentation/bloc/qr_scanner_bloc.dart';

class MockReviewSerialCode extends Mock implements ReviewSerialCode {}

void main() {
  late ReviewSerialCode reviewSerialCode;
  late QrScannerBloc bloc;

  setUp(() {
    registerFallbackValue(const Params(serial: '123'));
    reviewSerialCode = MockReviewSerialCode();
    bloc = QrScannerBloc(reviewSerialCode: reviewSerialCode);
  });

  test(
    "initialStante should be QrScannerInitial",
    () async {
      // assert
      expect(bloc.state, equals(QrScannerInitial()));
    },
  );

  group('ReviewQrCode', () {
    test(
      "should get a boolean value from the ReviewQrCode usecase",
      () async {
        // arrange
        when(() => reviewSerialCode(any()))
            .thenAnswer((_) async => const Right(true));
        // act
        bloc.add(const ReviewSerialCodeEvent(serial: '123'));
        await untilCalled(() => reviewSerialCode(const Params(serial: '123')));
        // assert
        verify(() => reviewSerialCode(const Params(serial: '123')));
      },
    );
    test(
      "should emit [QrScannerLoading, QrScannerSuccess] when verification is complete",
      () async {
        // arrange
        when(() => reviewSerialCode(any()))
            .thenAnswer((_) async => const Right(true));
        // assert later
        final expected = [
          QrScannerLoading(),
          const QrScannerSuccess(isValidQr: true),
        ];
        expectLater(bloc.stream, emitsInOrder(expected));
        // act
        bloc.add(const ReviewSerialCodeEvent(serial: '123'));
      },
    );

    test(
      "should emit [QrScannerLoading, QrScannerFailure] when verification fails",
      () async {
        // arrange
        when(() => reviewSerialCode(any()))
            .thenAnswer((_) async => Left(CacheFailure()));
        // assert later
        final expected = [
          QrScannerLoading(),
          QrScannerFailure(),
        ];
        expectLater(bloc.stream, emitsInOrder(expected));
        // act
        bloc.add(const ReviewSerialCodeEvent(serial: '123'));
      },
    );
  });
}