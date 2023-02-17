part of 'fruit_bloc.dart';

abstract class FruitEvent extends Equatable {
  const FruitEvent();

  @override
  List<Object> get props => [];
}

class GetOrganicFruitEvent extends FruitEvent {}

class GetMixedFruitEvent extends FruitEvent {}

class GetMelonsFruitEvent extends FruitEvent {}

class GetStoneFruitEvent extends FruitEvent {}
