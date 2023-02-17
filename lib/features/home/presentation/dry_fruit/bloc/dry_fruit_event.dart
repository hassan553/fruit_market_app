part of 'dry_fruit_bloc.dart';

abstract class DryFruitEvent extends Equatable {
  const DryFruitEvent();

  @override
  List<Object> get props => [];
}

class GetOrganicDryFruitEvent extends DryFruitEvent {}

class GetMixedDryFruitEvent extends DryFruitEvent {}
