import 'package:flutter/material.dart';
import '../models/waste_item.dart';
import '../widgets/waste_item_card.dart';

class DaurUlangPage extends StatelessWidget {
  final List<WasteItem> items = [
    WasteItem(
      'Kertas Bekas',
      'https://cdn.pixabay.com/photo/2014/04/03/10/01/paper-308438_960_720.png',
      'Kertas bekas dapat didaur ulang menjadi kertas baru atau produk kertas lainnya.',
    ),
    WasteItem(
      'Botol Minum',
      'https://cdn.pixabay.com/photo/2017/10/12/21/53/bottle-2845435_960_720.jpg',
      'Botol minum bekas dapat didaur ulang menjadi produk plastik baru.',
    ),
    WasteItem(
      'Kaleng Minuman',
      'https://cdn.pixabay.com/photo/2017/03/22/16/21/cans-2168710_960_720.jpg',
      'Kaleng minuman dapat dilebur dan digunakan kembali dalam pembuatan kaleng baru.',
    ),
    WasteItem(
      'Kardus',
      'https://cdn.pixabay.com/photo/2016/02/19/11/38/boxes-1209759_960_720.jpg',
      'Kardus bekas bisa didaur ulang menjadi bahan kardus baru atau bahan lain.',
    ),
    WasteItem(
      'Majalah Lama',
      'https://cdn.pixabay.com/photo/2016/11/08/05/26/old-magazines-1807548_960_720.jpg',
      'Majalah lama dapat didaur ulang menjadi kertas daur ulang atau produk kertas lain.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daur Ulang')),
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
