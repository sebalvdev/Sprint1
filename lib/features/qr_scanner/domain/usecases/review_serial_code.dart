import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/qr_scanner_repository.dart';

class ReviewSerialCode implements UseCase<bool,Params>{
  final QrScannerRepository repository;

  ReviewSerialCode({required this.repository});
  
  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.reviewSerial(params.serial);
  }
  
}

class Params extends Equatable {
  final String serial;

  const Params({required this.serial});


  @override
  List<Object?> get props => [serial];
}