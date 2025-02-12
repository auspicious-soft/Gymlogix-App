// To parse this JSON data, do
//
//     final gymPlanModel = gymPlanModelFromJson(jsonString);
 
import 'dart:convert'; 

GymPlanModel gymPlanModelFromJson(String str) => GymPlanModel.fromJson(json.decode(str));

String gymPlanModelToJson(GymPlanModel data) => json.encode(data.toJson());

class GymPlanModel {
    int? status;
    List<GymPlanData>? data;

    GymPlanModel({
        this.status,
        this.data,
    });

    factory GymPlanModel.fromJson(Map<String, dynamic> json) => GymPlanModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<GymPlanData>.from(json["data"]!.map((x) => GymPlanData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class GymPlanData {
    String? id;
    dynamic datumId;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? userId;
    String? name;
    String? imageUrl;
    bool? isPremium;
    bool? isPublic;
    String? type;
    Content? content;
    int? planId;
    List<String>? tags;

    GymPlanData({
        this.id,
        this.datumId,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.name,
        this.imageUrl,
        this.isPremium,
        this.isPublic,
        this.type,
        this.content,
        this.planId,
        this.tags,
    });

    factory GymPlanData.fromJson(Map<String, dynamic> json) => GymPlanData(
        id: json["_id"],
        datumId: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
        name: json["name"],
        imageUrl: json["image_url"],
        isPremium: json["is_premium"],
        isPublic: json["is_public"],
        type: json["type"],
        content: json["content"] == null ? null : Content.fromJson(json["content"]),
        planId: json["plan_id"],
        tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "id": datumId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_id": userId,
        "name": name,
        "image_url": imageUrl,
        "is_premium": isPremium,
        "is_public": isPublic,
        "type": type,
        "content": content?.toJson(),
        "plan_id": planId,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    };
}

class Content {
    String? goal;
    String? details;
    dynamic instructions;
    String? daysPerWeek;
    String? type;
    String? location;
    String? duration;
    String? difficulty;
    int? associateFoodPlan;
    List<Workout>? workouts;
    String? description;
    dynamic caloriesPerDay;
    String? dietryType;
    String? mealsPerDay;
    dynamic carbsPerDay;
    dynamic fatsPerDay;
    dynamic protienPerDay;
    String? associateWorkoutPlan;
    dynamic proteinPerDay;
    List<Meal>? meals;

    Content({
        this.goal,
        this.details,
        this.instructions,
        this.daysPerWeek,
        this.type,
        this.location,
        this.duration,
        this.difficulty,
        this.associateFoodPlan,
        this.workouts,
        this.description,
        this.caloriesPerDay,
        this.dietryType,
        this.mealsPerDay,
        this.carbsPerDay,
        this.fatsPerDay,
        this.protienPerDay,
        this.associateWorkoutPlan,
        this.proteinPerDay,
        this.meals,
    });

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        goal: json["goal"],
        details: json["details"],
        instructions: json["instructions"],
        daysPerWeek: json["days_per_week"],
        type: json["type"],
        location: json["location"],
        duration: json["duration"],
        difficulty: json["difficulty"],
        associateFoodPlan: json["associate_food_plan"],
        workouts: json["workouts"] == null ? [] : List<Workout>.from(json["workouts"]!.map((x) => Workout.fromJson(x))),
        description: json["description"],
        caloriesPerDay: json["calories_per_day"],
        dietryType: json["dietry_type"],
        mealsPerDay: json["meals_per_day"],
        carbsPerDay: json["carbs_per_day"],
        fatsPerDay: json["fats_per_day"],
        protienPerDay: json["protien_per_day"],
        associateWorkoutPlan: json["associate_workout_plan"],
        proteinPerDay: json["protein_per_day"],
        meals: json["meals"] == null ? [] : List<Meal>.from(json["meals"]!.map((x) => Meal.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "goal": goal,
        "details": details,
        "instructions": instructions,
        "days_per_week": daysPerWeek,
        "type": type,
        "location": location,
        "duration": duration,
        "difficulty": difficulty,
        "associate_food_plan": associateFoodPlan,
        "workouts": workouts == null ? [] : List<dynamic>.from(workouts!.map((x) => x.toJson())),
        "description": description,
        "calories_per_day": caloriesPerDay,
        "dietry_type": dietryType,
        "meals_per_day": mealsPerDay,
        "carbs_per_day": carbsPerDay,
        "fats_per_day": fatsPerDay,
        "protien_per_day": protienPerDay,
        "associate_workout_plan": associateWorkoutPlan,
        "protein_per_day": proteinPerDay,
        "meals": meals == null ? [] : List<dynamic>.from(meals!.map((x) => x.toJson())),
    };
}

class Meal {
    int? mealId;
    String? color;
    List<String>? filters;

    Meal({
        this.mealId,
        this.color,
        this.filters,
    });

    factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        mealId: json["meal_id"],
        color: json["color"],
        filters: json["filters"] == null ? [] : List<String>.from(json["filters"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "meal_id": mealId,
        "color": color,
        "filters": filters == null ? [] : List<dynamic>.from(filters!.map((x) => x)),
    };
}

class Workout {
    int? workoutId;
    String? name;
    String? color;
    dynamic restPeriod;
    dynamic comments;
    List<Exercise>? exercises;

    Workout({
        this.workoutId,
        this.name,
        this.color,
        this.restPeriod,
        this.comments,
        this.exercises,
    });

    factory Workout.fromJson(Map<String, dynamic> json) => Workout(
        workoutId: json["workout_id"],
        name: json["name"],
        color: json["color"],
        restPeriod: json["rest_period"],
        comments: json["comments"],
        exercises: json["exercises"] == null ? [] : List<Exercise>.from(json["exercises"]!.map((x) => Exercise.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "workout_id": workoutId,
        "name": name,
        "color": color,
        "rest_period": restPeriod,
        "comments": comments,
        "exercises": exercises == null ? [] : List<dynamic>.from(exercises!.map((x) => x.toJson())),
    };
}

class Exercise {
    Type? type;
    int? warmupCycleTiming;
    int? betweenExerciseTiming;
    int? fullCycleTiming;
    List<WorkoutExercise>? workoutExercises;

    Exercise({
        this.type,
        this.warmupCycleTiming,
        this.betweenExerciseTiming,
        this.fullCycleTiming,
        this.workoutExercises,
    });

    factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        type: typeValues.map[json["type"]]!,
        warmupCycleTiming: json["warmup_cycle_timing"],
        betweenExerciseTiming: json["between_exercise_timing"],
        fullCycleTiming: json["full_cycle_timing"],
        workoutExercises: json["workout_exercises"] == null ? [] : List<WorkoutExercise>.from(json["workout_exercises"]!.map((x) => WorkoutExercise.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "warmup_cycle_timing": warmupCycleTiming,
        "between_exercise_timing": betweenExerciseTiming,
        "full_cycle_timing": fullCycleTiming,
        "workout_exercises": workoutExercises == null ? [] : List<dynamic>.from(workoutExercises!.map((x) => x.toJson())),
    };
}

enum Type {
    SINGLE
}

final typeValues = EnumValues({
    "single": Type.SINGLE
});

class WorkoutExercise {
    int? exerciseId;
    int? sets;
    dynamic reps;
    Strategy? strategy;
    int? timingWarmup;
    int? timingWorkset;
    int? timingFinish;
    bool? isTime;
    bool? isWeight;
    bool? isDistance;
    List<dynamic>? alternateExerciseId;

    WorkoutExercise({
        this.exerciseId,
        this.sets,
        this.reps,
        this.strategy,
        this.timingWarmup,
        this.timingWorkset,
        this.timingFinish,
        this.isTime,
        this.isWeight,
        this.isDistance,
        this.alternateExerciseId,
    });

    factory WorkoutExercise.fromJson(Map<String, dynamic> json) => WorkoutExercise(
        exerciseId: json["exercise_id"],
        sets: json["sets"],
        reps: json["reps"],
        strategy: strategyValues.map[json["strategy"]]!,
        timingWarmup: json["timing_warmup"],
        timingWorkset: json["timing_workset"],
        timingFinish: json["timing_finish"],
        isTime: json["Is_time"],
        isWeight: json["is_weight"],
        isDistance: json["Is_distance"],
        alternateExerciseId: json["alternate_exercise_id"] == null ? [] : List<dynamic>.from(json["alternate_exercise_id"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "sets": sets,
        "reps": reps,
        "strategy": strategyValues.reverse[strategy],
        "timing_warmup": timingWarmup,
        "timing_workset": timingWorkset,
        "timing_finish": timingFinish,
        "Is_time": isTime,
        "is_weight": isWeight,
        "Is_distance": isDistance,
        "alternate_exercise_id": alternateExerciseId == null ? [] : List<dynamic>.from(alternateExerciseId!.map((x) => x)),
    };
}

enum Strategy {
    THE_2_X15,
    THE_2_X1_MIN,
    THE_3_X10,
    THE_3_X12,
    THE_3_X30_MIN_60_MIN,
    THE_3_X6,
    THE_3_X8,
    THE_4_X10,
    THE_4_X12,
    THE_4_X6_8,
    THE_4_X8
}

final strategyValues = EnumValues({
    "2x15": Strategy.THE_2_X15,
    "2x1min": Strategy.THE_2_X1_MIN,
    "3x10": Strategy.THE_3_X10,
    "3x12": Strategy.THE_3_X12,
    "3x30min-60min": Strategy.THE_3_X30_MIN_60_MIN,
    "3x6": Strategy.THE_3_X6,
    "3x8": Strategy.THE_3_X8,
    "4x10": Strategy.THE_4_X10,
    "4x12": Strategy.THE_4_X12,
    "4x6-8": Strategy.THE_4_X6_8,
    "4x8": Strategy.THE_4_X8
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
