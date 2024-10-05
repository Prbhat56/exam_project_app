import 'package:exam_project_app/models/category_data_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(8), // Adjusted padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible( // Wrapped in a Flexible widget
              child: Image.network(
                category.imagePath,
                fit: BoxFit.cover, // Adjusted to fit the image within the container
              ),
            ),
            SizedBox(height: 8), // Reduced size
            Text(
              category.name,
              style: TextStyle(
                fontSize: 16, // Adjusted font size
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${category.numberOfQuizzes} Quizzes',
              style: TextStyle(fontSize: 14), // Adjusted font size
            ),
          ],
        ),
      ),
    );
  }
}
