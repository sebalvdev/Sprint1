part of 'qr_scanner_bloc.dart';


sealed class QrScannerEvent extends Equatable {
  const QrScannerEvent();

  @override
  List<Object> get props => [];
}

class ReviewSerialCodeEvent extends QrScannerEvent {
  final String serial;

  const ReviewSerialCodeEvent({required this.serial});
}
