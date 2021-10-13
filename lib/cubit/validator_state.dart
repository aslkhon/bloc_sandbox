part of 'validator_cubit.dart';

class ValidatorState extends Equatable {
  final bool isNotValid;

  const ValidatorState({required this.isNotValid});

  @override
  List<Object?> get props => [isNotValid];

  @override
  bool? get stringify => true;
}
