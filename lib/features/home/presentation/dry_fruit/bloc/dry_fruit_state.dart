part of 'dry_fruit_bloc.dart';

class DryFruitState extends Equatable {
  final CollectionModel organicCollection;
  final RequestState organicState;
  final String organicErrorMessage;
  final CollectionModel mixedDryFruitCollection;
  final RequestState mixedDryFruitState;
  final String mixedDryFruitErrorMessage;

  const DryFruitState({
    this.organicCollection = const CollectionModel(),
    this.organicState = RequestState.loading,
    this.organicErrorMessage = '',
    this.mixedDryFruitCollection = const CollectionModel(),
    this.mixedDryFruitState = RequestState.loading,
    this.mixedDryFruitErrorMessage = '',
  });
  DryFruitState copyWith({
    CollectionModel? organicCollection,
    RequestState? organicState,
    String? organicErrorMessage,
    CollectionModel? mixedDryFruitCollection,
    RequestState? mixedDryFruitState,
    String? mixedDryFruitErrorMessage,
  }) {
    return DryFruitState(
      organicCollection: organicCollection ?? this.organicCollection,
      organicState: organicState ?? this.organicState,
      organicErrorMessage: organicErrorMessage ?? this.organicErrorMessage,
      mixedDryFruitCollection:
          mixedDryFruitCollection ?? this.mixedDryFruitCollection,
      mixedDryFruitState: mixedDryFruitState ?? this.mixedDryFruitState,
      mixedDryFruitErrorMessage:
          mixedDryFruitErrorMessage ?? this.mixedDryFruitErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [organicCollection, organicErrorMessage, organicState];
}
