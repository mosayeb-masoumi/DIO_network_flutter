import 'package:dio_example/di.dart';
import 'package:dio_example/home/presentation/bloc/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => HomeCubit(sl())),
    ], child: const IHomePage());
  }
}

class IHomePage extends StatefulWidget {
  const IHomePage({super.key});

  @override
  State<IHomePage> createState() => _IHomePageState();
}

class _IHomePageState extends State<IHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<HomeCubit>().getCountryInfo();
              },
              child: const Text("get country info")),
          BlocConsumer<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoaded) {
                  return Text(
                      "${state.result.countryName} ${state.result.city}");
                } else {
                  return Container();
                }
              },
              listener: (context, state) {}),
          ElevatedButton(
              onPressed: () {
                context.read<HomeCubit>().getTodoList();
              },
              child: const Text("get list todos")),
         
           BlocConsumer<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeTodosLoaded) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.result.length,
                          itemBuilder: (context, index) {
                            var todoModel = state.result[index];
                            return Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 100,
                              margin: const EdgeInsets.all(10),
                              color: Colors.green.shade300,
                              child: Center(
                                child:
                                    Text("${todoModel.title} ${todoModel.userId}"),
                              ),
                            );
                          }),
                    );
                  } else{
                    return Container();
                  }
                },
                listener: (context, state) {}),
         
        ],
      )),
    );
  }
}
