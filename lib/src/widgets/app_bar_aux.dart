import 'package:flutter/material.dart';


class AppBarAux extends StatelessWidget {

  final Widget child;
  final String text;
  final List<Widget>? actions;

  const AppBarAux({
    super.key, 
    required this.child, 
    required this.text, 
    this.actions
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(text),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.green),
                onPressed: () => Navigator.pushReplacementNamed(context, 'four'),
              );
            },
          ), 
          actions: actions ?? null
        ),
        body: child,
      )
    );
  }
}