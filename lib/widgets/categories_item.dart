import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoriesItem(this.id, this.title, this.color);

  void _selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed('/category-meals', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // cx có thể dùng GestureDetector
      onTap: () => {
        _selectCategory(context),
      },
      splashColor:
          Theme.of(context).primaryColor, // màu gợn sóng khi ấn vào item
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft, // xác định gradient từ đâu đến đâu
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
