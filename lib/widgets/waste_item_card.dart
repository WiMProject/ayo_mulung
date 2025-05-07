import 'package:flutter/material.dart';
import '../models/waste_item.dart';

class WasteItemCard extends StatelessWidget {
  final WasteItem item;

  const WasteItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                item.imagePath,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                loadingBuilder:
                    (context, child, progress) =>
                        progress == null
                            ? child
                            : Container(
                              width: 90,
                              height: 90,
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                errorBuilder:
                    (_, __, ___) => Container(
                      width: 90,
                      height: 90,
                      color: Colors.grey[300],
                    ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text(
                    item.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
