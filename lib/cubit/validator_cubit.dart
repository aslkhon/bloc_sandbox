import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'validator_state.dart';

class ValidatorCubit extends Cubit<ValidatorState> {
  ValidatorCubit() : super(ValidatorState(isNotValid: false));

  void validate(String text) => emit(ValidatorState(isNotValid: text.isEmpty));
}
