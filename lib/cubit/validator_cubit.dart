import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'validator_state.dart';

class ValidatorCubit extends Cubit<ValidatorState> {
  ValidatorCubit() : super(ValidatorState(isNotValid: false));

  void validate() =>
      emit(ValidatorState(isNotValid: ValidatorState.controller.text.isEmpty));
}
