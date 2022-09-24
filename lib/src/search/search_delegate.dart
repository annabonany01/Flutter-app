import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductSearchDelegate extends SearchDelegate {


  @override
  String? get searchFieldLabel => '¿Qué buscas?';

@override
  TextStyle? get searchFieldStyle => TextStyle(color: Colors.black26);


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
        IconButton(
          icon: Icon( Icons.clear ),
          onPressed: () => query = '',
        )
      ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon( Icons.arrow_back, color: Colors.green ),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'five');
        },
      );
    }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildResults');
  }
  
  Widget _emptyContainer() {
    return Container(
        child: Center(
          child: Image.asset('assets/back_buscador.png'),
        ),
    );
  }
    

  @override
  Widget buildSuggestions(BuildContext context) {
    //TODO: implementar buscador
    return _emptyContainer();
  }

}