//import 'package:abalit/src/models/product.dart';
import 'package:flutter/material.dart';


class ElevenScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    //final Product product = ModalRoute.of(context)!.settings.arguments as Product;


    return Scaffold(
      appBar: AppBar(
        title: Text('Pedido #JQS100'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.green),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'twelve'),
            );
          },
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              
              Resume(
                fecha: '20 de mayo de 2020',
                coste: '120,00',
                estado: 'En camino',
              ),
              Divider(thickness: 1),

              ProductoCarrito(name: 'Thermomix', image: 'https://assets.tmecosys.com/image/upload/t_web640@2x/cdn/contentful/6OGkTjUfwgfHnMdzCoFBkj/1dff483b2ed1634706ba00d82a3bdb83/imagen3.jpg', price: '50'),
              ProductoCarrito(name: 'Pastel de pistacho y frambuesas', image: 'http://www.pecadosdereposteria.com/wp-content/uploads/2014/08/crema-queso-rambuesas-crocanti-istachos-pecados-reposteria-3.jpg', price: '16'),
              

            ])
          )
        ],
      ),
    );
  }
}

class Resume extends StatelessWidget {

  final String fecha;
  final String coste;
  final String estado;


  const Resume({
    super.key, 
    required this.fecha, 
    required this.coste, 
    required this.estado
  });

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: [
            Text(this.fecha, style: TextStyle(color: Colors.black26, fontSize: 15,)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total: $coste \€', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),

                if (estado == 'En camino') 
                  Text(this.estado, style: TextStyle(color: Colors.green, fontSize: 15, fontWeight: FontWeight.bold))
                else if (estado == 'Entregado') 
                  Text(this.estado, style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold))
                else Text('Creado', style: TextStyle(color: Colors.green, fontSize: 15, fontWeight: FontWeight.bold))
              ],
            ),

          ],
        ),
      ),
    );
  }
}


class ProductoCarrito extends StatelessWidget {
    
    final String name;
    final String image;
    final String price;

  const ProductoCarrito({
    super.key,
    required this.name, 
    required this.image, 
    required this.price
  });
  // final Product product;

  // const ProductoCarrito(this.product); 
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 120,
      margin: EdgeInsets.only( top: 20 ),
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          ClipRRect(
            child: FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'), 
              image: NetworkImage(this.image, scale: 10),
              height: 120,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox( width: 20 ),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text( this.name, style: TextStyle(color: Colors.black, fontSize: 17), maxLines: 2, overflow: TextOverflow.ellipsis, ),
                SizedBox(height: 10),
                Text( '$price \€', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 15)),

              ],
            ),
          )
        ],
      ),
    );
  }
}

