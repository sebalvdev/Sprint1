import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/qr_scanner_repository.dart';
import '../datasource/qr_scanner_local_data_source.dart';

class QrScannerRepositoryImpl implements QrScannerRepository {
  final QrScannerLocalDataSource localDataSource;

  QrScannerRepositoryImpl({
    required this.localDataSource
  });
  
  @override
  Future<Either<Failure, bool>> reviewSerial(String serial) async{
    try{
      final result = await localDataSource.reviewSerial(serial);
      return right(result);
    } on CacheFailure {
      return left(CacheFailure());
    }
  }
}