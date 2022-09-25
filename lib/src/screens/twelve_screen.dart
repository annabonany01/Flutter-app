import 'package:flutter/material.dart';


class TwelveScreen extends StatelessWidget {

  /*  TWELVE SCREEN
      En esta pagina se encuentra el historial de pedidos realizados
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de pedidos'),
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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          _CustomCard(
            fecha: '20 de mayo de 2020',
            numPedido: '#JQS100',
            coste: '120,00',
            estado: 'En camino',
          ),
          _CustomCard(
            fecha: '18 de mayo de 2020', 
            numPedido: '#JPS100', 
            coste: '30,00', 
            estado: 'En camino',
          ),
          _CustomCard(
            fecha: '2 de mayo de 2020', 
            numPedido: '#JNS119', 
            coste: '30,00', 
            estado: 'Entregado',
          ),
        ]
      )
    );
  }
}

class _CustomCard extends StatelessWidget {

  final String fecha;
  final String numPedido;
  final String coste;
  final String estado;


  const _CustomCard({
    super.key, 
    required this.fecha, 
    required this.numPedido, 
    required this.coste, 
    required this.estado
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: MaterialButton(
        
        child: Container(
          width: double.infinity,
          height: 120,
          decoration: _cardBorder(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              
              children: [
                Text(this.fecha, style: TextStyle(color: Colors.black12, fontSize: 15,)),
                
                Text('Pedido: $numPedido', style: TextStyle(color: Colors.black45, fontSize: 15,)),

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
        ),
        onPressed: () => Navigator.pushReplacementNamed(context, 'eleven')
      ),
    );
  }

  BoxDecoration _cardBorder() {
    return BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0,5),
              blurRadius: 5,
            )
          ]
        );
  }
}