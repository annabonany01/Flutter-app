import 'package:flutter/material.dart';


class SixScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network('http://www.pecadosdereposteria.com/wp-content/uploads/2014/08/crema-queso-rambuesas-crocanti-istachos-pecados-reposteria-3.jpg', height: 400, fit: BoxFit.cover,),
                  Positioned(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, 'four'),
                    ),
                  )
                ],
              )
              ],
            
          ),
        ),
      ),
    );
  }
}