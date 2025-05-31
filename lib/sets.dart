import 'package:beslneme_pusulam/providers/theem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beslneme_pusulam/widgets/Colors.dart';

class BenchPressTracker extends StatefulWidget {
  static const String screenRoute = 'SetsScreen';

  @override
  _BenchPressTrackerState createState() => _BenchPressTrackerState();
}

class _BenchPressTrackerState extends State<BenchPressTracker> {
  final List<Exercise> exercises = [
    Exercise(
      name: 'Bench Press',
      imagePath: 'images/benchPress.webp',
      weightKey: 'bp_weight',
      setsKey: 'bp_sets',
    ),
    Exercise(
      name: 'Squat',
      imagePath: 'images/squat.webp',
      weightKey: 'sq_weight',
      setsKey: 'sq_sets',
    ),
    Exercise(
      name: 'Deadlift',
      imagePath: 'images/deadlift.webp',
      weightKey: 'dl_weight',
      setsKey: 'dl_sets',
    ),
    Exercise(
      name: 'Shoulder Press',
      imagePath: 'images/shoulder_press.webp',
      weightKey: 'sp_weight',
      setsKey: 'sp_sets',
    ),
    Exercise(
      name: 'T Bar Row',
      imagePath: 'images/t_bar_row.webp',
      weightKey: 'br_weight',
      setsKey: 'br_sets',
    ),
    Exercise(
      name: 'Biceps Curl',
      imagePath: 'images/dumbbellCurl.webp',
      weightKey: 'bc_weight',
      setsKey: 'bc_sets',
    ),
    Exercise(
      name: 'Triceps Extension',
      imagePath: 'images/tricepsPushdown.webp',
      weightKey: 'te_weight',
      setsKey: 'te_sets',
    ),
    Exercise(
      name: 'Leg Press',
      imagePath: 'images/leg_press.webp',
      weightKey: 'lp_weight',
      setsKey: 'lp_sets',
    ),
    Exercise(
      name: 'Lat Pulldown',
      imagePath: 'images/lat_pulldown.webp',
      weightKey: 'lat_weight',
      setsKey: 'lat_sets',
    ),
    Exercise(
      name: 'Chest Fly',
      imagePath: 'images/chest_fly.webp',
      weightKey: 'cf_weight',
      setsKey: 'cf_sets',
    ),
  ];

  final Map<String, int> weights = {};
  final Map<String, int> sets = {};

  @override
  void initState() {
    super.initState();
    loadAllData();
  }

  Future<void> loadAllData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      for (var ex in exercises) {
        weights[ex.weightKey] = prefs.getInt(ex.weightKey) ?? 65;
        sets[ex.setsKey] = prefs.getInt(ex.setsKey) ?? 3;
      }
    });
  }

  Future<void> updateValue(String key, int currentValue, bool isWeight) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    TextEditingController controller = TextEditingController(
      text: currentValue.toString(),
    );

    final newValue = await showDialog<int>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('${isWeight ? "Ağırlık" : "Set"} Güncelle'),
            content: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Yeni Değer'),
            ),
            actions: [
              TextButton(
                onPressed:
                    () => Navigator.pop(context, int.tryParse(controller.text)),
                child: Text('Kaydet'),
              ),
            ],
          ),
    );

    if (newValue != null) {
      setState(() {
        if (isWeight) {
          weights[key] = newValue;
        } else {
          sets[key] = newValue;
        }
      });
      await prefs.setInt(key, newValue);
    }
  }

  Widget buildUpdateButton(VoidCallback onPressed, Color color1) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.sync, size: 18),
      label: Text('Güncelle'),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: color1,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 4,
      ),
    );
  }

  Widget buildExerciseCard(Exercise ex, Color color1, Color color2) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              ex.imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ex.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.fitness_center, size: 18, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      'Ağırlık: ${weights[ex.weightKey] ?? 0} kg',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    buildUpdateButton(
                      () => updateValue(
                        ex.weightKey,
                        weights[ex.weightKey]!,
                        true,
                      ),
                      color1,
                    ),
                    // buildUpdateButton(
                    //   () => updateValue(
                    //     ex.weightKey,
                    //     weights[ex.weightKey]!,
                    //     true,
                    //   ),
                    // ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.repeat, size: 18, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      'Set: ${sets[ex.setsKey] ?? 0}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    buildUpdateButton(
                      () => updateValue(ex.setsKey, sets[ex.setsKey]!, false),
                      color1,
                    ),
                    // buildUpdateButton(
                    //   () => updateValue(ex.setsKey, sets[ex.setsKey]!, false),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> resetAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (var ex in exercises) {
      await prefs.setInt(ex.weightKey, 65);
      await prefs.setInt(ex.setsKey, 3);
    }
    setState(() {
      for (var ex in exercises) {
        weights[ex.weightKey] = 65;
        sets[ex.setsKey] = 3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorProvider.mainColor, colorProvider.secondaryColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 125.0),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 80),
                  itemCount: exercises.length,
                  itemBuilder:
                      (context, index) => buildExerciseCard(
                        exercises[index],
                        colorProvider.mainColor,
                        colorProvider.secondaryColor,
                      ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 45,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: AppColors.textColor,
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text(
                          'Uyarı',
                          style: TextStyle(color: AppColors.textbackColor),
                        ),
                        content: Text(
                          'Setleri sıfırlamak istediğinizden emin misiniz?',
                          style: TextStyle(color: AppColors.textbackColor),
                        ),
                        actions: [
                          Expanded(
                            child: IconButton(
                              color: AppColors.textbackColor,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.cancel),
                            ),
                          ),
                          SizedBox(width: 150),
                          Expanded(
                            child: TextButton(
                              onPressed: resetAll,
                              child: Text(
                                'Sıfırla',
                                style: TextStyle(
                                  color: AppColors.textbackColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                );
              },
              child: Icon(Icons.refresh, color: colorProvider.mainColor),
            ),
          ),
          Positioned(
            top: 45,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Exercise {
  final String name;
  final String imagePath;
  final String weightKey;
  final String setsKey;

  Exercise({
    required this.name,
    required this.imagePath,
    required this.weightKey,
    required this.setsKey,
  });
}
