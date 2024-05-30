import 'package:ecommerceapp/categories.dart';
import 'package:ecommerceapp/productlistscreen.dart';
import 'package:ecommerceapp/sortmenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _selectedCategory = '';
  bool _isImage1Visible = true;
  bool isViewChanged = false;
  void toggleImage() {
    setState(() {
      _isImage1Visible = !_isImage1Visible;
      isViewChanged = !isViewChanged;
    });
  }

  void _setSelectedCategory(String category) {
    setState(() {
      if (category.isNotEmpty) {
        _selectedCategory = category;
      } else {
        _selectedCategory = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 45.0, bottom: 10.0, right: 10.0),
                      child: Container(
                        width: 300.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              splashRadius: 1.0,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search_rounded,
                                color: Colors.grey,
                              ),
                            ),
                            const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Image.asset(
                              'assets/icon.jpeg',
                              width: 25,
                              height: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45.0, bottom: 10.0, left: 2.0, right: 10.0),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: (() {
                              SortMenu();
                            }),
                            child: Image.asset(
                              'assets/filter.png',
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Category",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 9,
                  ),
                  CategoryContainer(
                    category: 'Smartphones',
                    onCategorySelected: _setSelectedCategory,
                  ),
                  CategoryContainer(
                    category: 'Laptops',
                    onCategorySelected: _setSelectedCategory,
                  ),
                  CategoryContainer(
                    category: 'Home Decoration',
                    onCategorySelected: _setSelectedCategory,
                  ),
                  CategoryContainer(
                    category: 'Groceries',
                    onCategorySelected: _setSelectedCategory,
                  ),
                  CategoryContainer(
                    category: 'Fragrances',
                    onCategorySelected: _setSelectedCategory,
                  ),
                  CategoryContainer(
                    category: 'Skincare',
                    onCategorySelected: _setSelectedCategory,
                  ),
                  CategoryContainer(
                    category: 'Beauty',
                    onCategorySelected: _setSelectedCategory,
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: (() {
                  toggleImage();
                }),
                child: Container(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45.0, bottom: 10.0, left: 2.0, right: 10.0),
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            (_isImage1Visible == true) ? 'assets/gridview.png' : 'assets/listview.png',
                            width: 25,
                            height: 25,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Expanded(
              child: ProductListScreen(
                  selectedCategory: _selectedCategory.toLowerCase(), isListViewSelected: isViewChanged),
            ),
          ],
        ),
      ),
    );
  }
}
