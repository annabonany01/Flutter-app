import 'package:flutter/material.dart';

int cantidad = 1;
class ThirteenScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.green),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'five'),
            );
          },
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
                            
              _ProductoCarrito(name: 'Thermomix', image: 'https://assets.tmecosys.com/image/upload/t_web640@2x/cdn/contentful/6OGkTjUfwgfHnMdzCoFBkj/1dff483b2ed1634706ba00d82a3bdb83/imagen3.jpg', price: 50),
              _ProductoCarrito(name: 'Pastel de pistacho y frambuesas', image: 'http://www.pecadosdereposteria.com/wp-content/uploads/2014/08/crema-queso-rambuesas-crocanti-istachos-pecados-reposteria-3.jpg', price: 16),
              
              Divider(thickness: 1, height: 30,),

              _Details(coste: 120, envio: 5),

              SizedBox(height: 50,),

              _Button(),

              SizedBox(height: 50,),

            ])
          )
        ],
      ),
    );
  }
}


class _Details extends StatelessWidget {

  final int coste;
  final int envio;


  const _Details({
    super.key, 
    required this.coste, 
    required this.envio
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: [

            _Row(coste: coste, text: 'Precio'),
            _Row(coste: envio, text: 'Gastos de envío'),
            _Row(coste:  coste + envio, text: 'Precio total'),



          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    Key? key,
    required this.coste, 
    required this.text,
  }) : super(key: key);

  final int coste;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(this.text, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),

        Text('$coste \€', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500))
      ],
    );
  }
}


class _ProductoCarrito extends StatelessWidget {
    
    final String name;
    final String image;
    final int price;

  const _ProductoCarrito({
    super.key,
    required this.name, 
    required this.image, 
    required this.price
  });
  // final Product product;

  // const _ProductoCarrito(this.product); 
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 10, vertical: 10 ),
      child: Container(
        width: double.infinity,
        height: 140,
        //margin: EdgeInsets.only( top: 20 ),
        //padding: EdgeInsets.symmetric( horizontal: 10, vertical: 5 ),
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
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 170),
              child: Padding(
                padding: EdgeInsets.symmetric( vertical: 5 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text( this.name, style: TextStyle(color: Colors.black, fontSize: 17), maxLines: 2, overflow: TextOverflow.ellipsis, ),
                    SizedBox(height: 10),
                    Text( '$price \€', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //TODO: DIFERENCIAR PARA CADA PRODUCTO
                        QuantitySelection(),
                        IconButton(
                          onPressed: () {}, //TODO: eliminar producto
                          icon: Icon(Icons.delete, color: Colors.black45, size: 20,)
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



class QuantitySelection extends StatefulWidget {
  @override
  _QuantitySelectionState createState() => _QuantitySelectionState();
}


class _QuantitySelectionState extends State<QuantitySelection> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      child: ClipRRect(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            IconButton(
              icon: Icon(Icons.remove_circle_outline, color: Colors.green, size: 20),
              onPressed: () {
                setState(() {
                  cantidad--;
                  if(cantidad<1){
                    cantidad = 1;
                  }
                });
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  cantidad.toString(),
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add_circle_outline, color: Colors.green, size: 20),
              onPressed: () {
                setState(() {
                  cantidad++;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: Colors.grey,
        elevation: 0,
        color: Colors.green,
        child: Container(
          padding: EdgeInsets.symmetric( horizontal: 10, vertical: 15),
          child: Text('SIGUIENTE',style: TextStyle( color: Colors.white ))
        ),
        onPressed: () async {
          //TODO: poner carga
          await Future.delayed(Duration(seconds: 1 ));
          
          Navigator.pushReplacementNamed(context, 'fourteen'); 
        },
      ),
    );
  }
}