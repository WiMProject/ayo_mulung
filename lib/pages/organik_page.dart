import 'package:flutter/material.dart';
import '../models/waste_item.dart';
import '../widgets/waste_item_card.dart';

class OrganikPage extends StatelessWidget {
  final List<WasteItem> items = [
    WasteItem(
      'Kulit Buah',
      'https://images.unsplash.com/photo-1574226516831-e1dff420e38e?auto=format&fit=crop&w=90&q=80',
      'Kulit buah merupakan limbah organik yang mudah terurai dan dapat dijadikan kompos.',
    ),
    WasteItem(
      'Sisa Sayuran',
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=90&q=80',
      'Sisa sayuran adalah limbah organik yang dapat dimanfaatkan sebagai pupuk organik.',
    ),
    WasteItem(
      'Daun Kering',
      'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?auto=format&fit=crop&w=90&q=80',
      'Daun kering dapat diolah menjadi kompos atau mulsa untuk tanaman.',
    ),
    WasteItem(
      'Nasi Basi',
      'https://cdn.pixabay.com/photo/2016/03/24/22/17/leftover-1275102_960_720.jpg',
      'Nasi basi adalah limbah organik yang dapat diubah menjadi pupuk cair.',
    ),
    WasteItem(
      'Tulang Ikan',
      'https://cdn.pixabay.com/photo/2015/06/09/10/38/fish-bones-804287_960_720.jpg',
      'Tulang ikan mengandung nutrisi yang bermanfaat jika didaur ulang sebagai pupuk.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Organik')),
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
