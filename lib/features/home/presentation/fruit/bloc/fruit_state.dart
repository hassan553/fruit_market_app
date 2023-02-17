part of 'fruit_bloc.dart';

class FruitState extends Equatable {
  final CollectionModel organicCollection;
  final RequestState organicState;
  final String organicErrorMessage;
  final CollectionModel mixedFruitCollection;
  final RequestState mixedFruitState;
  final String mixedFruitErrorMessage;
  final CollectionModel melonsCollection;
  final RequestState melonsState;
  final String melonsErrorMessage;
  final CollectionModel stoneFruitCollection;
  final RequestState stoneFruitState;
  final String stoneFruitErrorMessage;
  const FruitState({
    this.organicCollection = const CollectionModel(),
    this.organicState = RequestState.loading,
    this.organicErrorMessage = '',
    this.mixedFruitCollection = const CollectionModel(),
    this.mixedFruitState = RequestState.loading,
    this.mixedFruitErrorMessage = '',
    this.melonsCollection = const CollectionModel(),
    this.melonsState = RequestState.loading,
    this.melonsErrorMessage = '',
    this.stoneFruitCollection = const CollectionModel(),
    this.stoneFruitState = RequestState.loading,
    this.stoneFruitErrorMessage = '',
  });
  FruitState copyWith({
    CollectionModel? organicCollection,
    RequestState? organicState,
    String? organicErrorMessage,
    CollectionModel? mixedFruitCollection,
    RequestState? mixedFruitState,
    String? mixedFruitErrorMessage,
    CollectionModel? melonsCollection,
    RequestState? melonsState,
    String? melonsErrorMessage,
    CollectionModel? stoneFruitCollection,
    RequestState? stoneFruitState,
    String? stoneFruitErrorMessage,
  }) {
    return FruitState(
      organicCollection: organicCollection ?? this.organicCollection,
      organicState: organicState ?? this.organicState,
      organicErrorMessage: organicErrorMessage ?? this.organicErrorMessage,
      mixedFruitCollection: mixedFruitCollection ?? this.mixedFruitCollection,
      mixedFruitState: mixedFruitState ?? this.mixedFruitState,
      mixedFruitErrorMessage:
          mixedFruitErrorMessage ?? this.mixedFruitErrorMessage,
      melonsCollection: melonsCollection ?? this.melonsCollection,
      melonsState: melonsState ?? this.melonsState,
      melonsErrorMessage: melonsErrorMessage ?? this.melonsErrorMessage,
      stoneFruitCollection: stoneFruitCollection ?? this.stoneFruitCollection,
      stoneFruitState: stoneFruitState ?? this.stoneFruitState,
      stoneFruitErrorMessage:
          stoneFruitErrorMessage ?? this.stoneFruitErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        organicCollection,
        organicErrorMessage,
        organicState,
        mixedFruitCollection,
        mixedFruitErrorMessage,
        mixedFruitState,
        melonsCollection,
        melonsErrorMessage,
        melonsState,
        stoneFruitCollection,
        stoneFruitErrorMessage,
        stoneFruitState,
      ];
}
