// To parse this JSON data, do
//
//     final modelGetExercises = modelGetExercisesFromJson(jsonString);

import 'dart:convert';

ModelGetExercises modelGetExercisesFromJson(String str) => ModelGetExercises.fromJson(json.decode(str));

String modelGetExercisesToJson(ModelGetExercises data) => json.encode(data.toJson());

class ModelGetExercises {
    int? status;
    List<ExerciseData>? data;

    ModelGetExercises({
        this.status,
        this.data,
    });

    factory ModelGetExercises.fromJson(Map<String, dynamic> json) => ModelGetExercises(
        status: json["status"],
        data: json["data"] == null ? [] : List<ExerciseData>.from(json["data"]!.map((x) => ExerciseData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ExerciseData {
  bool isSelected = false;
    int? exerciseId;
    String? name;
    String? description;
    String? execution;
    String? preparation;
    dynamic instruction;
    List<dynamic>? imagesUrls;
    String? moviesLogoUrl;
    String? movieUrl;
    String? mainMuscle;
    List<String>? secondaryMuscles;
    Mechanics? mechanics;
    Difficulty? difficulty;
    Type? type;
    String? equipment;
    Force? force;
    dynamic userId;
    bool? isPublic;
    dynamic createdAt;
    dynamic updatedAt;
    String? id;

    ExerciseData({
        this.exerciseId,
        this.name,
        this.description,
        this.execution,
        this.preparation,
        this.instruction,
        this.imagesUrls,
        this.moviesLogoUrl,
        this.movieUrl,
        this.mainMuscle,
        this.secondaryMuscles,
        this.mechanics,
        this.difficulty,
        this.type,
        this.equipment,
        this.force,
        this.userId,
        this.isPublic,
        this.createdAt,
        this.updatedAt,
        this.id,
    });

    factory ExerciseData.fromJson(Map<String, dynamic> json) => ExerciseData(
        exerciseId: json["exercise_id"],
        name: json["name"],
        description: json["description"],
        execution: json["execution"],
        preparation: json["preparation"],
        instruction: json["instruction"],
        imagesUrls: json["images_urls"] == null ? [] : List<dynamic>.from(json["images_urls"]!.map((x) => x)),
        moviesLogoUrl: json["movies_logo_url"],
        movieUrl: json["movie_url"],
        mainMuscle: json["main_muscle"],
        secondaryMuscles: json["secondary_muscles"] == null ? [] : List<String>.from(json["secondary_muscles"]!.map((x) => x)),
        mechanics: mechanicsValues.map[json["mechanics"]]!,
        difficulty: difficultyValues.map[json["difficulty"]]!,
        type: typeValues.map[json["type"]]!,
        equipment: json["equipment"],
        force: forceValues.map[json["force"]]!,
        userId: json["user_id"],
        isPublic: json["is_public"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "name": name,
        "description": description,
        "execution": execution,
        "preparation": preparation,
        "instruction": instruction,
        "images_urls": imagesUrls == null ? [] : List<dynamic>.from(imagesUrls!.map((x) => x)),
        "movies_logo_url": moviesLogoUrl,
        "movie_url": movieUrl,
        "main_muscle": mainMuscle,
        "secondary_muscles": secondaryMuscles == null ? [] : List<dynamic>.from(secondaryMuscles!.map((x) => x)),
        "mechanics": mechanicsValues.reverse[mechanics],
        "difficulty": difficultyValues.reverse[difficulty],
        "type": typeValues.reverse[type],
        "equipment": equipment,
        "force": forceValues.reverse[force],
        "user_id": userId,
        "is_public": isPublic,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "id": id,
    };
}

enum Difficulty {
    ADVANCED,
    BEGINNER,
    INTERMEDIATE
}

final difficultyValues = EnumValues({
    "Advanced": Difficulty.ADVANCED,
    "Beginner": Difficulty.BEGINNER,
    "Intermediate": Difficulty.INTERMEDIATE
});

enum Force {
    CARRY,
    JUMP,
    NONE,
    PULL,
    PUSH,
    ROTATION,
    SWING,
    TWIST,
    WAVE
}

final forceValues = EnumValues({
    "Carry": Force.CARRY,
    "Jump": Force.JUMP,
    "None": Force.NONE,
    "Pull": Force.PULL,
    "Push": Force.PUSH,
    "Rotation": Force.ROTATION,
    "Swing": Force.SWING,
    "Twist": Force.TWIST,
    "Wave": Force.WAVE
});

enum Mechanics {
    CARDIO,
    COMPOUND,
    ISOLATION,
    ISOMETRIC,
    STRETCHING
}

final mechanicsValues = EnumValues({
    "Cardio": Mechanics.CARDIO,
    "Compound": Mechanics.COMPOUND,
    "Isolation": Mechanics.ISOLATION,
    "Isometric": Mechanics.ISOMETRIC,
    "Stretching": Mechanics.STRETCHING
});

enum Type {
    AGILITY,
    CARDIO,
    FLEXIBILITY,
    PLYOMETRICS,
    STRENGTH,
    STRENGTH_CARDIO,
    STRENGTH_ENDURANCE,
    STRENGTH_PLYOMETRICS,
    STRENGTH_POWER,
    STRENGTH_STABILITY
}

final typeValues = EnumValues({
    "Agility": Type.AGILITY,
    "Cardio": Type.CARDIO,
    "Flexibility": Type.FLEXIBILITY,
    "Plyometrics": Type.PLYOMETRICS,
    "Strength": Type.STRENGTH,
    "Strength, Cardio": Type.STRENGTH_CARDIO,
    "Strength, Endurance": Type.STRENGTH_ENDURANCE,
    "Strength, Plyometrics": Type.STRENGTH_PLYOMETRICS,
    "Strength, Power": Type.STRENGTH_POWER,
    "Strength, Stability": Type.STRENGTH_STABILITY
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
