import 'package:flutter/material.dart';
import 'package:stop_watch/features/home/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.withOpacity(.4),
      body: const HomeViewBody(),
    );
  }
}
