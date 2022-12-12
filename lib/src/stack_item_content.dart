/// More info of StackItem
abstract class StackItemContent {
  /// to json
  Map<String, dynamic> toJson();

  /// Get new instance by Json after instantiation
  StackItemContent fromJson(Map<String, dynamic> data);
}
