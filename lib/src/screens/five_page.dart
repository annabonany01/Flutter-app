import 'package:abalit/src/search/search_delegate.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FiveScreen extends StatelessWidget {
 
  final List<Tab> _tabs = [
    Tab(
      icon: SvgPicture.asset(
        'assets/spaghetti.svg',
        width: 30,
        height: 30,
        color: Colors.grey,
      ),
      text: 'Pasta',
    ),
    Tab(
      icon: SvgPicture.asset(
        'assets/steak.svg',
        width: 30,
        height: 30,
        color: Colors.grey,
      ),
      text: 'Carne',
    ),
    Tab(
      icon: SvgPicture.asset(
        'assets/fish.svg',
        width: 30,
        height: 30,
        color: Colors.grey,
      ),
      text: 'Pescado',
    ),
    Tab(
      icon: SvgPicture.asset(
        'assets/carrot.svg',
        width: 30,
        height: 30,
        color: Colors.grey,
      ),
      text: 'Verduras',
    ),
    Tab(
      icon: SvgPicture.asset(
        'assets/apple (1).svg',
        width: 30,
        height: 30,
        color: Colors.grey,
      ),
      text: 'Frutas',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        DefaultTabController(
          length: _tabs.length,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Delivery'),
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: Icon(Icons.search_rounded, color: Colors.green),
                  onPressed: () => showSearch(context: context, delegate: ProductSearchDelegate()),
                ),
                IconButton(
                    icon: Icon(Icons.history_rounded, color: Colors.green),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, 'twelve')),
              ],
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.green),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, 'four'),
                  );
                },
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TabBar(
                    tabs: _tabs,
                    isScrollable: true,
                    physics: BouncingScrollPhysics(),
                    unselectedLabelColor: Colors.black38,
                    labelColor: Colors.black54,
                    indicatorColor: Color.fromARGB(0, 0, 0, 0),
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    dragStartBehavior: DragStartBehavior.down,
                    children: [
                      //TODO: añadir los productos separados por sectores
                      _CardTable(),
                      _CardTable(),
                      _CardTable(),
                      _CardTable(),
                      _CardTable(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.lime[600],
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20))

          ),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Row(
              children: [
              
                MaterialButton(
                  minWidth: 10,
                  child: Icon(Icons.person, color: Colors.white,),
                  onPressed: () => Navigator.pushReplacementNamed(context, 'sixteen')
                ),
                MaterialButton(
                  minWidth: 10,
                  child: Icon(Icons.add_shopping_cart_rounded, color: Colors.white,),
                  onPressed: () => Navigator.pushReplacementNamed(context, 'thirteen'), 
                ),
              ],
            ),
          ),
        )
      ],
      
    );
  }
}

class _CardTable extends StatelessWidget {
  const _CardTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Table(
          children: const [
            TableRow(children: [
              _SingleCard(
                  image:'https://www.mccain-foodservice.es/wp-content/uploads/2019/08/Inspiration_6255_Crispy_Chicken_Wings.jpg',
                  nombre: 'Alitas de pollo',
                  precio: '25€',
                  page: 'six'),
              _SingleCard(
                  image:'https://www.comedera.com/wp-content/uploads/2021/05/chuletas-de-cerdo-al-horno.jpg',
                  nombre: 'Chuleta de cerdo',
                  precio: '18€',
                  page: 'six'),
            ]),
            TableRow(children: [
              _SingleCard(
                  image:'https://st2.depositphotos.com/1020618/6765/i/450/depositphotos_67657295-stock-photo-japanese-seafood-sushi-set.jpg',
                  nombre: 'Lote sushi',
                  precio: '23€',
                  page: 'six'),
              _SingleCard(
                  image:'http://www.pecadosdereposteria.com/wp-content/uploads/2014/08/crema-queso-rambuesas-crocanti-istachos-pecados-reposteria-3.jpg',
                  nombre: 'Pastel de pistacho y frambuesas',
                  precio: '16€',
                  page: 'six'),
            ]),
            TableRow(children: [
              _SingleCard(
                  image:'https://www.hazteveg.com/img/recipes/full/201511/R24-25719.jpg',
                  nombre: 'Pasta al pesto',
                  precio: '15€',
                  page: 'six'),
              _SingleCard(
                  image:'https://www.verdurastabuenca.com/images/recetas/tabuenca_receta_salmon_con_verduras.jpg',
                  nombre: 'Salmón con verduras',
                  precio: '20€',
                  page: 'six'),
            ]),
            TableRow(children: [
              _SingleCard(
                  image:'https://t1.uc.ltmcdn.com/es/posts/2/5/7/como_hacer_una_ensalada_de_quinoa_33752_600_square.jpg',
                  nombre: 'Ensalada quinoa',
                  precio: '13€',
                  page: 'six'),
              _SingleCard(
                  image:'https://www.unileverfoodsolutions.es/dam/global-ufs/mcos/SPAIN/calcmenu/recipes/ES-recipes/general/hamburguesa-de-ternera-con-aguacate/main-header.jpg',
                  nombre: 'Hamburguesa completa',
                  precio: '20€',
                  page: 'six'),
            ])
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
  final String page;

  const _SingleCard({
    Key? key,
    required this.precio,
    required this.nombre,
    required this.image, 
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.black12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                child: Image.network(
                  this.image,
                  fit: BoxFit.cover,
                  width: 170,
                  height: 130,
                ),
              ),
              Container(
                width: 170,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                    Text(this.precio,
                        style: TextStyle(color: Colors.green, fontSize: 15)),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                        child: Text(this.nombre,
                            style: TextStyle(color: Colors.grey, fontSize: 15),
                            textAlign: TextAlign.center)),
                  ],
                ),
              )
            ],
          ),
        ),
        onTap: () => Navigator.pushReplacementNamed(context, 'six'),
      ),
    );
  }
}
