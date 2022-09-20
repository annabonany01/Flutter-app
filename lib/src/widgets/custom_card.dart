import 'package:flutter/material.dart';


class CustomCard extends StatelessWidget {

  final String titulo;
  final String descripcion;
  final String image;
  final String page;
  
  const CustomCard({
    Key? key, 
    required this.titulo, 
    required this.descripcion, 
    required this.image, 
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 3, top: 3 ),
        width: double.infinity,
        height: 400,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            _BackgroundImage(image: image),

            _Details(titulo: titulo, descripcion: descripcion, page: page,)
          ],
        ),
      );
  }
}

class _Details extends StatelessWidget {
  
  final String titulo;
  final String descripcion;
  final String page;


  const _Details({
    Key? key,
    required this.titulo,
    required this.descripcion, 
    required this.page,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 40, vertical: 10 ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${this.titulo}', 
              style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
              
            ),
            SizedBox(height: 20),
            Text(
              '${this.descripcion}', 
              style: TextStyle(color: Colors.white, fontSize: 15), textAlign: TextAlign.center
            ),
          ],
        ),
      ),
      onPressed: () => Navigator.pushReplacementNamed(context, '$page'),
    );
  }
}

class _BackgroundImage extends StatelessWidget {

  final String image;
  
  const _BackgroundImage({
    Key? key, 
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: double.infinity,
        height: 400,
        child:
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),

      ),
    );
  }
}
