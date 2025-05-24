import 'package:flutter/material.dart';
import '../../../data/model/categoriesmodel.dart';


class CustomListCategoriesHome extends StatelessWidget {
  final List<CategoriesModel> categories;
  
  const CustomListCategoriesHome({
    Key? key,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 17),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Handle category tap
            },
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 70,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: Image.asset(
                    categories[index].categoriesImage,
                    width: 60,
                    height: 60,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  categories[index].categoriesName,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}