import 'package:exam_project_app/models/quiz_model.dart';
import 'package:exam_project_app/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
        
            Padding(
              padding: const EdgeInsets.only(top: 30,right: 16,left: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Good Morning, ${user.name}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Icon(Icons.person, size: 24, color: Colors.purple),
                ],
              ),
            ),
            UserScoreCard(),
            FeaturedSection(),
            QuizListSection(quizzes: quizzes,),
          ],
        ),
      ),
    );
  }
}

class UserScoreCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double userScore = 0.65; // Represents 65%
    final Color cardBackgroundColor = Colors.indigo.shade100; // Light violet/indigo color

    return Card(
      color: cardBackgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RECENT QUIZ',
                    style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A Basic Music Quiz',
                    style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Circular progress indicator
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 80.0, // Fixed size for the circular progress
                  height: 80.0,
                  child: CircularProgressIndicator(
                    value: userScore,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.deepPurple,
                    strokeWidth: 6,
                  ),
                ),
                Text(
                  '${(userScore * 100).toInt()}%',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color cardBackgroundColor = Colors.indigo.shade100; // Light violet/indigo color

    return Card(
      color: cardBackgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FEATURED',
              style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Take part in challenges with friends or other players',
              style: TextStyle(color: Colors.black87),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: Text('Find Friends'),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                onPrimary: Colors.white, // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class QuizListSection extends StatelessWidget {
  final List<Quiz> quizzes;

  QuizListSection({required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Live Quizzes',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllQuizzesPage(quizzes: quizzes)),
                  );
                },
                child: Text(
                  'See all',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: quizzes.length,
          itemBuilder: (context, index) {
            return QuizListItem(quiz: quizzes[index]);
          },
        ),
      ],
    );
  }
}

class QuizListItem extends StatelessWidget {
  final Quiz quiz;

  QuizListItem({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(quiz.imageUrl), // Display the network image
          radius: 24,
        ),
        title: Text(quiz.title),
        subtitle: Text('${quiz.category} • ${quiz.numberOfQuizzes} Quizzes'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}

class AllQuizzesPage extends StatelessWidget {
  final List<Quiz> quizzes;

  AllQuizzesPage({required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Quizzes'),
      ),
      body: ListView.builder(
        itemCount: quizzes.length,
        itemBuilder: (context, index) {
          return QuizListItem(quiz: quizzes[index]);
        },
      ),
    );
  }
}


