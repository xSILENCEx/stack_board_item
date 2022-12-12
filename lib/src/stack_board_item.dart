import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

import 'stack_item_status.dart';

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

  final String id;
  final Size? size;
  final Offset? offset;
  final double? angle;
  final StackItemStatus? status;

  StackItem fromJson(Map<String, dynamic> data);

  StackItem updateBasic(
      {Size? size, Offset? offset, double? angle, StackItemStatus? status});

  Map<String, dynamic> toJson();

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) => other is StackItem && id == other.id;
}
