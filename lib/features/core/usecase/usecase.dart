import 'package:fpdart/fpdart.dart';
import 'package:techtonic_blog_app/features/core/error/failures.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
