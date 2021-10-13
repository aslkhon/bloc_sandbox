import 'package:bloc_sandbox/cubit/validator_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Validar Cubit', () {
    late ValidatorCubit validatorCubit;

    setUp(() {
      validatorCubit = ValidatorCubit();
    });

    tearDown(() {
      validatorCubit.close();
    });

    test('The isNotValid of the state is false (isNotValid: false)', () {
      expect(validatorCubit.state, const ValidatorState(isNotValid: false));
    });

    blocTest('validate function checks text field value',
        build: () => validatorCubit,
        act: (ValidatorCubit cubit) => cubit.validate(''),
        expect: () => [const ValidatorState(isNotValid: true)]);
  });
}
