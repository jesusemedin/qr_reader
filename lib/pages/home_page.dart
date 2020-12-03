import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:qr_reader/pages/mapas_page.dart';
import 'package:qr_reader/pages/direcciones_page.dart';

import 'package:qr_reader/providers/db_provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

import 'package:qr_reader/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/widgets/scan_button.dart';



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
    // OBTENER EL SELECTED MENU OPT
    final uiProvider = Provider.of<UiProvider>(context);

    // EL CURRENT INDEX ES LO QUE SE NECESITA CAMBIAR PARA MOSTRAR LA PAGINA RESPECTIVA
    final currentIndex = uiProvider.selectedMenuOpt;

    // TODO: Temporal leer la base de datos
    // final tempScan = new ScanModel(valor: 'http://google.com');
    // DBProvider.db.nuevoScan(tempScan);
    // DBProvider.db.getScanById(1).then((scan) => print(scan.valor));
    // DBProvider.db.getTodosLosScans().then( print );
    // DBProvider.db.deleteAllScans().then( print );


    // Usar el ScanListProvider
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return MapasPage();
      
      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return DireccionesPage();

      default:
        return MapasPage();
    }

  }
}