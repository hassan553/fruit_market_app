part of 'dry_fruit_bloc.dart';

abstract class DryFruitEvent extends Equatable {
  const DryFruitEvent();

  @override
  List<Object> get props => [];
}

class GetIndehiscentDryFruitEvent extends DryFruitEvent {}
class GetDehiscentDryFruitEvent extends DryFruitEvent {}

class GetMixedDryFruitEvent extends DryFruitEvent {}
class GetKashmiriDryFruitEvent extends DryFruitEvent {}
