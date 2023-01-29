import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/ui_provider.dart';
import 'package:qr_scanner/views/direcciones_page.dart';
import 'package:qr_scanner/views/maps_page.dart';
import 'package:qr_scanner/widgets/cscan.dart';
import 'package:qr_scanner/widgets/custom_navigator_bar.dart';

class HomePage extends StatelessWidget {
  final Color? elcolor;
  const HomePage({super.key, this.elcolor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lector Qr"),
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigatioBar(),
      floatingActionButton: const ScannButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody();

  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UiProvider>(context);
    final indice = uiprovider.selectedMenuOption;
    DBProvider.db.database;

    switch (indice) {
      case 1:
        return const MapasPages();
      case 2:
        return const DireccionesPage();
      default:
        return const MapasPages();
    }
  }
}
