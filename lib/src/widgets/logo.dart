import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final Widget child;

  const Logo({
    super.key, 
    required this.child
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _logo(),

          this.child

        ],
      )
    );
  }
}

class _logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green)
              ),
            ),
            top: 100,
            left: 100,
          ),
          Positioned(
            child: Text(
              'L',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 90),
            ),
            top: 120,
            left: 150,
          )
        ],
      ),
    );
  }
}