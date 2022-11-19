import 'package:flutter/material.dart';
import 'package:gymshare/api/models/exercise.dart';
import 'package:gymshare/components/utils/requests.dart';
import 'package:gymshare/components/utils/routes.dart';
import 'package:gymshare/components/widgets/scroll_configuration.dart';
import 'package:gymshare/pages/workouts/exercise_detail_page.dart';
import 'package:gymshare/settings/colors.dart';

class ExerciseTile extends StatefulWidget {
  final Exercise exercise;

  const ExerciseTile({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  @override
  Widget build(BuildContext context) {
    const widgetHeight = 220.0;

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        createPageRoute(ExerciseDetailPage(exercise: widget.exercise)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: widgetHeight,
          decoration: const BoxDecoration(
            color: quaternaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              buildImage(widgetHeight),
              buildFooter(widgetHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFooter(double widgetHeight) => SizedBox(
        height: widgetHeight * 0.35,
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding:
                const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.exercise.title,
                  style: const TextStyle(color: primaryTextColor, fontSize: 16),
                ),
                Text(
                  'Difficulty: ${widget.exercise.difficulty}',
                  style: const TextStyle(color: primaryTextColor, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      );

  Widget buildImage(double widgetHeight) => Expanded(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                color: secondaryColor,
                image: widget.exercise.thumbnailUrl != null
                    ? DecorationImage(
                        image: NetworkImage(widget.exercise.thumbnailUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: widget.exercise.thumbnailUrl == null
                  ? Center(
                      child: Icon(
                        Icons.hide_image,
                        size: widgetHeight * 0.3,
                      ),
                    )
                  : null,
            ),
            Positioned.fill(
                child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: tertiaryColor,
                  ),
                  height: 40,
                  width: 40,
                  child: Icon(
                    getActivityIcon(widget.exercise.exerciseType),
                    color: primaryColor,
                    size: 30,
                  ),
                ),
              ),
            )),
          ],
        ),
      );

  IconData? getActivityIcon(String exerciseType) {
    switch (exerciseType) {
      case 'With own body weight':
        return Icons.sports_gymnastics;

      case 'With a weight':
        return Icons.fitness_center;

      case 'With time':
        return Icons.timer;

      default:
        return Icons.question_mark;
    }
  }
}

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  late Future<List<Exercise>> _futureExercises;

  @override
  void initState() {
    super.initState();
    _futureExercises = getExercises(context, mounted);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Exercise>>(
      future: _futureExercises,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final exercises = snapshot.data!;
          return ScrollConfig(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 10, left: 20, right: 20),
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                return ExerciseTile(exercise: exercises[index]);
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(color: tertiaryColor),
        );
      },
    );
  }
}