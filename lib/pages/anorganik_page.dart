import 'package:flutter/material.dart';
import '../models/waste_item.dart';
import '../widgets/waste_item_card.dart';

class AnorganikPage extends StatelessWidget {
  final List<WasteItem> items = [
    WasteItem(
      'Botol Plastik',
      'https://cdn.pixabay.com/photo/2016/03/28/12/15/plastic-bottle-1283386_960_720.jpg',
      'Botol plastik adalah limbah anorganik yang dapat didaur ulang menjadi produk baru.',
    ),
    WasteItem(
      'Kaleng',
      'https://cdn.pixabay.com/photo/2013/07/12/15/52/aluminium-can-147448_960_720.png',
      'Kaleng minuman dapat dilebur dan diolah kembali untuk pembuatan kaleng baru.',
    ),
    WasteItem(
      'Kaca Pecah',
      'https://cdn.pixabay.com/photo/2018/06/07/14/16/fragments-3460109_960_720.jpg',
      'Kaca pecah perlu penanganan khusus dan bisa didaur ulang menjadi produk kaca lainnya.',
    ),
    WasteItem(
      'Kantong Kresek',
      'https://cdn.pixabay.com/photo/2018/11/13/21/14/plastic-bags-3816978_960_720.jpg',
      'Kantong kresek adalah plastik yang bisa didaur ulang menjadi produk plastik lain.',
    ),
    WasteItem(
      'Styrofoam',
      'https://cdn.pixabay.com/photo/2017/04/20/16/45/foam-box-2241126_960_720.jpg',
      'Styrofoam sulit terurai dan biasanya diolah melalui proses daur ulang khusus.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anorganik')),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return WasteItemCard(item: item);
        },
      ),
    );
  }
}
