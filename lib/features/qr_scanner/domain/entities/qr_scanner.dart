import 'package:equatable/equatable.dart';

class QrScanner extends Equatable{
  final String serial;

  const QrScanner({
    required this.serial
  });
  
  @override
  List<Object?> get props => [serial];
}