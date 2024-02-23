import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/review_serial_code.dart';


part 'qr_scanner_event.dart';
part 'qr_scanner_state.dart';


class QrScannerBloc extends Bloc<QrScannerEvent, QrScannerState> {

  final ReviewSerialCode reviewSerialCode;


  QrScannerBloc({required this.reviewSerialCode}) : super(QrScannerInitial()) {
    on<ReviewSerialCodeEvent>((event, emit) async {
      emit(QrScannerLoading());
      final result = await reviewSerialCode(Params(serial: event.serial));
      result.fold((failure) async => emit(QrScannerFailure()),
        (isValidQr) async => emit(QrScannerSuccess(isValidQr: isValidQr)));
    });
  }
}
