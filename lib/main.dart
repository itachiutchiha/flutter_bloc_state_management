import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_learn/bloc/counter_bloc.dart';
// import 'package:state_management_learn/cubit/counter_cubit.dart';
import 'package:state_management_learn/cubit/form_cubit.dart';
import 'package:state_management_learn/cubit/task_cubit.dart';
import 'package:state_management_learn/task_screen.dart';

void main() {
  runApp(const MyApp());
}

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterBloc(),
          ),
          BlocProvider(
            create: (context) => FormCubit(),
          ),
          BlocProvider(
            create: (context) => TaskCubit(),
          ),
        ],
        child: const TaskScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print("inisde the build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                      print("in builder");
                      return Text(
                        state.id.toString(),
                        style: Theme.of(context).textTheme.headline4,
                      );
                    },
                  ),
                ]),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementEvent());
                },
                child: Icon(Icons.remove),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(IncrementEvent()),
                  child: Icon(Icons.add)),
            ],
          ),
          TextField(
            decoration: InputDecoration(
                suffixIcon: IconButton(
              icon: context.watch<FormCubit>().state
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () => context.read<FormCubit>().changeVissibility(),
            )),
          )
        ],
      ),
    );
  }
}
