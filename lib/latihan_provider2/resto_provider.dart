
import 'package:flutter/material.dart';

class RestoProvider extends ChangeNotifier {
 
  final List<Map<String, dynamic>> _pesanan = [];

 
  List<Map<String, dynamic>> get pesanan => _pesanan;

 
  int get totalItemPesanan {
    int total = 0;

    for (var item in _pesanan) {
      total += int.tryParse(item['jumlah'].toString()) ?? 0;
    }

    return total;
  }

  
  int get totalBayar {
    int total = 0;

    for (var item in _pesanan) {
      total += int.tryParse(item['subtotal'].toString()) ?? 0;
    }

    return total;
  }

  
  void tambahPesanan(Map<String, dynamic> itemMenu) {
    final String idMenu = itemMenu['id'].toString();

    final int hargaMenu =
        int.tryParse(itemMenu['harga'].toString()) ?? 0;

  
    final indexExisting = _pesanan.indexWhere(
      (element) => element['id'] == idMenu,
    );

    if (indexExisting >= 0) {
      
      final int jumlahLama = int.tryParse(
            _pesanan[indexExisting]['jumlah'].toString(),
          ) ??
          0;

      final int jumlahBaru = jumlahLama + 1;
      final int subtotalBaru = jumlahBaru * hargaMenu;

      _pesanan[indexExisting]['jumlah'] = jumlahBaru.toString();
      _pesanan[indexExisting]['subtotal'] = subtotalBaru.toString();
    } else {
      
      _pesanan.add({
        'id': idMenu,
        'jumlah': '1',
        'harga': hargaMenu.toString(),
        'subtotal': hargaMenu.toString(),
      });
    }

    notifyListeners();
  }

 
  void hapusItemPesanan(String id) {
    _pesanan.removeWhere(
      (item) => item['id'] == id,
    );

    notifyListeners();
  }


  void kosongkanPesanan() {
    _pesanan.clear();

    notifyListeners();
  }
}
