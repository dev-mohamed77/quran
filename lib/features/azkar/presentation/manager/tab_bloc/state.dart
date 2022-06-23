import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TabState extends Equatable {
  final bool firstTab;
  final PageController controller;
  const TabState({
    required this.firstTab,
    required this.controller,
  });
  @override
  List<Object> get props => [firstTab, controller];
}
