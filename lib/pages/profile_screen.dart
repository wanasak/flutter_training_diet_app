import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:training_diet_app/models/meal.dart';
import 'package:training_diet_app/pages/meal_detail_screen.dart';
import 'package:training_diet_app/pages/workout_screen.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final today = DateTime.now();

    return Scaffold(
        backgroundColor: Colors.grey[350],
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          child: BottomNavigationBar(
              iconSize: 40,
              selectedIconTheme: IconThemeData(color: Colors.grey[700]),
              unselectedIconTheme: IconThemeData(color: Colors.black12),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.home),
                  ),
                  title: Text("Home", style: TextStyle(color: Colors.white)),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text("Search", style: TextStyle(color: Colors.white)),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Profile", style: TextStyle(color: Colors.white)),
                ),
              ]),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              height: height * 0.31,
              left: 0,
              right: 0,
              child: ClipRRect(
                child: Container(
                  padding: EdgeInsets.only(top: 24, left: 4),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(
                          "${DateFormat("EEEE").format(today)}, ${DateFormat("d MMMM").format(today)}",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        subtitle: Text(
                          "Hello Smudger",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        trailing: ClipOval(
                            child: Image.asset("assets/images/user.jpg")),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            _RadialProgress(
                                width: width * 0.4, height: height * 0.1),
                            Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _IngredientProgress(
                                  ingredient: "Protein",
                                  leftAmount: 72,
                                  progress: 0.3,
                                  progressColor: Colors.red,
                                  width: width * 0.4,
                                ),
                                _IngredientProgress(
                                  ingredient: "Carbs",
                                  leftAmount: 252,
                                  progress: 0.2,
                                  progressColor: Colors.green,
                                  width: width * 0.4,
                                ),
                                _IngredientProgress(
                                  ingredient: "Fats",
                                  leftAmount: 61,
                                  progress: 0.1,
                                  progressColor: Colors.yellow,
                                  width: width * 0.4,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40)),
              ),
            ),
            Positioned(
              top: height * 0.32,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.transparent,
                height: height * 0.57,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8, left: 16),
                      child: Text(
                        "Meals for today",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 16,
                          ),
                          for (int i = 0; i < meals.length; i++)
                            _MealCard(
                              meal: meals[i],
                            ),
                        ],
                      ),
                    )),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WorkoutScreen()));
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(bottom: 10, left: 16, right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.indigo[700],
                                  Colors.indigo[900],
                                ])),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 12),
                              child: Text(
                                "YOUR NEXT WORKOUT",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 4),
                              child: Text(
                                "UPPER BODY",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    padding: EdgeInsets.all(10),
                                    child: IconButton(
                                        icon: Image.asset(
                                          "assets/images/chest.png",
                                          width: 50,
                                          height: 50,
                                          color: Colors.white,
                                        ),
                                        onPressed: null),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    padding: EdgeInsets.all(10),
                                    child: IconButton(
                                        icon: Image.asset(
                                          "assets/images/back.png",
                                          width: 50,
                                          height: 50,
                                          color: Colors.white,
                                        ),
                                        onPressed: null),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white30,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    padding: EdgeInsets.all(10),
                                    child: IconButton(
                                        icon: Image.asset(
                                          "assets/images/biceps.png",
                                          width: 50,
                                          height: 50,
                                          color: Colors.white,
                                        ),
                                        onPressed: null),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class _RadialProgress extends StatelessWidget {
  final double width, height, progress;

  const _RadialProgress({Key key, this.width, this.height, this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: 0.7),
      child: Container(
        width: this.width,
        height: this.height,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: "1736",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: Colors.black)),
              TextSpan(text: "\n"),
              TextSpan(
                  text: "kcal left",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: Colors.black)),
            ]),
          ),
        ),
      ),
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 7
      ..color = Colors.indigo[800]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    // canvas.drawCircle(center, size.width / 2, paint);
    double relativeProgress = 360 * progress;
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 3.4),
        math.radians(0), math.radians(relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _MealCard extends StatelessWidget {
  final Meal meal;

  const _MealCard({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MealDetailScreen(
                    meal: meal,
                  )));
        },
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                    child: Image.asset(
                      meal.imagePath,
                      width: 150,
                      fit: BoxFit.fill,
                    )),
                fit: FlexFit.tight,
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          meal.mealTime,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.blueGrey),
                        ),
                        Text(meal.name,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                color: Colors.black)),
                        Text(
                          "${meal.kiloCaloriesBurnt} kcal",
                          style:
                              TextStyle(fontSize: 12, color: Colors.blueGrey),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 15,
                              color: Colors.black12,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text("${meal.timeTaken} min",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.blueGrey)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredient;
  final double leftAmount, progress, width;
  final Color progressColor;

  const _IngredientProgress(
      {Key key,
      this.ingredient,
      this.leftAmount,
      this.progress,
      this.width,
      this.progressColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                  height: 6.5,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
                Container(
                  height: 6.5,
                  width: width * progress,
                  decoration: BoxDecoration(
                      color: progressColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                ),
              ],
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              "${leftAmount}g left",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        )
      ],
    );
  }
}
