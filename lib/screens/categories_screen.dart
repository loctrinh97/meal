import 'package:flutter/material.dart';

import '../widgets/categories_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView(
        // cross ngang, main dọc. Nếu có quá nhiều item thì dùng GridView.buider sẽ tối ưu performance hơn
        children: DUMMY_CATEGORIES
            .map((catData) => CategoriesItem(
                  catData.id,
                  catData.title,
                  catData.color,
                ))
            .toList(),
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          // xác định chiều rộng tối đa của gridview
          maxCrossAxisExtent: 200, // chiều rộng tối đa của 1 item
          childAspectRatio: 3 / 2, // tỉ lệ 2 cạnh item
          crossAxisSpacing: 20, // khoảng cách giữa các item theo chiều ngang
          mainAxisSpacing: 20, // khoảng cách giữa các item theo chiều dọc
        ),
      );
  }
}
