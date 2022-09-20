import 'package:abalit/src/widgets/app_bar_aux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FiveScreen extends StatelessWidget {

  final List<String> _assetNamesFood = <String>[
    'assets/spaghetti.svg'
    'assets/steak.svg',
    'assets/fish.svg',
    'assets/carrot.svg',
    'assets/apple (1).svg',
  ];


  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Scaffold(
          appBar: AppBar(
            title: Text('Delivery'),
            foregroundColor: Colors.black,
            backgroundColor: Colors.white, 
            actions: [
              IconButton(
                icon: Icon(Icons.search_rounded, color: Colors.green),
                onPressed: () => Navigator.pushReplacementNamed(context, 'ten'), 
              ),
              IconButton(
                icon: Icon(Icons.history_rounded, color: Colors.green),
                onPressed: () => Navigator.pushReplacementNamed(context, 'twelve')
              ),
            ],
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.green),
                  onPressed: () => Navigator.pushReplacementNamed(context, 'four'),
                );
              },
            ),
          ),
        ),
        _bottomNavigationBar(),

        CardTable(),

        Positioned(
          top: 600,
          bottom: 50,
          child: Text('hola')
        )



      ],
    );
    
  }
}

class CardTable extends StatelessWidget {
  const CardTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Table(
          children: const [
            TableRow(
              children: [
                _SingleCard(
                  image: 'https://www.mccain-foodservice.es/wp-content/uploads/2019/08/Inspiration_6255_Crispy_Chicken_Wings.jpg',
                  nombre: 'Alitas de pollo',
                  precio: '25€'
                ),
                _SingleCard(
                  image: 'https://www.comedera.com/wp-content/uploads/2021/05/chuletas-de-cerdo-al-horno.jpg',
                  nombre: 'Chuleta de cerdo',
                  precio: '18€'
                ),
              ]
            ),
            TableRow(
              children: [
                _SingleCard(
                  image: 'https://st2.depositphotos.com/1020618/6765/i/450/depositphotos_67657295-stock-photo-japanese-seafood-sushi-set.jpg',
                  nombre: 'Lote sushi',
                  precio: '23€'
                ),
                _SingleCard(
                  image: 'http://www.pecadosdereposteria.com/wp-content/uploads/2014/08/crema-queso-rambuesas-crocanti-istachos-pecados-reposteria-3.jpg',
                  nombre: 'Pastel de pistacho y frambuesas',
                  precio: '16€'
                ),
              ]
            ),
            TableRow(
              children: [
                _SingleCard(
                  image: 'https://www.hazteveg.com/img/recipes/full/201511/R24-25719.jpg',
                  nombre: 'Pasta al pesto',
                  precio: '15€'
                ),
                _SingleCard(
                  image: 'https://www.verdurastabuenca.com/images/recetas/tabuenca_receta_salmon_con_verduras.jpg',
                  nombre: 'Salmón con verduras',
                  precio: '20€'
                ),
              ]
            ),
            TableRow(
              children: [
                _SingleCard(
                  image: 'https://t1.uc.ltmcdn.com/es/posts/2/5/7/como_hacer_una_ensalada_de_quinoa_33752_600_square.jpg',
                  nombre: 'Ensalada quinoa',
                  precio: '13€'
                ),
                _SingleCard(
                  image: 'https://www.unileverfoodsolutions.es/dam/global-ufs/mcos/SPAIN/calcmenu/recipes/ES-recipes/general/hamburguesa-de-ternera-con-aguacate/main-header.jpg',
                  nombre: 'Hamburguesa completa',
                  precio: '20€'
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}

class _SingleCard extends StatelessWidget {

  final String precio;
  final String nombre;
  final String image;
  
  const _SingleCard({
    Key? key, 
    required this.precio, 
    required this.nombre, 
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0), side: BorderSide(color: Colors.black12)),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              child: Image.network(this.image, fit: BoxFit.cover, width: 170, height: 130,),
            ),
            Container(
              width: 170,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),

                    Text(this.precio, style: TextStyle(color: Colors.green, fontSize: 15)),

                    const SizedBox(height: 15,),

                    Expanded(child: Text(this.nombre, style: TextStyle(color: Colors.grey, fontSize: 16), textAlign: TextAlign.center)),
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

class _bottomNavigationBar extends StatelessWidget {
  const _bottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.amber,
      child: BottomNavigationBar(
        elevation: 0,
        unselectedLabelStyle: TextStyle(color: Colors.black54),
        selectedItemColor: Colors.black54,
        //TODO: on tap()
        currentIndex: 0,
        
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/spaghetti.svg', width: 30, height: 30, color: Colors.grey),
            label: 'Pasta',
          ),

          BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/steak.svg', width: 30, height: 30, color: Colors.grey),
          label: 'Carne'
          ),

          BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/fish.svg', width: 30, height: 30, color: Colors.grey),
          label: 'Pescado'
          ),

          BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/carrot.svg', width: 30, height: 30, color: Colors.grey),
          label: 'Verduras',
                    
          ),
        ],
      )
    );
  }
}
