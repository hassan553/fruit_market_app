part of 'vegetables_bloc.dart';


abstract class VegetablesEvent extends Equatable {
  const VegetablesEvent();

  @override
  List<Object> get props => [];
}

class GetOrganicVegetablesEvent extends VegetablesEvent {}

class GetMixedVegetablesEvent extends VegetablesEvent {}

class GetRootVegetablesEvent extends VegetablesEvent {}

class GetAlliumVegetablesEvent extends VegetablesEvent {}
