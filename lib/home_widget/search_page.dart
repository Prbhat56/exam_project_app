// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_project_app/home_widget/category_page.dart';
import 'package:exam_project_app/model_list/category_data_list.dart';
import 'package:flutter/material.dart';

import 'package:exam_project_app/models/category_data_model.dart';

class SearchPage extends StatefulWidget {
   
  const SearchPage({
    Key? key,
   
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final List<Category> categories;
    @override
  void initState() {
    super.initState();
  
    categories = CategoryDataList.getCategories();
  }
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Category'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(category: categories[index]);
          },
        ),
      ),
    );
  }
}
