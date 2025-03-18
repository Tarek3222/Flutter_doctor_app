import 'package:doctor/features/home/views/widgets/home_top_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin:
              const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 28),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopBar(),
            ],
          ),
        ),
      ),
    );
  }
}
