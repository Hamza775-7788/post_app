import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCashFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class PassowrdWrongFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class OperationNotCompletedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyRemotDataFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnexpectedErrorFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class DuplicateFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class PermissionFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class LinkedRecourdFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class BalanceNotEneghFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class NameNotEneghFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class InvalidKeyFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class InvalidAccountFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class AccountExistsFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class FacilityExistsFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class NameExistsFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class PhoneAlredyExistsFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class UnAuthraiszdFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class KeyInvalidFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class InvalidCodeFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class InvalidEmailFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class LinkedEmailFailuer extends Failure {
  @override
  List<Object?> get props => [];
}
class PausedFailuer extends Failure {
  @override
  List<Object?> get props => [];
}

class CanceldFailuer extends Failure {
  @override
  List<Object?> get props => [];
}
