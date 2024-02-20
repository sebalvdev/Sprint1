import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/qr_scanner_repository.dart';

class GetQrCode implements UseCase<bool,Params>{
  final QrScannerRepository repository;

  GetQrCode(this.repository);
  
  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.getSerialNumber(params.serial);
  }
  
}

class Params extends Equatable {
  final String serial;

  const Params({required this.serial});


  @override
  List<Object?> get props => [serial];
}