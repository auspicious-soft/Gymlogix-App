 enum ApiEndpoints {
  getFoodPlan,
   
}

extension ApiEndpointsExtension on ApiEndpoints {
  String get value {
    switch (this) {
      case ApiEndpoints.getFoodPlan:return "food/get";
       
    }
  }
}