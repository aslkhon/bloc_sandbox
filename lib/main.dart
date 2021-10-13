import 'package:bloc_sandbox/cubit/validator_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocProvider<ValidatorCubit>(
          create: (context) => ValidatorCubit(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter your text here:',
              ),
              BlocBuilder<ValidatorCubit, ValidatorState>(
                builder: (context, state) {
                  return TextField(
                    controller: ValidatorState.controller,
                    decoration: InputDecoration(
                        errorText:
                            state.isNotValid ? 'TextField is empty!' : null),
                  );
                },
              ),
              const ValidationButton()
            ],
          ),
        ),
      ),
    );
  }
}

class ValidationButton extends StatelessWidget {
  const ValidationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () => BlocProvider.of<ValidatorCubit>(context).validate(),
        icon: const Icon(Icons.check),
        label: const Text('Validate'));
  }
}
