import 'package:flutter/material.dart';

class ProductGridPage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'title': 'MacBook Pro 16"',
      'price': '\$2,399',
      'image':
          'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=800',
    },
    {
      'title': 'Wireless Headphones',
      'price': '\$299',
      'image':
          'https://new-edifier-us-oss.edifier.com/images/20250221/45d5166cb0147aa0c5ecad3743e0f625.png',
    },
    {
      'title': 'Smart Watch',
      'price': '\$399',
      'image':
          'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?w=800',
    },
    {
      'title': 'Designer Backpack',
      'price': '\$129',
      'image':
          'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=800',
    },
    {
      'title': 'Premium Keyboard',
      'price': '\$199',
      'image': 'https://rog.asus.com/media/1671665076406.jpg',
    },
    {
      'title': 'Wireless Mouse',
      'price': '\$79',
      'image':
          'https://www.lemokey.com/cdn/shop/files/Lemokey-G1-wireless-mouse-black.jpg?v=1721803330&width=713',
    },
  ];

  ProductGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * 0.4,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          product['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            child: IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 18,
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "${product['title']} added to cart",
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        product['price'],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
