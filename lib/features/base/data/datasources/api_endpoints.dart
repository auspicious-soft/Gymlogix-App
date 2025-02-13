 enum ApiEndpoints {
  getFoodPlan, getExercises,
   
}

extension ApiEndpointsExtension on ApiEndpoints {
  String get value {
    switch (this) {
      case ApiEndpoints.getFoodPlan:return "food/get";
       
      case ApiEndpoints.getExercises: return "exercise/get";
       
    }
  }
}