// To parse this JSON data, do
//
//     final getFoodPlanModel = getFoodPlanModelFromJson(jsonString);

import 'dart:convert';

GetFoodPlanModel getFoodPlanModelFromJson(String str) => GetFoodPlanModel.fromJson(json.decode(str));

String getFoodPlanModelToJson(GetFoodPlanModel data) => json.encode(data.toJson());

class GetFoodPlanModel {
    int? status;
    List<FoodPlanData>? foodPlanData;

    GetFoodPlanModel({
        this.status,
        this.foodPlanData,
    });

    factory GetFoodPlanModel.fromJson(Map<String, dynamic> json) => GetFoodPlanModel(
        status: json["status"],
        foodPlanData: json["data"] == null ? [] : List<FoodPlanData>.from(json["data"]!.map((x) => FoodPlanData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": foodPlanData == null ? [] : List<dynamic>.from(foodPlanData!.map((x) => x.toJson())),
    };
}

class FoodPlanData {
    int? foodId;
    int? userId;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? name;
    String? category;
    String? imageUrl;
    String? description;
    List<String>? imageUrls;
    double? servingSizeAmount;
    String? servingSizeMeasurement;
    double? servingWeightGrams;
    double? calories;
    double? carbs;
    double? fat;
    double? protein;
    bool? glutenFree;
    bool? dairyFree;
    bool? nutFree;
    bool? soyFree;
    bool? eggFree;
    bool? isVegan;
    bool? isPaleo;
    bool? isHalal;
    bool? isKosher;
    bool? isPublic;
    String? id;
    dynamic instruction;
    bool? isDeleted;

    FoodPlanData({
        this.foodId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.name,
        this.category,
        this.imageUrl,
        this.description,
        this.imageUrls,
        this.servingSizeAmount,
        this.servingSizeMeasurement,
        this.servingWeightGrams,
        this.calories,
        this.carbs,
        this.fat,
        this.protein,
        this.glutenFree,
        this.dairyFree,
        this.nutFree,
        this.soyFree,
        this.eggFree,
        this.isVegan,
        this.isPaleo,
        this.isHalal,
        this.isKosher,
        this.isPublic,
        this.id,
        this.instruction,
        this.isDeleted,
    });

    factory FoodPlanData.fromJson(Map<String, dynamic> json) => FoodPlanData(
        foodId: json["food_id"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        name: json["name"],
        category: json["category"],
        imageUrl: json["image_url"],
        description: json["description"],
        imageUrls: json["image_urls"] == null ? [] : List<String>.from(json["image_urls"]!.map((x) => x)),
        servingSizeAmount: json["serving_size_amount"]?.toDouble(),
        servingSizeMeasurement: json["serving_size_measurement"],
        servingWeightGrams: json["serving_weight_grams"]?.toDouble(),
        calories: json["calories"]?.toDouble(),
        carbs: json["carbs"]?.toDouble(),
        fat: json["fat"]?.toDouble(),
        protein: json["protein"]?.toDouble(),
        glutenFree: json["gluten_free"],
        dairyFree: json["dairy_free"],
        nutFree: json["nut_free"],
        soyFree: json["soy_free"],
        eggFree: json["egg_free"],
        isVegan: json["is_vegan"],
        isPaleo: json["is_paleo"],
        isHalal: json["is_halal"],
        isKosher: json["is_kosher"],
        isPublic: json["is_public"],
        id: json["id"],
        instruction: json["instruction"],
        isDeleted: json["is_deleted"],
    );

    Map<String, dynamic> toJson() => {
        "food_id": foodId,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "name": name,
        "category": category,
        "image_url": imageUrl,
        "description": description,
        "image_urls": imageUrls == null ? [] : List<dynamic>.from(imageUrls!.map((x) => x)),
        "serving_size_amount": servingSizeAmount,
        "serving_size_measurement": servingSizeMeasurement,
        "serving_weight_grams": servingWeightGrams,
        "calories": calories,
        "carbs": carbs,
        "fat": fat,
        "protein": protein,
        "gluten_free": glutenFree,
        "dairy_free": dairyFree,
        "nut_free": nutFree,
        "soy_free": soyFree,
        "egg_free": eggFree,
        "is_vegan": isVegan,
        "is_paleo": isPaleo,
        "is_halal": isHalal,
        "is_kosher": isKosher,
        "is_public": isPublic,
        "id": id,
        "instruction": instruction,
        "is_deleted": isDeleted,
    };
}
