import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

import 'stack_item_status.dart';

/// 为StackItem生成Id
/// Generate Id for StackItem
String _genId() {
  final DateTime now = DateTime.now();
  final int value = Random().nextInt(100000);
  return '$value-${now.millisecondsSinceEpoch}';
}

/// 布局核心类
/// 自定义需要继承此类
@immutable
abstract class StackItem {
  StackItem({
    String? id,
    this.size,
    Offset? offset,
    double? angle = 0,
    StackItemStatus? status = StackItemStatus.selected,
  })  : id = id ?? _genId(),
        offset = offset ?? Offset.zero,
        angle = angle ?? 0,
        status = status ?? StackItemStatus.selected;

  const StackItem.empty({
    required this.size,
    required this.offset,
    required this.angle,
    required this.status,
  }) : id = '';

  /// id
  final String id;

  /// Size
  final Size? size;

  /// Offset
  final Offset? offset;

  /// Angle
  final double? angle;

  /// Status
  final StackItemStatus? status;

  /// 实例化后通过这个方法用Json获取新的实例
  /// Get new instance by Json after instantiation
  StackItem fromJson(Map<String, dynamic> data);

  /// 更新基础属性
  /// Update basic attributes
  StackItem updateBasic(
      {Size? size, Offset? offset, double? angle, StackItemStatus? status});

  /// to json
  Map<String, dynamic> toJson();

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) => other is StackItem && id == other.id;
}
