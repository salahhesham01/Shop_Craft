import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final PageController _controller = PageController();

  final List<Map<String, String>> pages = [
    {
      'image':
          'https://www.gorefurbo.com/cdn/shop/collections/1120X1200_Banner_3.png?v=1673007176&width=2000',
      'title': 'Premium Laptop Collection',
    },
    {
      'image':
          'https://d1io3yog0oux5.cloudfront.net/_fe3efedf9abfe0d3341e5e572b7e3f78/adcc/db/361/2421/featured_image_article.jpg',
      'title': 'Professional Workspace',
    },
    {
      'image':
          'https://www.baselinehk.com/storage/2024/10/How-To-Get-Ambient-Lighting-Right-for-the-Mood-Tips-and-Tricks.jpg',
      'title': 'Ambient Lighting',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(pages[index]['image']!, fit: BoxFit.cover),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Text(
                          pages[index]['title']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 8,
                                color: Colors.black87,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        SmoothPageIndicator(
          controller: _controller,
          count: pages.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.purple,
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
      ],
    );
  }
}
