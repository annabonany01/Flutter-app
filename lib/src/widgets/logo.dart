import 'package:flutter/material.dart';

class Logo extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        children: [
          _logo(),
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
      height: size.height * 0.3,
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
            top: 60,
            left: 100,
          ),
          Positioned(
            child: Text(
              'L',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 90),
            ),
            top: 80,
            left: 150,
          )
        ],
      ),
    );
  }
}