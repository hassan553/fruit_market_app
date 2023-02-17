part of 'vegetables_bloc.dart';


class VegetablesState extends Equatable {
  final CollectionModel organicCollection;
  final RequestState organicState;
  final String organicErrorMessage;
  final CollectionModel mixedVegetablesCollection;
  final RequestState mixedVegetablesState;
  final String mixedVegetablesErrorMessage;
  final CollectionModel rootCollection;
  final RequestState rootState;
  final String rootErrorMessage;
  final CollectionModel alliumCollection;
  final RequestState alliumState;
  final String alliumErrorMessage;
  const VegetablesState({
    this.organicCollection = const CollectionModel(),
    this.organicState = RequestState.loading,
    this.organicErrorMessage = '',
    this.mixedVegetablesCollection = const CollectionModel(),
    this.mixedVegetablesState = RequestState.loading,
    this.mixedVegetablesErrorMessage = '',
    this.rootCollection = const CollectionModel(),
    this.rootState = RequestState.loading,
    this.rootErrorMessage = '',
    this.alliumCollection = const CollectionModel(),
    this.alliumState = RequestState.loading,
    this.alliumErrorMessage = '',
  });
  VegetablesState copyWith({
    CollectionModel? organicCollection,
    RequestState? organicState,
    String? organicErrorMessage,
    CollectionModel? mixedVegetablesCollection,
    RequestState? mixedVegetablesState,
    String? mixedVegetablesErrorMessage,
    CollectionModel? rootCollection,
    RequestState? rootState,
    String? rootErrorMessage,
    CollectionModel? alliumCollection,
    RequestState? alliumState,
    String? alliumErrorMessage,
  }) {
    return VegetablesState(
      organicCollection: organicCollection ?? this.organicCollection,
      organicState: organicState ?? this.organicState,
      organicErrorMessage: organicErrorMessage ?? this.organicErrorMessage,
      mixedVegetablesCollection: mixedVegetablesCollection ?? this.mixedVegetablesCollection,
      mixedVegetablesState: mixedVegetablesState ?? this.mixedVegetablesState,
      mixedVegetablesErrorMessage:
          mixedVegetablesErrorMessage ?? this.mixedVegetablesErrorMessage,
      rootCollection: rootCollection ?? this.rootCollection,
      rootState: rootState ?? this.rootState,
      rootErrorMessage: rootErrorMessage ?? this.rootErrorMessage,
      alliumCollection: alliumCollection ?? this.alliumCollection,
      alliumState: alliumState ?? this.alliumState,
      alliumErrorMessage:
          alliumErrorMessage ?? this.alliumErrorMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        organicCollection,
        organicErrorMessage,
        organicState,
        mixedVegetablesCollection,
        mixedVegetablesErrorMessage,
        mixedVegetablesState,
        rootCollection,
        rootErrorMessage,
        rootState,
        alliumCollection,
        alliumErrorMessage,
        alliumState,
      ];
}
