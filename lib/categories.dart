// import 'package:flutter/material.dart';

// class CategoryContainer extends StatefulWidget {
//   final String category;
//   final Function(String) onCategorySelected;

//   CategoryContainer({required this.category, required this.onCategorySelected});

//   @override
//   _CategoryContainerState createState() => _CategoryContainerState();
// }

// class _CategoryContainerState extends State<CategoryContainer> {
//   bool _isSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () {
//             setState(() {
//               _isSelected = !_isSelected;
//             });
//             widget.onCategorySelected(widget.category); // Pass the selected category to the callback function
//           },
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10.0),
//             child: Container(
//               alignment: Alignment.center,
//               width: (widget.category == "Home Decoration")
//                   ? 130
//                   : (widget.category == "Laptops")
//                       ? 100
//                       : 120.0,
//               height: 30.0,
//               decoration: BoxDecoration(
//                 color: _isSelected ? Colors.black : Colors.grey.shade200,
//                 borderRadius: BorderRadius.all(Radius.circular(50.0)),
//               ),
//               child: Text(
//                 widget.category,
//                 style: TextStyle(
//                   color: _isSelected ? Colors.white : Colors.grey,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class CategoryContainer extends StatefulWidget {
  final String category;
  final Function(String) onCategorySelected;

  CategoryContainer({required this.category, required this.onCategorySelected});

  @override
  _CategoryContainerState createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  bool _isSelected = false;
  bool _isImage1Visible = true;

  void toggleImage() {
    setState(() {
      _isImage1Visible = !_isImage1Visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isSelected = !_isSelected;
            });
            widget.onCategorySelected(widget.category); // Pass the selected category to the callback function
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              alignment: Alignment.center,
              width: (widget.category == "Home Decoration")
                  ? 130
                  : (widget.category == "Laptops")
                      ? 100
                      : 120.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: _isSelected ? Colors.black : Colors.grey.shade200,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
              child: Text(
                widget.category,
                style: TextStyle(
                  color: _isSelected ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
