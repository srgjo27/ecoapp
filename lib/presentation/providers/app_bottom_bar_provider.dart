import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavStates extends Equatable {
  const NavStates({
    this.index = 0,
  });

  final int index;

  NavStates copyWith({
    int? index,
  }) {
    return NavStates(
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [index];
}

class NavNotifier extends StateNotifier<NavStates> {
  NavNotifier() : super(const NavStates());

  void onChangeIndex(int index) {
    state = state.copyWith(index: index);
  }
}

final navProvider = StateNotifierProvider<NavNotifier, NavStates>((ref) {
  return NavNotifier();
});
