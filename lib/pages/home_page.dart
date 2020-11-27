import 'package:flutter/material.dart';

import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';
import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/pages/direcciones_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: <Widget>[
          IconButton(
            icon: Icon( Icons.delete_forever ),
            onPressed: (){},
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // EL CURRENT INDEX ES LO QUE SE NECESITA CAMBIAR PARA MOSTRAR LA PAGINA RESPECTIVA
    final currentIndex = 0;

    switch (currentIndex) {
      case 0:
        return MapasPage();
      
      case 1:
        return DireccionesPage();

      default:
        return MapasPage();
    }

  }
}