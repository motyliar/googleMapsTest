// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MarkerModel {
  final String id;
  final double latitude;
  final double longtitude;
  final bool icon;
  final bool icon2;
  final String infoTitle;
  final String onTap;
  MarkerModel({
    required this.id,
    required this.latitude,
    required this.longtitude,
    required this.icon,
    required this.icon2,
    required this.infoTitle,
    required this.onTap,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'latitude': latitude,
      'longtitude': longtitude,
      'icon': icon,
      'icon2': icon2,
      'infoTitle': infoTitle,
      'onTap': onTap,
    };
  }

  factory MarkerModel.fromJson(Map<String, dynamic> json) {
    return MarkerModel(
      id: json['id'] as String,
      latitude: json['latitude'] as double,
      longtitude: json['longtitude'] as double,
      icon: json['icon'] as bool,
      icon2: json['icon2'] as bool,
      infoTitle: json['infoTitle'] as String,
      onTap: json['onTap'] as String,
    );
  }

  MarkerModel copyWith({
    String? id,
    double? latitude,
    double? longtitude,
    bool? icon,
    bool? icon2,
    String? infoTitle,
    String? onTap,
  }) {
    return MarkerModel(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longtitude: longtitude ?? this.longtitude,
      icon: icon ?? this.icon,
      icon2: icon2 ?? this.icon2,
      infoTitle: infoTitle ?? this.infoTitle,
      onTap: onTap ?? this.onTap,
    );
  }

  @override
  String toString() {
    return 'MarkerModel(id: $id, latitude: $latitude, longtitude: $longtitude, icon: $icon, icon2: $icon2, infoTitle: $infoTitle, onTap: $onTap)';
  }
}
