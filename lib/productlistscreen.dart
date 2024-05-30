// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ProductListScreen extends StatefulWidget {
//   final String selectedCategory;
//   bool isListViewSelected;

//   ProductListScreen({required this.selectedCategory, required this.isListViewSelected});

//   @override
//   _ProductListScreenState createState() => _ProductListScreenState();
// }

// class _ProductListScreenState extends State<ProductListScreen> {
//   late List<dynamic> products;
//   late ScrollController _scrollController;
//   late String _selectedCategoryLower;
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _selectedCategoryLower = widget.selectedCategory.toLowerCase();
//     _scrollController = ScrollController();
//     products = [];
//     fetchProducts(_selectedCategoryLower);
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   Future<void> fetchProducts(String category) async {
//     setState(() {
//       // Show loader while fetching products
//       isLoading = true;
//     });

//     final response = await http.get(Uri.parse('https://dummyjson.com/products'));

//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       final List<dynamic> allProducts = responseData['products'];

//       if (category.isNotEmpty) {
//         // Filtered products based on the selected category
//         final categorizedProducts =
//             allProducts.where((product) => product['category'].toLowerCase() == category.toLowerCase()).toList();
//         setState(() {
//           products = categorizedProducts;
//           isLoading = false; // Hide loader when products are fetched
//         });
//       } else {
//         setState(() {
//           products = allProducts;
//           isLoading = false; // Hide loader when products are fetched
//         });
//       }
//     } else {
//       setState(() {
//         isLoading = false; // Hide loader if there's an error
//       });
//       throw Exception('Failed to load products');
//     }
//   }

//   @override
//   void didUpdateWidget(covariant ProductListScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.selectedCategory != oldWidget.selectedCategory) {
//       fetchProducts(widget.selectedCategory.toLowerCase());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return (isLoading == true)
//         ? Center(
//             child: CircularProgressIndicator(),
//           )
//         : Scrollbar(
//             controller: _scrollController,
//             thickness: 12.0,
//             child: ListView.builder(
//               controller: _scrollController,
//               reverse: false,
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 final product = products[index];
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Card(
//                     elevation: 16,
//                     clipBehavior: Clip.antiAlias,
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: 5.0,
//                           right: 20.0,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(5.0),
//                             child: Container(
//                               color: Colors.black,
//                               padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
//                               child: const Text(
//                                 'Best Seller',
//                                 style: TextStyle(
//                                   fontSize: 7.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 120,
//                           padding: const EdgeInsets.all(0),
//                           child: Row(children: [
//                             Expanded(
//                               flex: 6,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(2.0),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(10.0),
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: NetworkImage(product['thumbnail']),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Spacer(
//                               flex: 1,
//                             ),
//                             Expanded(
//                               flex: 14,
//                               child: Container(
//                                 padding: const EdgeInsets.only(top: 5),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(product['title'],
//                                         style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
//                                     Text(
//                                       product['description'],
//                                       maxLines: 2,
//                                       style: TextStyle(overflow: TextOverflow.ellipsis),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       '\$${product['price']}',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                         fontSize: 20.0,
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ]),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductListScreen extends StatefulWidget {
  final String selectedCategory;
  bool isListViewSelected;

  ProductListScreen({required this.selectedCategory, required this.isListViewSelected});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late List<dynamic> products;
  late ScrollController _scrollController;
  late String _selectedCategoryLower;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _selectedCategoryLower = widget.selectedCategory.toLowerCase();
    _scrollController = ScrollController();
    products = [];
    fetchProducts(_selectedCategoryLower);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchProducts(String category) async {
    setState(() {
      isLoading = true; // Show loader while fetching products
    });

    final response = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final List<dynamic> allProducts = responseData['products'];

      if (category.isNotEmpty) {
        // Filtered products based on the selected category
        final categorizedProducts =
            allProducts.where((product) => product['category'].toLowerCase() == category.toLowerCase()).toList();
        setState(() {
          products = categorizedProducts;
          isLoading = false; // Hide loader when products are fetched
        });
      } else {
        setState(() {
          products = allProducts;
          isLoading = false; // Hide loader when products are fetched
        });
      }
    } else {
      setState(() {
        isLoading = false; // Hide loader if there's an error
      });
      throw Exception('Failed to load products');
    }
  }

  @override
  void didUpdateWidget(covariant ProductListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedCategory != oldWidget.selectedCategory) {
      fetchProducts(widget.selectedCategory.toLowerCase());
    }
  }

  Widget buildProductCard(dynamic product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 16,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned(
              top: 5.0,
              right: 20.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3.0),
                child: Container(
                  color: Colors.black,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 5),
                  child: const Text(
                    'Best Seller',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              child: Row(children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(product['thumbnail']),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 14,
                  child: Padding(
                    padding: EdgeInsets.only(top: (widget.isListViewSelected) ? 15 : 25),
                    child: Container(
                      padding: EdgeInsets.only(top: (widget.isListViewSelected) ? 5 : 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(product['title'],
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: MediaQuery.of(context).size.width < 500
                                    ? 14
                                    : (widget.isListViewSelected)
                                        ? 16
                                        : 13,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Text(
                            product['description'],
                            maxLines: 2,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400,
                              fontSize: (widget.isListViewSelected) ? 14 : 12,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '\$${product['price']}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: (widget.isListViewSelected) ? 17 : 16,
                            ),
                          ),
                          SizedBox(
                            height: (widget.isListViewSelected) ? 10 : 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading == true)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  thickness: 12.0,
                  child: widget.isListViewSelected
                      ? ListView.builder(
                          controller: _scrollController,
                          reverse: false,
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return buildProductCard(product);
                          },
                        )
                      : GridView.builder(
                          controller: _scrollController,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Set the number of columns
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return buildProductCard(product);
                          },
                        ),
                ),
              ),
            ],
          );
  }
}
