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
      home: BlocProvider(
        create: (context) => ValidatorCubit(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your text here:',
            ),
            BlocBuilder<ValidatorCubit, ValidatorState>(
              builder: (context, state) {
                return TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      errorText:
                          state.isNotValid ? 'TextField is empty!' : null),
                );
              },
            ),
            ValidationButton(
                onPressed: () => BlocProvider.of<ValidatorCubit>(context)
                    .validate(controller.text))
          ],
        ),
      ),
    );
  }
}

class ValidationButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ValidationButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.check),
        label: const Text('Validate'));
  }
}
