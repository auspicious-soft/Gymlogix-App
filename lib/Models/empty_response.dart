import 'package:gymlogix/Models/mixin/model_mixin.dart';

class EmptyResponse with Codable<EmptyResponse> {
  @override
  EmptyResponse fromJson(JsonMap json) {
    return EmptyResponse();
  }
}
