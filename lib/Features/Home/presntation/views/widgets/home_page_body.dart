import 'package:flutter/material.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}