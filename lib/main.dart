import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizzler/home/cubit/home_cubit.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Тапшырма 7',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Pages(),
        ),
      ),
    );
  }
}

class Pages extends StatefulWidget {
  const Pages() : super();

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                    child: Text(
                  BlocProvider.of<HomeCubit>(context).getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, color: Colors.white),
                )),
              ),
            ),
            // True button
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<HomeCubit>(context).check(true);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        'Да',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // False button
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    BlocProvider.of<HomeCubit>(context).check(false);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Нет',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: state.scoreKeeper!,
            )
          ],
        );
      },
    );
  }
}
