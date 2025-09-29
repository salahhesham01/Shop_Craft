import 'package:flutter/material.dart';

class OffersListView extends StatelessWidget {
  const OffersListView({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = [
      {
        'title': '50% Off Electronics',
        'subtitle': 'Limited time offer on all tech gadgets',
        'tag': '50% OFF',
      },
      {
        'title': 'Free Shipping Weekend',
        'subtitle': 'No delivery charges on orders above \$50',
        'tag': 'FREE SHIP',
      },
      {
        'title': 'Buy 2 Get 1 Free',
        'subtitle': 'On selected accessories and peripherals',
        'tag': 'B2G1',
      },
      {
        'title': 'Student Discount',
        'subtitle': 'Extra 20% off with valid student ID',
        'tag': '20% OFF',
      },
      {
        'title': 'Bundle Deals',
        'subtitle': 'Save more when you buy complete setups',
        'tag': 'BUNDLE',
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: offers.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) {
        final offer = offers[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 3,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        offer['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        offer['subtitle']!,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.purple, Colors.pink],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            offer['tag']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
