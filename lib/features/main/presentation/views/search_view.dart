import 'package:bot_delivery/features/common/widgets/w_textfield.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const MTextField(
          hintText: 'Search',
        ),
      ),
      body: const Column(),
    );
  }
}
