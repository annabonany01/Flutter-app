
import 'package:abalit/src/widgets/widgets.dart';
import 'package:flutter/material.dart';


class FourScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logo'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(), //scroll ios
        child: Column(
          children: const [
            CustomCard(
            titulo: 'Gourmet Delivery', 
            descripcion: 'Te llevamos a casa los mejores platos Gourmet de Alta Gastronomía cocinados al Vacío Sous-Vide a baja temperatura per nuestros chefs',
            image: 'assets/home.jpg',
            page: 'five',
            ),
            CustomCard(
            titulo: 'Equipos para Cocinar', 
            descripcion: 'Para cocinar al Vacío Sous-Vide a Baja Temperatura y Robots diseñados para hacer fácil y práctica la buena cocina',
            image: 'assets/home2.jpg',
            page: 'six'
            ),

          ],
        )



          
      )
    );
  }
}
