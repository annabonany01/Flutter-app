import 'package:flutter/material.dart';


class SixteenScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black54, ),
            onPressed: () => Navigator.pushReplacementNamed(context, 'seventeen')
          ),
          
        ],
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          //mainAxisAlignment: MainAxisAlignment.start,
          children:[ 
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  CircleAvatar(
                    maxRadius: 70,
                    backgroundColor: Color.fromARGB(121, 76, 175, 79),
                    backgroundImage: NetworkImage('https://www.viewbug.com/media/mediafiles/2016/05/07/65898563_large.jpg'),
                  ),
                  SizedBox(height: 20,),
                  Text('Marta Gómez', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ],
              ),
              
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Icon(Icons.mail_rounded, color: Colors.lightGreen,),
                SizedBox(width: 20),
                Text('correo@ejemplo.com', style: TextStyle(color: Colors.black45, fontSize: 16),)
              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Icon(Icons.call, color: Colors.lightGreen,),
                SizedBox(width: 20),
                Text('645823019', style: TextStyle(color: Colors.black45, fontSize: 16),)
              ],
            )
          ],
          
        ),
      ),
    );
  }
}